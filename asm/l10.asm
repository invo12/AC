include c:\masm32\include\masm32rt.inc

ELEM Struct
    next dd NULL
    prev dd NULL
    text dd NULL
	sel db NULL
ELEM EndS

LIST Struct
    first dd NULL
    last dd NULL
    current dd NULL
LIST EndS

concat PROTO p1:DWORD,p2:DWORD,p3:DWORD
strcmp PROTO p1:DWORD,p2:DWORD

.data
  StdOutput DWORD ?
  StdInput DWORD ?
  VKey dd ?
  List LIST {} 
  

.code
  start:
  main proc
    invoke GetStdHandle, STD_OUTPUT_HANDLE
    mov StdOutput, eax 
    invoke GetStdHandle, STD_INPUT_HANDLE
    mov StdInput, eax

    call Show_List
    .repeat
        call getch
        mov VKey, edx
        switch VKey
            case VK_UP
                mov eax, List.current 
                .if [eax].ELEM.prev!=NULL
                    mov eax, [eax].ELEM.prev
                    mov List.current, eax
                    call Show_List
                .endif
            case VK_DOWN
                mov eax, List.current 
                .if [eax].ELEM.next!=NULL
                    mov eax, [eax].ELEM.next
                    mov List.current, eax 
                .endif
                call Show_List   
            case VK_F1
                call Add_FirstNode
                call Show_List
            case VK_F2
                call Add_AboveNode
                call Show_List
            case VK_F3
                call Add_BelowNode
                call Show_List    
            case VK_F4
                call Add_LastNode
                call Show_List
			case VK_F5
				call Concat_Above
				call Show_List
			case VK_F6
				call Concat_Below
				call Show_List
			case VK_F7
				call Sortare
				call Show_List
            case VK_F8
                call Stergere_Sel
                call Show_List      
            case VK_DELETE
                call Delete_Node 
                call Show_List
			case VK_SPACE
				mov ebx,List.current
				.if ebx != NULL
					.if [ebx].ELEM.sel == 0
						mov [ebx].ELEM.sel,1
					.else
						mov [ebx].ELEM.sel,0
					.endif
				.endif
				call Show_List
        endsw
    .until VKey==VK_ESCAPE
    call Delete_List
    
    exit
main endp

concat proc uses edi esi p1:DWORD,p2:DWORD,p3:DWORD
	mov esi,p2
	mov edi,p1
	mov ecx,len(p2)
	rep movsb
	mov esi,p3
	mov ecx,len(p3)
	inc ecx
	rep movsb
	ret
concat endP

Concat_Above proc

	mov esi,List.current
	.if esi != NULL
		mov edi,[esi].ELEM.prev
		.if edi != NULL
			mov ebx,len([edi].ELEM.text)
			add ebx,len([esi].ELEM.text)
			inc ebx

			mov ebx,halloc(ebx)
			INVOKE concat,ebx,[edi].ELEM.text,[esi].ELEM.text
		
			hfree([esi].ELEM.text)
			mov [esi].ELEM.text,ebx

			mov edx,[edi].ELEM.prev
			mov [esi].ELEM.prev,edx
			.if edx == NULL
				mov List.first,esi
			.else
				mov [edx].ELEM.next,esi
			.endif
			hfree([edi].ELEM.text)
			hfree(edi)
		.endif
	.endif
	ret
Concat_Above endP

Concat_Below proc

	mov esi,List.current
	.if esi != NULL
		mov edi,[esi].ELEM.next
		.if edi != NULL
			mov ebx,len([edi].ELEM.text)
			add ebx,len([esi].ELEM.text)
			inc ebx

			mov ebx,halloc(ebx)
			INVOKE concat,ebx,[esi].ELEM.text,[edi].ELEM.text
		
			hfree([esi].ELEM.text)
			mov [esi].ELEM.text,ebx

			mov edx,[edi].ELEM.next
			mov [esi].ELEM.next,edx
			.if edx == NULL
				mov List.last,esi
			.else
				mov [edx].ELEM.prev,esi
			.endif
			hfree([edi].ELEM.text)
			hfree(edi)
		.endif
	.endif
	ret
Concat_Below endP

