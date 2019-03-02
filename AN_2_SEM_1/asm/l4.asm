.586
.model flat,stdcall

.stack 1024

ExitProcess proto,dwExitCode:dword
.data
;2
;a dd 2
;b dd 3

;4
;mesaj db "()(())",0

;5
;expresie db '123++',0

;6
a dd 1,2,12,100,5,6,7,8
lungime dd 8
par dd 2
.code

;6
;media proc
;	push ebp
;	mov ebp,esp
;	mov eax,[ebp+8]		;a
;	mov edx,[ebp+12]	;lungime
;	xor ecx,ecx
;	xor ebx,ebx
;bucla:
;	cmp ecx,edx
;	jae afara
;	add ebx,[eax+4*ecx]
;	inc ecx
;	jmp bucla
;afara:
;	mov eax,ebx
;	mov ecx,edx
;	xor edx,edx
;	div ecx
;	pop ebp
;	ret
;media endP

;6
;maxim proc
;	push ebp
;	mov ebp,esp
;
;	mov eax,[ebp+8]	;a
;	mov eax,[eax]
;	mov edx,[ebp+12];lungime
;	mov ecx,1
;
;bucla:
;	cmp ecx,edx
;	jae afara
;	mov ebx,[ebp + 8]
;	mov ebx,[ebx + 4 * ecx]
;	inc ecx
;	cmp eax,ebx
;	ja bucla
;	mov eax,ebx
;	jmp bucla
;afara:
;	pop ebp
;	ret
;maxim endP

;valoriPare proc
;	push ebp
;	mov ebp,esp
;
;	xor ebx,ebx
;	mov ecx,[ebp+12]	;lungime
;	dec ecx
;bucla:
;	xor edx,edx
;	cmp ecx,0
;	je afara
;	mov eax,[ebp + 8]
;	mov eax,[eax + 4 * ecx]
;	dec ecx
;	div par
;	cmp edx,0
;	jne bucla
;	inc ebx
;	jmp bucla
;afara:
;	pop ebp
;	mov eax,ebx
;	ret
;valoriPare endP

main proc
	;1
	;mov eax,2
	;mov ebx,3
	;push eax
	;push ebx
	;pop eax
	;pop ebx

	;2
	;push [a]
	;push [b]
	;pop [a]
	;pop [b]

	;3
	;mov ax,2
	;mov bx,3
	;mov cx,4
	;mov dx,5
	;push ax
	;push bx
	;push cx
	;push dx
	;pop ax
	;pop dx
	;pop cx
	;pop bx

	;4
;	xor ecx,ecx
;	mov ebp,esp
;citire:
;	mov al,[mesaj + ecx]
;	inc ecx
;	cmp al,'('
;	jne inchisa
;	push 1
;	jmp citire
;inchisa:
;	cmp al,')'
;	jne terminator
;	cmp ebp,esp
;	je eroare
;	pop ebx
;	jmp citire
;terminator:
;	cmp al,0
;	jne eroare
;	cmp ebp,esp
;	jne eroare
;	jmp succes
;
;eroare:
;	mov eax,0
;	jmp afara
;succes:
;	mov eax,1
;afara:

	;5
;	xor ecx,ecx
;	xor eax,eax
;	mov ebp,esp
;citire:
;	mov al,[expresie + ecx]
;	inc ecx
;	cmp al,'0'
;	jb operator
;	cmp al,'9'
;	ja eroare
;	sub al,'0'
;	push eax
;	jmp citire
;operator:
;	cmp al,'+'
;	je adunare
;	cmp al,'-'
;	je scadere
;	cmp al,'*'
;	je inmultire
;	cmp al,'/'
;	je impartire
;	cmp al,0
;	jne eroare
;	sub ebp,4
;	cmp esp,ebp
;	jne eroare
;	pop eax
;	jmp terminare
;adunare:
;	cmp ebp,esp
;	je eroare
;	pop eax
;	cmp ebp,esp
;	je eroare
;	pop ebx
;	add al,bl
;	push eax
;	jmp citire
;scadere:
;	cmp ebp,esp
;	je eroare
;	pop eax
;	cmp ebp,esp
;	je eroare
;	pop ebx
;	sub eax,ebx
;	push eax
;	jmp citire
;inmultire:
;	cmp ebp,esp
;	je eroare
;	pop eax
;	cmp ebp,esp
;	je eroare
;	pop ebx
;	xor edx,edx
;	mul ebx
;	push ebx
;	jmp citire
;impartire:
;	cmp ebp,esp
;	je eroare
;	pop eax
;	cmp ebp,esp
;	je eroare
;	pop ebx
;	xor edx,edx
;	div ebx
;	push eax
;	jmp citire
;eroare:
;	mov eax,0
;terminare:

	;6
	;lea eax,a
	;push lungime
	;push eax
	;call media				;rezultatele returnate de functii
	;call maxim				;sunt in EAX
	;call valoriPare
	;add esp,8
	invoke ExitProcess,0
main endP
end main