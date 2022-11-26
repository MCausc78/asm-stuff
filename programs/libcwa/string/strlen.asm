section .text
	global strlen
strlen:
	push rbp
	mov rbp, rsp
	mov rax, rdi
	jmp .L2
.L1:
	inc rax
.L2:
	mov dl, BYTE[rax]
	test dl, dl
	jnz .L1
	sub rax, rdi
.L3:	
	leave
	ret