Stergere_Sel proc

	mov ebx,List.first
	.while ebx != NULL
		.if [ebx].ELEM.sel == 1
			.if ebx == List.current
				mov esi,[ebx].ELEM.next
				.if	esi == NULL
					mov esi,[ebx].ELEM.prev
				.endif
				mov List.current,esi
			.endif
			mov eax,[ebx].ELEM.prev
			mov ecx,[ebx].ELEM.next
			.if eax != NULL
				mov [eax].ELEM.next,ecx
			.else
				mov List.first,ecx
			.endif
			.if ecx != NULL
				mov [ecx].ELEM.prev,eax
			.else
				mov List.last,eax
			.endif
			.if eax == NULL && ecx == NULL
				mov List.current,NULL
			.endif
			mov edi,ebx
			mov ebx,[ebx].ELEM.next
			hfree([edi].ELEM.text)
			hfree(edi)
		.else
			mov ebx,[ebx].ELEM.next
		.endif
	.endW
	ret
Stergere_Sel endP 

strcmp proc uses edi esi ecx p1:DWORD,p2:DWORD

	mov edi,p1
	mov esi,p2
	xor eax,eax
	xor ecx,ecx
	.while BYTE PTR[edi] != 0 && BYTE PTR[esi] != 0
		mov cl,BYTE PTR[edi]
		mov ch,BYTE PTR[esi]
		.if cl > ch
			mov eax,1
			ret
		.else
			.if cl < ch
				mov eax,-1
				ret
			.else
				inc esi
				inc edi
			.endif
		.endif
	.endW

	.if BYTE PTR[edi] != 0 && BYTE PTR[esi] == 0
		mov eax,1
	.else
		.if BYTE PTR[edi] == 0 && BYTE PTR[esi] != 0
			mov eax,-1
		.else
			mov eax,0
		.endif
	.endif
	ret
strcmp endP

Sortare proc
	mov esi,0	;ok = 0
	.while esi == 0
		mov esi,1
		mov ebx,List.first
		.if ebx != NULL
			mov edi,[ebx].ELEM.next
			.while edi != NULL
				INVOKE strcmp,[ebx].ELEM.text,[edi].ELEM.text
				.if eax == 1
					mov esi,0
					mov edx,[ebx].ELEM.prev
					.if edx == NULL
						mov List.first,edi
					.else
						mov [edx].ELEM.next,edi
					.endif
					mov [edi].ELEM.prev,edx

					mov edx,[edi].ELEM.next
					.if edx == NULL
						mov List.last,ebx
					.else
						mov [edx].ELEM.prev,ebx
					.endif
					mov [ebx].ELEM.next,edx

					mov [ebx].ELEM.prev,edi
					mov [edi].ELEM.next,ebx

				.endif
				mov ebx,edi
				mov edi,[edi].ELEM.next
			.endW
		.endif	
	.endW
	ret
Sortare endP

Add_FirstNode Proc 
    mov ebx, halloc(SIZEOF(ELEM))
    mov eax, List.first
    .if eax == NULL
        mov [ebx].ELEM.prev, NULL      
        mov [ebx].ELEM.next, NULL      
        mov List.first, ebx
        mov List.last, ebx
        mov List.current, ebx
        .else    
            mov [ebx].ELEM.prev, NULL      
            mov [ebx].ELEM.next, eax      
            mov [eax].ELEM.prev, ebx     
            mov List.first, ebx
    .endif    
    mov esi, input("First element: ")
    mov ecx, len(esi)                ; esi = strlen [ESI] 
    inc ecx                          ; ESI = strlen + 1
    push ecx
    mov edi, halloc(ecx)             ; halloc modifica eax, ecx
    pop ecx
    mov [ebx].ELEM.text, edi
    rep movsb                        ; strcpy: for (ECX!=0, ECX--) [EDI++] = [ESI++]
	mov [ebx].ELEM.sel,0
    Ret
Add_FirstNode EndP

