section .text
	global memcmp
memcmp:
	push rbp
	mov rbp, rsp
	test rdi, rdi
	jz .L5
	test rsi, rsi
	jz .L5
	test rdx, rdx
	jz .L5
	xor rax, rax
	xor rcx, rcx
	jmp .L2
.L1:
	mov dl, [rdi + rcx]
	cmp dl, BYTE [rsi + rcx]
	ja .L2
	jb .L3
	inc rcx
	jmp .L4
.L2:
	mov rax, 1
	jmp .L5
.L3:
	mov rax, -1
	jmp .L5
.L4:
	cmp rcx, rdx
	jl .L1
	jmp .L5
.L5:
	leave
	ret