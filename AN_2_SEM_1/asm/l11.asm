.386
.model flat,stdcall
.stack 1024
ExitProcess PROTO,dwExitCode:DWORD

.data
;1
;a dw 3
;b dw 4
;sum dw ?

;2
;d real4 4.5
;e real4 2.32
;f real4 ?

;3
v real10 2.5, 3.0, 7.1, 8.1, 2.2
lungime dd $-v
siz dd ?
sumr real4 ?
med real4 ?
aux real4 ?

.code
main proc

;1
;fild a
;fild b
;fadd st,st(1)
;ffree st(1)
;fistp sum

;2
;fld d
;fld e
;fadd st,st(1)
;fst f
;ffree st(0)
;ffree st(1)

;3
;fldz				;st(0) = 0
;lea ebx,v
;mov ecx,lungime
;bucla:
;	cmp ecx,10			;daca ecx e < 10 inseamna ca s-au terminat elementele,daca v era real8 comparam cu 8,daca era real4 comparam cu 4
;	jb afara
;	fld TBYTE PTR[ebx]		;st(0) = v[] st(1) = 0
;	fadd st,st(1)
;	ffree st(1)
;	add ebx,10
;	sub ecx,10
;	jmp bucla
;afara:
;	fstp REAL4 PTR[sumr]

;4
fldz				;st(0) = 0
lea ebx,v
mov ecx,lungime
xor edx,edx
bucla:
	cmp ecx,10			;daca ecx e < 10 inseamna ca s-au terminat elementele,daca v era real8 comparam cu 8,daca era real4 comparam cu 4
	jb afara
	fld TBYTE PTR[ebx]		;st(0) = v[] st(1) = 0
	fadd st,st(1)
	ffree st(1)
	add ebx,10
	sub ecx,10
	inc edx
	jmp bucla
afara:
	mov [siz],edx
	fst sumr
	;media
	fidiv siz
	fst med
	ffree st(0)

fldz
fld med
lea ebx,v
mov ecx,lungime
bucla1:
	cmp ecx,10			;daca ecx < 10 inseamna ca s-au terminat elementele,daca v era real8 comparam cu 8,daca era real4 comparam cu 4
	jb afara1
	fld TBYTE PTR[ebx]		;st(0) = v[0] st(1) = med
	fsub st,st(1)			;st(0) = v[0] - med
	fst REAL4 PTR[aux]
	fmul aux				;st(0) = (v[0] - med)^2
	fabs
	fst aux
	fadd st(2),st(0)
	add ebx,10
	sub ecx,10
	jmp bucla1
afara1:
	fstp aux
INVOKE ExitProcess,0
main endP
END main