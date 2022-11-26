section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg6
	mov edx, msg6l
	int 80h
	mov eax, 2
	cmp eax, 3
	ja .L4
	lea edi, [.L6 + eax * 4]
	jmp [edi]
.L1:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, msg1l
	int 80h
	jmp .L5
.L2:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, msg2l
	int 80h
	jmp .L5
.L3:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, msg3l
	int 80h
	jmp .L5
.L4:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, msg4l
	int 80h
.L5:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg5
	mov edx, msg5l
	int 80h
	mov eax, 1
	xor ebx, ebx
	int 80h
	ret

section .data
.L6:
	dd .L1
	dd .L2
	dd .L3

msg1 db 'case 0'
msg1l equ $ - msg1
msg2 db 'case 1.'
msg2l equ $ - msg2
msg3 db 'case 2..'
msg3l equ $ - msg3
msg4 db 'default case!'
msg4l equ $ - msg4
msg6 db 'begin switch', 10
msg6l equ $ - msg6
msg5 db 10, 'end of switch'
msg5l equ $ - msg5
