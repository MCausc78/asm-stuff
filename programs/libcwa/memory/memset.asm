section .text
	global memset
memset:
	push rbp
	mov rbp, rsp
	test rdi, rdi
	jz .L3
	test rdx, rdx
	jz .L3
	xor rcx, rcx
	jmp .L2
.L1:
	mov [rdi + rcx], BYTE rsi
	inc rcx
	jmp .L2
.L2:
	cmp rcx, rdx
	jl .L1
	jmp .L3
.L3:
	leave
	ret