Add_LastNode Proc 
    mov ebx, halloc(sizeof(ELEM))
    mov eax, List.last
    .if eax == NULL
        mov [ebx].ELEM.prev, NULL      
        mov [ebx].ELEM.next, NULL      
        mov List.first, ebx
        mov List.last, ebx
        mov List.current, ebx
        .else    
            mov [ebx].ELEM.prev, eax      
            mov [ebx].ELEM.next, NULL      
            mov [eax].ELEM.next, ebx     
            mov List.last, ebx
    .endif    
    mov esi, input("Last element: ")
    mov ecx, len(esi)                ; esi = strlen [ESI] 
    inc ecx                          ; ESI = strlen + 1
    push ecx
    mov edi, halloc(ecx)             ; halloc modifica eax, ecx
    pop ecx
    mov [ebx].ELEM.text, edi
    rep movsb                        ; strcpy: for (ECX!=0, ECX--) [EDI++] = [ESI++]
	mov [ebx].ELEM.sel,0
    Ret
Add_LastNode EndP

Add_AboveNode Proc 
    mov ebx, halloc(sizeof(ELEM))            
    mov eax, List.current
    .if eax == NULL
        mov [ebx].ELEM.prev, NULL      
        mov [ebx].ELEM.next, NULL      
        mov List.first, ebx
        mov List.last, ebx
        mov List.current, ebx
        .else    
            mov ecx, [eax].ELEM.prev    ; list.current.prev (ecx) - NEW(ebx) - list.current(eax)
            mov [ebx].ELEM.prev, ecx      
            mov [ebx].ELEM.next, eax      
            mov [eax].ELEM.prev, ebx
            .if ecx != NULL ;            eax == List.first
                mov [ecx].ELEM.next, ebx
                .else
                    mov List.first, ebx
            .endif     
        .endif    
    mov esi, input("Insert element (above): ")
    mov ecx, len(esi)                ; esi = strlen [ESI] 
    inc ecx                          ; ESI = strlen + 1
    push ecx
    mov edi, halloc(ecx)             ; halloc modifica eax, ecx
    pop ecx
    mov [ebx].ELEM.text, edi
    rep movsb                        ; strcpy: for (ECX!=0, ECX--) [EDI++] = [ESI++]
	mov [ebx].ELEM.sel,0
    Ret
Add_AboveNode EndP

Add_BelowNode Proc 
    mov ebx, halloc(sizeof(ELEM))            
    mov eax, List.current
    .if eax == NULL
        mov [ebx].ELEM.prev, NULL      
        mov [ebx].ELEM.next, NULL      
        mov List.first, ebx
        mov List.last, ebx
        mov List.current, ebx
        .else    
            mov ecx, [eax].ELEM.next    ; list.current(eax) - NEW(ebx) - list.current.next (ecx)
            mov [ebx].ELEM.prev, eax      
            mov [ebx].ELEM.next, ecx      
            mov [eax].ELEM.next, ebx
            .if ecx != NULL ;            eax == List.last
                mov [ecx].ELEM.prev, ebx
                .else
                    mov List.last, ebx
            .endif     
        .endif    
    mov esi, input("Insert element (below): ")
    mov ecx, len(esi)                ; esi = strlen [ESI] 
    inc ecx                          ; ESI = strlen + 1
    push ecx
    mov edi, halloc(ecx)             ; halloc modifica eax, ecx
    pop ecx
    mov [ebx].ELEM.text, edi
    rep movsb                        ; strcpy: for (ECX!=0, ECX--) [EDI++] = [ESI++]
	mov [ebx].ELEM.sel,0
    Ret
Add_BelowNode EndP

Delete_Node Proc
	mov ebx, List.current
    .if ebx !=NULL
        mov eax, [ebx].ELEM.prev
    	mov ecx, [ebx].ELEM.next                     ;  Prev(eax)  ToBeDeleted(ebx)  Next(ecx)
    	.if eax!=NULL
    		mov [eax].ELEM.next, ecx
        	mov List.current, eax
        	.else
        	   mov List.first, ecx
    	.endif
    	.if ecx!=NULL
    		mov [ecx].ELEM.prev, eax
    	    mov List.current, ecx
    	    .else
    	       mov List.last, eax
    	.endif
        .if eax==NULL && ecx==NULL  ; ultimul nod
            mov List.current, NULL
        .endif
        hfree([ebx].ELEM.text)
        hfree(ebx)
    .endif
	Ret
Delete_Node EndP

