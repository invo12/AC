;Recursively print digit by digig to console an unsigned 32 bit integer using Windows API

.686
.MODEL flat, stdcall

;Windows API prototypes used for invoke
 ;https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess
 ExitProcess PROTO, dwExitCode: DWORD 

 ;https://docs.microsoft.com/en-us/windows/console/getstdhandle
 GetStdHandle PROTO, nStdHandle: DWORD 
 STD_OUTPUT_HANDLE EQU -11 
 
 ;https://docs.microsoft.com/en-us/windows/console/writeconsole
 WriteConsoleA PROTO, handle: DWORD, lpBuffer:PTR VOID, nNumberOfBytesToWrite:DWORD, lpNumberOfBytesWritten:PTR DWORD, lpReserved:DWORD
  
.data
 consoleOutHandle dd ? 
a dd 100,-15,-20,400,-17 
lungime dd 5
par dd 2
.code

 printChar proc ;print the char in DL register to console using Windows API calls
  pushad							;context saving
  ;local variable allocation and init
  push dx							;allocate 2 char buffer on stack and init it with dx
  mov eax, esp						;put buffer start address in eax
  push eax							;allocate 32 bit variable on stack for bytesWritten output
  mov ebx, esp						;put bytesWritten variable address in ebx
  ;WriteConsole parameter passing
  ;INVOKE WriteConsoleA, consoleOutHandle, eax, 1, ebx, 0; invoke explicitat prin push si call
  push 0							;reserved null pointer
  push ebx							;pointer to variable for getting the bytes written
  push 1							;number of character to write
  push eax							;pointer to the start of char buffer to write
  push consoleOutHandle				;console output operating system handle
  call WriteConsoleA				;placing operating system call
  ;local variable deallocation
  pop edx							;dealloc bytesWritten local variable
  pop dx							;dealloc output buffer local variable
  popad								;context restoration
  ret
 printChar endp
 		
 printDigit proc ;primeste o valoare intre 0 si 9 inclusiv in reg DL si o afiseaza in consola
  ;context saving
  pushad							;save regs for later
  
  ;to ascii conversion
  cmp dl,10
  jae litera
  add dl, '0'			     		;conversie cifra din DL in caracter ASCII
  jmp afara
litera:
  add dl,'A'
  sub dl,10
afara:
  call printChar

  ;context restoration
  popad								;restore context
  ret								;return e
 printDigit endp
 
 PutU32 proc           				; parametri: numarfara semn, baza
   push ebp
   mov ebp,esp
   push edx        					; salvare registri utilizati
   push ebx
   mov eax,[ebp + 8]
   test eax, eax   					; EAX == 0 (conditia de iesire)
   je PutU_Done   
   xor  edx, edx
   mov  ebx, 10
   div  ebx        					; EDX:EAX / baza  (EAX=cat, EDX = rest)
   push edx 						; EDX (rest) -> stiva
   push eax
   call PutU32						; apel recursiv
   pop eax
   pop  edx							; EDX <- stiva
   call printDigit					; afisare cifra
  PutU_Done:    
   pop  ebx         				; refacere registri utilizati
   pop  edx
   pop ebp
   ret	
 PutU32 EndP

 PutU32H proc           				; parametri: numarfara semn, baza
   push ebp
   mov ebp,esp
   push edx        					; salvare registri utilizati
   push ebx
   mov eax,[ebp + 8]
   test eax, eax   					; EAX == 0 (conditia de iesire)
   je PutUH_Done   
   xor  edx, edx
   mov  ebx, 16
   div  ebx        					; EDX:EAX / baza  (EAX=cat, EDX = rest)
   push edx 						; EDX (rest) -> stiva
   push eax
   call PutU32H						; apel recursiv
   pop eax
   pop  edx							; EDX <- stiva
   call printDigit					; afisare cifra
  PutUH_Done:    
   pop  ebx         				; refacere registri utilizati
   pop  edx
   pop ebp
   ret	
 PutU32H EndP

  PutU32C proc           				; parametri: numarfara semn, baza
   push ebp
   mov ebp,esp
   push edx        					; salvare registri utilizati
   push ebx
   mov eax,[ebp + 8]
   mov ecx,[ebp + 12]
   test eax, eax   					; EAX == 0 (conditia de iesire)
   je PutUC_Done   
   xor  edx, edx
   mov  ebx, ecx
   div  ebx        					; EDX:EAX / baza  (EAX=cat, EDX = rest)
   push edx 						; EDX (rest) -> stiva
   push ecx
   push eax
   call PutU32C						; apel recursiv
   pop eax
   pop ecx
   pop  edx							; EDX <- stiva
   call printDigit					; afisare cifra
  PutUC_Done:    
   pop  ebx         				; refacere registri utilizati
   pop  edx
   pop ebp
   ret	
 PutU32C EndP

PutI proc
	test eax,eax
	je zero
	add eax,0
	js negativ
	jmp afisare
negativ:
	push ebx
	mov dl,'-'
	call printChar
	mov ebx,eax
	xor eax,eax
	sub eax,ebx
	pop ebx
afisare:
	push ecx
	push eax
	call PutU32C
	pop eax
	pop ecx
	jmp afara
 zero:
	mov dl,0
	call printDigit
afara:
	ret
PutI endP

main PROC
  ;initialize console output handle
  INVOKE GetStdHandle, STD_OUTPUT_HANDLE
  mov consoleOutHandle, eax 

  mov eax,a						; incarcare numar de afisat
  mov ecx,10
  xor ebx,ebx
bucla:
	cmp ebx,lungime
	jae afara
	mov eax,[a + ebx * 4]
	xor edx,edx
	push eax
	div par
	cmp edx,0
	jne impar
	pop eax
	call PutI
impar:
	pop eax
	inc ebx
	mov dl,' '
	call printChar
	jmp bucla
afara:
  INVOKE ExitProcess, 0				; exit app
 main ENDP
END main