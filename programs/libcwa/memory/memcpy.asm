section .text
	global memcpy
memcpy:
	push rbp
	mov rbp, rsp
	test rdi, rdi
	jz .L3
	test rsi, rsi
	jz .L3
	test rdx, rdx
	jz .L3
	xor rcx, rcx
	jmp .L2
.L1:
	mov dl, [rsi + rcx]
	mov [rdi + rcx], dl
	inc rcx
.L2:
	cmp rcx, rdx
	jl .L1
.L3:
	leave
	ret