;pentru compilare in visual studio
; descarcati de pe moodle din pagina ToolsPLA
; arhiva masm32_preinstalled.zip
; si extrageti continutul in radacina discului C:
.386
.model flat, stdcall

include c:\masm32\include\msvcrt.inc
includelib c:\masm32\lib\msvcrt.lib
include c:\masm32\include\kernel32.inc
includelib c:\masm32\lib\kernel32.lib
;include c:\masm32\include\masm32.inc ;in Visual studio this include redefines already included symbols
includelib c:\masm32\lib\masm32.lib
StdOut       PROTO :DWORD			  ;in Visual studio this is required

PutCh1 macro a				;put <a> char on screen
	mov byte ptr CHR, a
    INVOKE StdOut, ADDR CHR
ENDM

PutCh2 macro a, b			;put chars <a> and <b> on screen
	PutCh1 a
	PutCh1 b
ENDM

PutU PROTO C nr:DWORD
PutH PROTO C nr:DWORD
PutI PROTO C nr:DWORD
printf PROTO C format:DWORD, args:VARARG

;1
concat PROTO p1:DWORD,p2:DWORD,p3:DWORD
;2
inter PROTO p1:DWORD,p2:DWORD,p3:DWORD
;3
minSir PROTO p1:DWORD,min:DWORD
;4
bubble PROTO s:DWORD
.data
    CHR   db 0,0
	sir   db "printf test: sir1=""%s"", sir2=""%s""\nnr1=%u, nr2=%i, long=%li,\nchar='%c', pointer=%p", 0
    psir1 db "bla",0
    psir2 db "bla bla",0
    int1  dw 10000
    int2  dw -5555
    long  dd -1234567
    chr2   db '*'
	;1,2,4
	a db "Andrei",0
	b db " Dan",0
	d db 100 DUP(?)
	;3
	v dd 12,3,-4,5,6
	minim dd ?
	lungime dd 5
.code

main proc
	;1
	;invoke concat,addr d,addr a,addr b
	
	;2
	;invoke inter,addr d,addr a,addr b
        
	;3
	;invoke minSir,addr v,addr minim
	
	;4
	invoke bubble,addr a
		invoke printf, addr sir, addr a, addr psir2, int1, int2, minim, chr2, addr sir       
 		call crt__getch
	exit:
		invoke ExitProcess, 0                 ; invoke ExitProcess API
main endp

;1
;i = 0
;j = 0
;while(b[i] != 0)
;{
;	a[j] = b[i];
;	++i;
;	++j;
;}
;i = 0;
;while(c[i] != 0)
;{
;	a[j] = c[i];
;	++i;
;	++j;
;}
;a[j] = '\0';

;1
concat proc uses ebx ecx edx edi p1:DWORD,p2:DWORD,p3:DWORD		;uses imi restaureaza valorile de dinaintea apelului fct,atunci cand se termina fct
	xor eax,eax		;j = 0
	mov ebx,p2		;ebx = &b
	mov edi,p1		;edi = &a
	xor ecx,ecx		;i = 0
buclaSir1:
	mov dl,[ebx + ecx]	;dl = b[i]
	cmp dl,0			;dl != 0 ?
	je afara1			
	mov [edi + eax],dl	;a[j] = b[i]
	inc ecx				;++i
	inc eax				;++j
	jmp buclaSir1
afara1:
mov ebx,p3				;ebx = &c
xor ecx,ecx				;i = 0
buclaSir2:
	mov dl,[ebx + ecx]	;dl = c[i]
	cmp dl,0			;dl != 0?
	je afara2		
	mov [edi + eax],dl	;a[j] = c[i]
	inc ecx				;++i
	inc eax				;++j
	jmp buclaSir2
afara2:
	mov [edi + eax],dl	;pun la final \0		
	ret
concat endP

;2
;ok = 1;
;i = 0;
;j = 0;
;k = 0;
;while(ok)
;{
;	ok = 0;
;	if(b[i] != '\0')
;	{
;		a[j] = b[i];
;		++j;
;		++i;
;		ok = 1;
;	}
;	if(c[k] != '\0')
;	{
;		a[j] = c[k]
;		++j;
;		++k;
;		ok = 1;
;	}
;}

