section .text
	global math_add
	global math_factorial
	global math_mul
	global math_pow
	global math_sq
	global math_sub
	global string_get_length
	global math_add_xyz
	global math_sum_array
	global math_compare
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
	
	cmp rdi, 1
	jl .L2
	
	mov rax, rdi
	mov rcx, 1
.L3:
	imul rdi
	
	inc rcx
	cmp rcx, rsi
	jl .L3

	leave
	ret
.L2:
	mov rax, 1
	leave
	ret
math_sq:
	push rbp
	mov rbp, rsp
	
	mov rax, rdi
	imul rdi
	
	leave
	ret
	
string_get_length:
	push rbp
	mov rbp, rsp
	mov rax, rdi
.L4:
	mov dl, [rax]
	inc rax
	test dl, dl
	jnz .L4
	sub rax, rdi
	leave
	ret

math_add_xyz:
	push rbp
	mov rbp, rsp

	xor rax, rax
	
	add rax, [rdi]
	add rax, [rdi + 8]
	add rax, [rdi + 16]

	leave
	ret
math_sum_array:
	push rbp
	mov rbp, rsp
	xor rax, rax
	test rdi, rdi
	jz .L6
	test rsi, rsi
	jz .L6
	xor rcx, rcx
.L5:
	add rax, [rdi + rcx * 8]
	inc rcx
	cmp rcx, rsi
	jl .L5
	jmp .L6
.L6:
	leave
	ret
math_compare:
	push rbp
	mov rbp, rsp
	xor rax, rax
	cmp rdi, rsi
	jl .L7
	jg .L8
	jmp .L9
.L7:
	mov rax, -1
	jmp .L9
.L8:
	mov rax, 1
.L9:
	leave
	ret
