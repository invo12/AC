include c:/masm32/include/masm32rt.inc

ELEM STRUCT
	next dd NULL
	data dd NULL
ELEM ENDS

STIVA STRUCT
	first dd NULL
STIVA ENDS

.data
	stdIn dd ?
	stdOut dd ?
	Vkey dd ?
	Stiva STIVA {}
	currentOption dd ?
.code
start:

main proc
	invoke GetStdHandle,STD_INPUT_HANDLE
	mov stdIn,eax
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov stdOut,eax

	mov currentOption,0
	call ShowStiva
	.repeat
		call getCh
		mov Vkey,edx
		switch Vkey
			case VK_W
				mov eax,currentOption
				.if eax != 0
					dec eax
					mov currentOption,eax
				.endif
				call ShowStiva
			case VK_S
				mov eax,currentOption
				.if eax != 2
					inc eax
					mov currentOption,eax
				.endif
				call ShowStiva
			case VK_RETURN
				call executeCurrentCommand
				call ShowStiva
		endsw
	.until 0
	ret
main endP

executeCurrentCommand proc
	switch currentOption
		case 0
			call pushStiva
			call ShowStiva
		case 1
			call popStiva
			call ShowStiva
		case 2
			call iesireProgram
	endsw
	ret
executeCurrentCommand endP

iesireProgram proc
	.while Stiva.first != NULL
			call popStiva
	.endW
	exit
iesireProgram endP

pushStiva proc
	mov ebx,halloc(SIZEOF(ELEM))
	mov eax,Stiva.first
	.if eax != NULL
		mov [ebx].ELEM.next,eax
		mov Stiva.first,ebx
	.else
		mov [ebx].ELEM.next,NULL
		mov Stiva.first,ebx
	.endif

	mov esi,input("elem de inserat:")
	mov ecx,len(esi)
	inc ecx

	push ecx
	mov edi,halloc(ecx)
	pop ecx

	mov [ebx].ELEM.data,edi
	rep movsb

	ret
pushStiva endP

popStiva proc
	mov ebx,Stiva.first
	.if ebx != NULL
		mov ecx,[ebx].ELEM.next
		.if ecx == NULL
			mov Stiva.first,NULL
		.else
			mov Stiva.first,ecx
		.endif
		mov edi,ebx
		hfree([edi].ELEM.data)
		hfree(edi)
	.endif
	ret
popStiva endP

ShowStiva proc
	cls
	invoke SetConsoleTextAttribute,stdOut,00Ah
	.if currentOption == 0
		invoke SetConsoleTextAttribute,stdOut,004h
	.endif
	printf("INERARE STIVA\n")	;optiune1
	invoke SetConsoleTextAttribute,stdOut,00Ah

	.if currentOption == 1
		invoke SetConsoleTextAttribute,stdOut,004h
	.endif
	printf("SCOATERE STIVA\n")	;optiune2
	invoke SetConsoleTextAttribute,stdOut,00Ah

	.if currentOption == 2
		invoke SetConsoleTextAttribute,stdOut,004h
	.endif
	printf("MARS AFARA\n")		;iesire
	invoke SetConsoleTextAttribute,stdOut,00Ah
	mov ebx,Stiva.first
	.if ebx == NULL
		printf("STIVA GOALA\n")
	.endif
	.while ebx != NULL
		.if ebx == Stiva.first
			mov eax,'@'
		.else
			mov eax,' '
		.endif
		printf("%c %s\n",eax,[ebx].ELEM.data)
		mov ebx,[ebx].ELEM.next
	.endw
	ret
ShowStiva endP

getCh proc

	LOCAL lpBuffer : INPUT_RECORD
	LOCAL lpRecord : DWORD
	invoke ReadConsoleInput,stdIn,addr lpBuffer,1,addr lpRecord
	.if(lpBuffer.EventType == KEY_EVENT) && lpBuffer.KeyEvent.bKeyDown
		movzx eax,lpBuffer.KeyEvent.UnicodeChar
		movzx edx,lpBuffer.KeyEvent.wVirtualKeyCode
	.else
		xor eax,eax
		xor edx,edx
	.endif
	ret
getCh endP

end start