;2
inter proc uses ebx ecx edx esi edi p1:DWORD,p2:DWORD,p3:DWORD
	xor eax,eax		;j = 0	
	xor ebx,ebx		;i = 0
	xor ecx,ecx		;k = 0
	mov dh,1		;ok = 1
	mov esi,p1		;esi = &a
bucla_while:
	cmp dh,1					;ok = 1 ?
	jne afara_while			
	xor dh,dh					;ok = 0
	mov edi,p2					;edi = &b
	mov dl,[edi + ebx]	;dl = b[i]
	cmp dl,0					;b[i] = 0 ?
	je dupa1					
	mov [esi + eax],dl			;a[j] = b[i]
	inc eax						;++j
	inc ebx						;++i
	mov dh,1					;ok = 1
dupa1:
	mov edi,p3				;edi = &c
	mov dl,[edi + ecx]		;dl = c[k]
	cmp dl,0				;c[k] = 0 ?
	je dupa2
	mov [esi + eax],dl		;a[j] = c[k]
	inc eax					;++j
	inc ecx					;++k
	mov dh,1				;ok = 1
dupa2:
	jmp bucla_while
afara_while:
	mov [esi + eax],dh		;a[j] = 0
	ret
inter endp

;3
;min = a[0]
;for(int i = 1;i < lungime;++i)
;{
;	if(min > a[i])
;		min = a[i];
;}

;3
minSir proc uses eax ebx ecx edx p1:DWORD,min:DWORD
mov eax,p1		;eax = &v
mov ebx,[eax]	;min = a[0]
mov ecx,1		;i = 1
bucla_for:
	cmp ecx,lungime
	jge afara_for
	mov edx,[eax + 4 * ecx]		;edx = a[i] si se inmulteste cu 4 fiindca e vector de double word pt care fiecare element ocupa 4 octeti
	cmp ebx,edx
	jbe dupa_for
	mov ebx,edx
dupa_for:
	inc ecx
	jmp bucla_for
afara_for:
	mov eax,min
	mov [eax],ebx
	ret
minSir endP

;4
;while(!ok)
;{
;	ok = 1;
;	while(a[i + 1] != '\0')
;	{
;		if(a[i] > a[i+1])
;		{
;			Interschimb(a[i],a[i+1]);
;			ok = 0;
;		}
;	}
;}

;4
bubble proc uses eax ebx ecx edx esi edi s:DWORD
	xor esi,esi		;ok = 0
	mov edi,s		;edi = &s
bucla_while1:
	cmp esi,0
	jne afara_while1
	mov esi,1		;ok = 1
	xor ecx,ecx		;i = 0
bucla_for1:
	mov dl,[edi + ecx + 1]			;dl = a[i+1]
	cmp dl,0
	je afara_for1
	mov dh,[edi + ecx]				;dh = a[i]
	cmp dh,dl							;if(a[i] > a[i+1])
	jbe afara_if1
		mov [edi + ecx],dl			;interschimbare
		mov [edi + ecx + 1],dh		
		xor esi,esi						;ok = 0
	afara_if1:
	inc ecx
	jmp bucla_for1
afara_for1:
	jmp bucla_while1
afara_while1:
	ret
bubble endP

