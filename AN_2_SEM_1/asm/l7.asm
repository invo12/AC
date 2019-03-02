.586
.model flat,stdcall
.stack 1024
ExitProcess PROTO,dwExitCode:DWORD

.data
;1
;a db 'salataE',0

;2
;a dw 2,4,7,3,1
;lungime dd 5

;3
;a dd -2,4,-7,-3,1
;lungime dd 5

;4
;a db 'r2ek13uqdd',0

;5
a db 'r2ek13uqdd',0
car db 'd'

.code
;1
;nrVocale proc
;	push ebp
;	mov ebp,esp
;	mov ebx,[ebp + 8]
;	xor eax,eax
;	xor ecx,ecx
;bucla:
;	mov dl,[ebx + ecx]
;	cmp dl,0
;	je afara
;cmp dl,'a'
;	jne dupaa
;	inc ecx
;	inc eax
;	jmp bucla
;dupaa:
;cmp dl,'A'
;	jne dupaa1
;	inc ecx
;	inc eax
;	jmp bucla
;dupaa1:
;cmp dl,'e'
;	jne dupae
;	inc ecx
;	inc eax
;	jmp bucla
;dupae:
;cmp dl,'E'
;	jne dupae1
;	inc ecx
;	inc eax
;	jmp bucla
;dupae1:
;cmp dl,'i'
;	jne dupai
;	inc ecx
;	inc eax
;	jmp bucla
;dupai:
;cmp dl,'I'
;	jne dupai1
;	inc ecx
;	inc eax
;	jmp bucla
;dupai1:
;cmp dl,'o'
;	jne dupao
;	inc ecx
;	inc eax
;	jmp bucla
;dupao:
;cmp dl,'O'
;	jne dupao1
;	inc ecx
;	inc eax
;	jmp bucla
;dupao1:
;cmp dl,'u'
;	jne dupau
;	inc ecx
;	inc eax
;	jmp bucla
;dupau:
;cmp dl,'U'
;	jne dupau1
;	inc ecx
;	inc eax
;	jmp bucla
;dupau1:
;	inc ecx
;	jmp bucla
;afara:
;pop ebp
;	ret 4
;nrVocale endP

;2
;max = a[0]
;for(int i = 1;i < lungime;++i)
;{
;	if(a[i] > max)
;		max = a[i];
;}

;maxim16 proc
;	push ebp
;	mov ebp,esp
;	mov ebx,[ebp + 8]	;ebx = &a
;	mov edi,[ebp + 12]	;edi = lungime
;	mov ax,[ebx]		;max = a[0]
;	mov ecx,1
;bucla:
;	cmp ecx,edi
;	jge afara
;	mov dx,[ebx + 2 * ecx]	;se inmulteste cu 2 fiindca elementele vectorului sunt tip word(2 oct)
;	cmp dx,ax
;	jbe dupa
;	mov ax,dx
;	dupa:
;	inc ecx
;	jmp bucla
;afara:
;	pop ebp
;	ret 8
;maxim16 endP

;3
;min = a[0]
;for(int i = 1;i < lungime;++i)
;{
;	if(a[i] < min)
;		min = a[i];
;}

;minim32 proc
;	push ebp
;	mov ebp,esp
;	mov ebx,[ebp + 8]	;ebx = &a
;	mov edi,[ebp + 12]	;edi = lungime
;	mov eax,[ebx]		;max = a[0]
;	mov ecx,1
;bucla:
;	cmp ecx,edi
;	jge afara
;	mov edx,[ebx + 4 * ecx]	;se inmulteste cu 4 fiindca elementele vectorului sunt tip double word(4 oct)
;	cmp edx,eax
;	jge dupa
;	mov eax,edx
;	dupa:
;	inc ecx
;	jmp bucla
;afara:
;	pop ebp
;	ret 8
;minim32 endP

;4
;min = a[0]
;max = a[0]
;i = 1
;while(a[i] != '\0')		;0 in asm
;{
;	if(a[i] < min)
;		min = a[i];
;	if(a[i] > max)
;		max = a[i];
;	++i;
;}

;minMaxSir proc
;	push ebp
;	mov ebp,esp
;	mov ebx,[ebp + 8]	;a
;	mov al,[ebx]		;min = a[0]
;	mov ah,[ebx]		;max = a[0]
;	mov ecx,1			;i = 1
;bucla:
;	mov dl,[ebx + ecx]	;dl = a[i]
;	cmp dl,0			
;	je afara
;	cmp al,dl			
;	jbe dupa1
;	mov al,dl
;dupa1:
;	cmp ah,dl
;	jge dupa2
;	mov ah,dl
;dupa2:
;	inc ecx
;	jmp bucla
;afara:
;	pop ebp
;	ret 4
;minMaxSir endP

;5
;i = 0
;while(a[i] != '\0')		;0 in asm
;{
;	if(a[i] == car)
;		++eax;
;	++i;
;}

;nrAparitii proc
;	push ebp
;	mov ebp,esp
;	mov ebx,[ebp + 8]	;ebx = &a
;	mov edx,[ebp + 12]	;dl = car
;	xor ecx,ecx
;	mov dh,[ebx]
;	xor eax,eax
;bucla:
;	cmp dh,0
;	je afara
;	mov dh,[ebx + ecx]
;	cmp dh,dl
;	jne dupa
;	inc eax
;dupa:
;	inc ecx
;	jmp bucla
;afara:
;	pop ebp
;	ret 8
;nrAparitii endP

main proc
	;1
	;push offset a
	;call nrVocale
	
	;2
	;push lungime
	;push offset a
	;call maxim16

	;3
	;push lungime
	;push offset a
	;call minim32
	
	;4
	;push offset a
	;call minMaxSir

	;5
	;xor eax,eax
	;mov al,car
	;push eax
	;push offset a
	;call nrAparitii
	
	INVOKE ExitProcess,0
main endP
end main