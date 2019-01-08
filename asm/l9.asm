include c:\masm32\include\masm32rt.inc

concat PROTO p1:DWORD,p2:DWORD,p3:DWORD
minVect PROTO p1:DWORD,len:DWORD
nrAparitii PROTO p1:DWORD,car:BYTE

.stack 1024

.data
stdInput DWORD ?
stdOutput DWORD ?

;1
text dd ?
nrVocale dd ?
aux db ?

;2
a db "unu ",0
b db "doi",0
d db 100 dup(?)

;3
v dd 7,-1,3
lungime dd 3

;4
e db "Sirul din program",0
ce db 'i'
.code

main proc
	invoke GetStdHandle,STD_INPUT_HANDLE
	mov stdInput,eax
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov stdOutput,eax

;1
comment @
	mov esi,input("DATI NR: ")
	mov ecx,len(esi)
	inc ecx
	push ecx
	mov edi, halloc(ecx)
	pop ecx
	mov text,edi
	rep movsb

	mov ebx,text
	xor ecx,ecx
	xor eax,eax
			
	mov al,[ebx]

	.while al != 0
		mov al,[ebx + ecx]
		.if al == 'a'
			inc edx
		.endIf
		.if al == 'e'
			inc edx
		.endIf
		.if al == 'i'
			inc edx
		.endIf
		.if al == 'o'
			inc edx
		.endIf
		.if al == 'u'
			inc edx
		.endIf
		.if al == 'A'
			inc edx
		.endIf
		.if al == 'E'
			inc edx
		.endIf
		.if al == 'I'
			inc edx
		.endIf
		.if al == 'O'
			inc edx
		.endIf
		.if al == 'U'
			inc edx
		.endIf
		inc ecx
	.endw
	hfree(text)
@
	INVOKE concat,addr d,addr a,addr b
	INVOKE minVect,addr v,lungime
	INVOKE nrAparitii,addr e,ce 

comment @
while(!ok)
{
	ok = 1;
	for(int i = 0;i < size - 1;++i)
	{
		if(a[i] > a[i + 1])
		{
			Intersch(a[i],a[i+1])
			ok = 0;
		}
	}
}
@
;4
printf("VECTORUL INITIAL")
xor edi,edi
.WHILE edi < LENGTHOF v
	printf("%ld ",[v + 4 * edi])
	inc edi
.ENDW

xor dh,dh	;ok = 0
.WHILE dh == 0
	mov dh,1
	mov edi,LENGTHOF v
	dec edi
	xor ecx,ecx
	.WHILE ecx < edi
		mov eax,[v + 4 * ecx]
		mov esi,[v + 4 * ecx + 4]
		
		;asta nu merge: .IF SDWORD  eax > SDWORD PTR esi
		cmp eax,esi
		jle dupa
			mov [v + 4 * ecx],esi
			mov [v + 4 * ecx + 4],eax
			xor dh,dh
	dupa:
		inc ecx
	.ENDW
.ENDW
printf("VECTORUL FINAL")
xor edi,edi
.WHILE edi < LENGTHOF v
	printf("%ld ",[v + 4 * edi])
	inc edi
.ENDW
	exit

main endP


comment @
i = 0;
j = 0;
while(b[i] != 0)
{
	a[j] = b[i];
	++i;
	++j
}
i = 0;
while(c[i] != 0)
{
	a[j] = c[i];
	++i;
	++j;
}
@

;2
concat proc uses ebx ecx edx edi p1:DWORD,p2:DWORD,p3:DWORD

xor eax,eax		;j = 0;
xor ecx,ecx		;i = 0;
mov edi,p1		;edi = a
mov ebx,p2		;ebx = b

mov dl,[ebx + ecx]
.WHILE	dl != 0
	mov [edi + eax],dl
	inc eax
	inc ecx
	mov dl,[ebx + ecx]
.ENDW
mov ebx,p3		;ebx = c
xor ecx,ecx
mov dl,[ebx + ecx]
.WHILE dl != 0
	mov [edi + eax],dl
	inc eax
	inc ecx
	mov dl,[ebx + ecx]
.ENDW
	mov [edi + eax],dl
	ret
concat endP

;3
minVect proc uses ebx ecx p1:DWORD,l:DWORD
	
	mov ecx,l
	dec ecx
	mov ebx,p1
	mov eax,[ebx]
	add ebx,4
.WHILE ecx != 0
	mov edi,[ebx]
	comment @
	.IF (SDWORD PTR eax > SDWORD PTR[ebx])
		mov eax,edi
	.ENDIF
	asta nu merge
	@
	cmp eax,edi
	jl dupa
	mov eax,edi
dupa:
	add ebx,4
	dec ecx
.ENDW
ret
minVect endP

;4
nrAparitii proc uses ebx edx p1:DWORD,car:BYTE

mov dl,car
mov ebx,p1
xor eax,eax
mov cl,BYTE PTR[ebx]
.WHILE cl != 0
	.IF cl == dl
		inc eax
	.ENDIF
	inc ebx
	mov cl,BYTE PTR[ebx]
.ENDW
ret
nrAparitii endP

end main