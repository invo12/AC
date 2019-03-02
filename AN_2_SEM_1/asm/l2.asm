.586
.model flat, stdcall

.stack 1024

ExitProcess proto,dwExitCode:dword

.data

.code
main proc
	;3
	;mov ax,2
	;mov bx,3
	;mov cx,4
	;mov dx,5
	;add ax,bx
	;add ax,cx
	;add ax,dx

	;4
	;mov ax,2
	;mov bx,3
	;mov cx,4
	;mov dx,5
	;;cxf
	;mov cx,bx
	;;dxf
	;mov dx,bx
	;add dx,dx
	;add dx,dx
	;;bxf
	;mov bx,ax
	;;axf
	;mov ax,cx
	;add ax,ax

	;5
	;mov cx,2
	;mov ax,1
	;add ax,cx
	;inc cx
	;add ax,cx
	;inc cx
	;add ax,cx
	;inc cx
	;add ax,cx
	;inc cx
	;add ax,cx
	;inc cx
	;add ax,cx

	;6
	;mov ax,3
	;mov bx,5
	;add bx,ax
	;mov ax,5
	;add ax,bx

	;7
	;mov cx,1
	;mov bx,2
	;mov dx,2
	;add bx,bx
	;add bx,dx
	;add bx,cx
	;inc cx
	;mov dx,bx
	;add bx,bx
	;add bx,dx
	;add bx,cx
	;mov ax,bx

	;8
	;mov bx,1
	;mov cx,1
	;mov dx,bx
	;add bx,bx
	;add bx,dx
	;shr cx,1
	;add bx,cx
	;add bx,2
	;mov ax,bx

	invoke ExitProcess, 0
	main endp
	end main