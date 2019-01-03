.586
.model flat,stdcall

.stack 1024

ExitProcess proto,dwExitCode:dword
.data

;1
;	a db 56 DUP(?)

;2,3
;a db '12345',0
;b dd ?

;5
a dd 5,4,3,2,1 
lungime dd 5

.code

;for(int i = 0;i < 10;++i)
;{
;	for(int j = 0;j <= i;++j)
;	{
;		Adauga('A' + i);
;	}
;}

;1	
;sir macro s
;LOCAL bucla1,bucla2,afara1,afara2	;pun etichetele locale ca sa evit erorile
;	lea eax,s		;pun adresa lu s in eax
;	xor edx,edx		;edx = 0
;	xor ecx,ecx		;i = 0
;	xor esi,esi		;esi e folosit pentru a parcurge sirul de caractere de la prima la ultima pozitie
;bucla1:			
;	cmp ecx,10		
;	jge afara1
;	xor ebx,ebx		;j = 0
;bucla2:
;	cmp ebx,ecx		;e j < i?
;	jg afara2
;	mov dl,'A'			;fac d = 'A'
;	add dl,cl			;d += i
;	mov [eax + esi],dl	;a[i] = d;
;	inc esi				;cresc esi ca sa trec la urm poz
;	inc ebx				;j++
;	jmp bucla2			
;afara2:
;	inc ecx				;i++
;	jmp bucla1
;afara1:
;	mov dl,0
;	mov [eax + esi],dl	;pune \0 la finalul sirului
;endM

;2
;i = 0
;b = 0
;while(a[i] != '\0')
;{
;	b = b * 10 + (a[i] - '0');
;	++i;
;}

;_atou proc
;	push ebp
;	mov ebp,esp
;	mov ebx,[ebp + 12]
;	mov edi,[ebp + 8]
;	xor edx,edx
;	xor ecx,ecx
;	mov [ebx],edx
;	mov esi,10
;bucla:
;	mov dl,[edi + ecx]	;pun caracterul in dl
;	cmp dl,0			;daca n-am ajuns la finalul
;	je afara			;sirului
;	sub dl,'0'			;fac dl-ul din ASCII in nr
;	push edx			;salvez edx fiindca va fi modificat de inmultire
;	mov eax,[ebx]		;pune in eax valoarea de la adresa lu ebx (b-ul)
;	mul esi				;eax = eax * 10 ,edx = 0
;	pop edx				;refac edx
;	add eax,edx			;adaug valoarea anterioara (eax = eax + edx) 
;	mov [ebx],eax		;salvez valoarea in b
;	inc ecx				;cresc ecx
;	jmp bucla			;sar inapoi sus
;afara:
;pop ebp					;scot ebp din stiva
;	ret 8				;scot adresele lu a si b
;_atou endP

;3
;_atoi proc
;	push ebp
;	mov ebp,esp
;	mov ebx,[ebp + 12]
;	mov edi,[ebp + 8]
;	mov dl,[edi]
;	cmp dl,'-'
;	jne dupa
;	mov ebp,0
;dupa:
;	xor edx,edx
;	xor ecx,ecx
;	mov [ebx],edx
;	mov esi,10
;bucla:
;	mov dl,[edi + ecx]	
;	cmp dl,0			
;	je afara			
;	sub dl,'0'			
;	push edx			
;	mov eax,[ebx]		
;	mul esi				
;	pop edx				
;	add eax,edx			
;	mov [ebx],eax		
;	inc ecx				
;	jmp bucla			
;afara:				
;	cmp ebp,0		;facem aceleasi lucruri la atoi doar ca
;	jne dupa1		;daca semnul e -
;	mov eax,[ebx]	;luam valoarea negativa
;	xor edx,edx		;pe care o obtinem ca
;	sub edx,eax		;b = 0 - b;
;	mov [ebx],edx
;dupa1:
;pop ebp	
;	ret 8	
;_atoi endP

main proc
	;1
	;sir a			;apelez MACRO
	;xor ecx,ecx	;initializez contorul
	;n-am mai folosit fct de afisare pe ecran,daca vreti puneti-o voi
;bucla3:
	;cmp ecx,56		
	;jge afara3
	;mov al,[a + ecx]
	;inc ecx
	;jmp bucla3
;afara3:

;2
	;push offset b	;punem pointerul la nr
	;push offset a	;si la sir
	;call _atou

;3
	;push offset b
	;push offset a
	;call _atoi
;4 convertiti procedurile in macro-uri BAFFTAAA
;5
;ok = 0
;while(!ok)
;{
;	ok = 1;
;	for(int i = 0; i < lungime - 1;++i)
;	{
;		if(a[i] > a[i+1])
;		{
;			Interschimb(a[i],a[i+1]);
;			ok = 0;
;		}
;	}
;}

;	xor esi,esi		;ok = 0
;	mov edx,lungime
;	dec edx			;punem in edx = lungime - 1
;bucla_while:
;	cmp esi,0
;	jne afara_while
;	mov esi,1		;ok = 1
;	xor ecx,ecx		;i = 0
;bucla_for:
;	cmp ecx,edx
;	jge afara_for
;	mov eax,[a + 4 * ecx]				;eax = a[i]
;	mov ebx,[a + 4 * ecx + 4]			;ebx = a[i + 1]
;	cmp eax,ebx							;if(a[i] > a[i+1])
;	jbe afara_if
;		mov [a + 4 * ecx],ebx			;interschimbare
;		mov [a + 4 * ecx + 4],eax		
;		xor esi,esi						;ok = 0
;	afara_if:
;	inc ecx
;	jmp bucla_for
;afara_for:
;	jmp bucla_while
;afara_while:
	INVOKE ExitProcess,0
main endP
end main