section .text
	global memchr
memchr:
	push rbp
	mov rbp, rsp
	test rdi, rdi
	jz .L3
	test rsi, rsi
	jz .L3
	test rdx, rdx
	jz .L3
	xor rax, rax
	xor rcx, rcx
	jmp .L2
.L1:
	lea rbx, [rdi + rcx]
	cmp [rbx], rdx
	je .L4
	inc rcx
.L2:
	cmp rcx, rdx
	jl .L1
.L3:
	leave
	ret
.L4:
	lea rax, [rdi + rcx]
	jmp .L3