Show_List Proc
    cls
    invoke SetConsoleTextAttribute, StdOutput, 0FCh ; BG=White(15), Text=Red(12) 
    printf("F1=Add Top, F2=Add Above, F3=Add Below, F4=Add Bottom, Up/Down=Navigate, Del=Delete, F8=Delete Selected,Space=Select, ESC=Exit\n")  	
    invoke SetConsoleTextAttribute, StdOutput, 00Eh ; BG=Black(0), Text=Yellow(7)
    printf("\t  Prev     Node     Next     Text\t F:%p C:%p L:%p\n", List.first, List.current, List.last)
       ;    \t  12345678 12345678 12345678 xxxxxxxxxx         (pentru aliniere printf de mai sus - cap de tabel)
    invoke SetConsoleTextAttribute, StdOutput, 00Fh ; BG=Black(0), Text=White(15)  
    mov ebx, List.first
    .if ebx==NULL
       invoke SetConsoleTextAttribute, StdOutput, 00Ch ; BG=Black(0), Text=White(12)
       printf("\t*** Lista vida!!! ***\n")
       invoke SetConsoleTextAttribute, StdOutput, 00Fh ; BG=Black(0), Text=White(15)
    .endif
    .while ebx!=NULL
		.if [ebx].ELEM.sel == 0
			invoke SetConsoleTextAttribute, StdOutput, 00Fh
		.else
			invoke SetConsoleTextAttribute, StdOutput, 005h
		.endif
        .if ebx == List.current
            mov eax, '@'
            .else
                mov eax, ' '
        .endif
    	printf("\t%c %p %p %p '%s'\n", eax, (ELEM PTR [ebx]).prev, ebx, [ebx].ELEM.next, [ebx].ELEM.text)
    	mov ebx, [ebx].ELEM.next     
	.endw
	Ret
Show_List EndP

Delete_List Proc
    mov List.current, NULL
    mov List.last, NULL
    mov ebx, List.first
    .while ebx!=NULL
        mov esi, [ebx].ELEM.next
        hfree([ebx].ELEM.text)
        hfree(ebx)              
    	mov ebx, esi     
    .endw
    mov List.first, NULL
	Ret
Delete_List EndP
     
getch Proc
    LOCAL lpBuffer:INPUT_RECORD
    LOCAL lpRead:DWORD
    invoke ReadConsoleInput, StdInput, addr lpBuffer, 1, addr lpRead
    .if (lpBuffer.EventType==KEY_EVENT) && lpBuffer.KeyEvent.bKeyDown 
        movzx eax, lpBuffer.KeyEvent.UnicodeChar
        movzx edx, lpBuffer.KeyEvent.wVirtualKeyCode
        .else
            xor eax, eax
            xor edx, edx     
    .endif
  	Ret
        ;BOOL WINAPI ReadConsoleInput(
        ;  _In_  HANDLE        hConsoleInput,
        ;  _Out_ PINPUT_RECORD lpBuffer,        ; pointer to INPUT_RECORD
        ;  _In_  DWORD         nLength,
        ;  _Out_ LPDWORD       lpNumberOfEventsRead
        ;);
        
        ;INPUT_RECORD STRUCT 
        ;  EventType             WORD ?
        ;  two_byte_alignment    WORD ?
        ;  UNION
        ;    KeyEvent                KEY_EVENT_RECORD            <>
        ;    MouseEvent              MOUSE_EVENT_RECORD          <>
        ;    WindowBufferSizeEvent   WINDOW_BUFFER_SIZE_RECORD   <>
        ;    MenuEvent               MENU_EVENT_RECORD           <>
        ;    FocusEvent              FOCUS_EVENT_RECORD          <>
        ;  ENDS 
        ;INPUT_RECORD ENDS
        
        ;KEY_EVENT_RECORD STRUCT
        ;  bKeyDown          DWORD ?
        ;  wRepeatCount      WORD ?
        ;  wVirtualKeyCode   WORD ?
        ;  wVirtualScanCode  WORD ?
        ;  UNION
        ;    UnicodeChar     WORD ?
        ;    AsciiChar       BYTE ?
        ;  ENDS
        ;  dwControlKeyState DWORD ?
        ;KEY_EVENT_RECORD ENDS
getch EndP    
  
end start

