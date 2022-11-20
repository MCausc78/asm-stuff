extern printf
extern puts

section .text
	global main
main:
	push rbp
	mov rbp, rsp
	mov rbx, 1000
	jmp .L2
.L1:
	mov rdi, msg
	mov rsi, rbx
	call printf wrt ..plt
	sub rbx, 7
.L2:
	cmp rbx, 0
	jg .L1
	mov rdi, msg2
	call puts wrt ..plt
	leave
	ret
section .data
	msg db '%d - 7?', 10, 0
	msg2 db 'Im a Ghoul!', 0
