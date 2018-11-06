.586
.model flat,stdcall

.stack 1024

ExitProcess proto,dwExitCode:dword

.data
;1
;a dd 5
;b dd 9
;cd dd 12
;d dd 7

;2
;c1 dd 100000
;c2 dd 5

;3
;n1 dd 2
;n2 dd 4
;n3 dd 3

;4,5,6,7
;a dd 1,2,3,4,5,6,7
;lungime dd 7
;par dd 2
.code
main proc
	;1
	;xor edx,edx
	;mov ecx,4
	;mov eax,a
	;add eax,b
	;add eax,cd
	;add eax,d
	;div ecx

	;2
	;xor edx,edx
	;mov eax,c1
	;mul c1
	;mov ecx,edx
	;mov ebx,eax
	;mov eax,c2
	;mul c2
	;add eax,ebx
	;adc edx,ecx

	;3
	;mov eax,n1
	;cmp eax,n2
	;ja maimare
	;mov eax,n2
	;maimare:
	;	cmp eax,n3
	;	ja maxim
	;	mov eax,n3
	;maxim:

	;4
	;mov ebx,a
	;mov ecx,1
	;adunare:
	;	cmp ecx,lungime
	;	je afara
	;	add ebx,[a+ecx*4]
	;	inc ecx
	;	jmp adunare
	;afara:
	;mov eax,ebx
	;xor edx,edx
	;div lungime
	
	;5
	;mov ebx,a
	;mov ecx,1
	;maxim:
	;	cmp ecx,lungime
	;	je afara
	;	cmp ebx,[a+ecx*4]
	;	ja better
	;	mov ebx,[a+ecx*4]
	;	better:
	;		inc ecx
	;		jmp maxim
	;afara:

	;6
	;mov ecx,0
	;xor edx,edx
	;mov ebx,0
	;pare:
	;	cmp ecx,lungime
	;	je afara
	;	mov eax,[a+ecx*4]
	;	div par 
	;	cmp edx,0
	;	jne better
	;	inc ebx
	;	better:
	;		inc ecx
	;		jmp pare
	;afara:

	;7
	;mov ebx,0
	;mov ecx,lungime
	;dec ecx
	;bucla:
	;	cmp ecx,ebx
	;	jb afara
	;	mov eax,[a + ebx * 4]
	;	mov edx,[a + ecx * 4]
	;	mov [a + ebx * 4],edx
	;	mov [a + ecx * 4],eax
	;	inc ebx
	;	dec ecx
	;	jmp bucla
	;afara:
invoke ExitProcess,0
main endp
end main