printf Proc C uses esi edi format:DWORD, args:VARARG      
    sub  edi, edi
    mov  esi, format                   ; ESI pointer la sir formatat
    dec  esi
  printf_loop:
    inc  esi
    mov  al, [esi]
    test al, al
    je printf_done
    cmp  al, '%'
    jne  printf_char
    inc  esi
    mov  al, [esi]
    cmp  al, 's'
    je   printf_param_str
    cmp  al, 'd'
    je   printf_param_int
    cmp  al, 'i'
    je   printf_param_int
    cmp  al, 'u'
    je   printf_param_uint
    cmp  al, 'h'
    je   printf_param_hex
    cmp  al, 'p'
    je   printf_param_ptr
    cmp  al, 'c'
    je   printf_param_char
    cmp  al, '%'
    je   printf_normal_char
    cmp  al, 'l'
    jne  printf_loop
    inc  esi
    mov  al, [esi]
    cmp  al, 'd'
    je   printf_param_long_int
    cmp  al, 'i'
    je   printf_param_long_int
    cmp  al, 'u'
    je   printf_param_long_uint
    cmp  al, 'h'
    je   printf_param_long_hex      
    jmp  printf_loop
  printf_char:
    cmp al, '\'
    jne printf_normal_char
    inc esi
    mov al, [esi]
    cmp al, 'n'
    je  printf_crlf
    cmp al, '\'
    jne printf_loop
  printf_normal_char:  
    PutCh1 al
    jmp  printf_loop
  printf_param_str:
    invoke StdOut, dword ptr args[edi]
    add  edi, 4
    jmp  printf_loop
  printf_param_int:
    movsx eax, word ptr args[edi]       ; pentru a extinde nr cu semn de la 16 la 32bit
    invoke PutI, eax               
    add  edi, 4                         ; invoke printf adauga "pushw 0" pt param 16bit  pentru pastrarea alinierii
    jmp printf_loop
  printf_param_uint:
    invoke PutU, dword ptr args[edi]                     
    add  edi, 4                         ; incrementez pozitia in lista de argumente
    jmp printf_loop
  printf_param_hex:
    PutCh2 '0', 'x'
    invoke PutH, dword ptr args[edi]                     
    add  edi, 4                         ; incrementez pozitia in lista de argumente
    jmp printf_loop
 printf_param_char:
    mov al, args[edi]                   ; citesc caracterul de pe stiva
    PutCh1 al                            ; Afisez
    add  edi, 4                         ; Eliberez stiva (2 octeti)
    jmp printf_loop
 printf_param_long_int:
    invoke PutI, dword ptr args[edi]                    
    add  edi, 4                         ; incrementez pozitia in lista de argumente
    jmp printf_loop
  printf_param_long_uint:
    invoke PutU, dword ptr args[edi]                    
    add  edi, 4                         ; incrementez pozitia in lista de argumente
    jmp printf_loop
  printf_param_long_hex:
    PutCh2 '0', 'x'
    invoke PutH, dword ptr args[edi]                    
    add  edi, 4                         ; incrementez pozitia in lista de argumente
    jmp printf_loop
  printf_param_ptr:
    invoke PutH, dword ptr args[edi]                    
    add  edi, 4                         ; incrementez pozitia in lista de argumente
    jmp printf_loop
  printf_crlf:
    PutCh2 10, 13
    jmp printf_loop
  printf_done:
  	Ret
printf EndP

PutU proc C uses edx ebx nr:DWORD  
 	mov  eax, nr		    ; EAX <- parametru din stiva
    xor  edx, edx   		; edx = 0
    mov  ebx, 10
    div  ebx        		; EDX:EAX / baza  (EAX=cat, EDX = rest) 
    test eax, eax   		; EAX == 0 (conditia de iesire)
    je PutU_Done  
    push edx 				; EDX (rest) -> stiva
    invoke PutU, eax
    pop  edx				; EDX <- stiva
  PutU_Done:
    add  dl, '0'     		; conversie cifra din DL in caracter ASCII 
    PutCh1 dl				
	Ret	
PutU EndP

PutH proc C uses edx ebx nr:DWORD
 	mov  eax, nr    		; EAX <- parametru din stiva
    xor  edx, edx   		; edx = 0
    mov  ebx, 16
    div  ebx        		; EDX:EAX / baza  (EAX=cat, EDX = rest)
    test eax, eax   		; EAX == 0 (conditia de iesire)
    je PutH_Done
    push edx 				; EDX (rest) -> stiva
    invoke PutH, eax
    pop  edx				; EDX <- stiva
  PutH_Done:
    cmp  dl, 10				; compar cifra cu 10
    jb  PutH_Cifra09		; daca este mai mica = cifra zecimala (0-9)
    add  dl, ('A'-10)-'0' ; 
  PutH_Cifra09: 
    add  dl, '0'     		; conversie cifra din DL in caracter ASCII  
    PutCh1 dl				; refacere stiva
	Ret	
PutH EndP

PutI proc C nr:DWORD          		; parametri: numar cu semn      
 	mov  eax, nr		    ; EAX <- parametru din stiva
    cmp  eax, 0
    jge  PutI_Pozitiv		; salt daca param 1 este pozitiv 	
    PutCh1 '-'               ; afisare '-'     
    mov  eax, [ebp+8]		; reincarc EAX (midificat de afisare '-')
    neg  eax				; inversez semnul (EAX devine pozitiv)
   PutI_Pozitiv:	 
    invoke PutU, eax
	Ret
PutI EndP

end main