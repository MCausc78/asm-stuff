section .text
	global math_add
	global math_factorial
	global math_mul
	global math_pow
	global math_sq
	global math_sub
math_add:
	push rbp
	mov rbp, rsp

	lea rax, [rdi + rsi]
	; mov rax, rdi
	; add rax, rsi
	
	leave
	ret

math_sub:
	push rbp
	mov rbp, rsp
	
	mov rax, rdi
	sub rax, rsi

	leave
	ret
math_factorial:
	push rbp
	mov rbp, rsp
	mov rax, 1
	mov rcx, 1
.L1:
	imul rcx
	inc rcx
	cmp rcx, rdi
	jle .L1
	leave
	ret
math_mul:
	push rbp
	mov rbp, rsp
	
	mov rax, rdi
	imul rsi

	leave
	ret
math_pow:
	push rbp
	mov rbp, rsp
	
	mov rax, rdi
	mov rcx, 1
.L2:
	imul rdi
	
	inc rcx
	cmp rcx, rsi
	jl .L2

	leave
	ret
math_sq:
	push rbp
	mov rbp, rsp
	
	mov rax, rdi
	imul rdi
	
	leave
	ret
	
