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
	global make_struct
	global vga_entry_color
	global vga_entry
	global vga_get_index
	global is_even
	global is_odd
	global math_fib
;	global qword_to_string
math_add:
	push rbp
	mov rbp, rsp

	lea rax, [rdi + rsi]
	
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
make_struct:
	push rbp
	mov rbp, rsp
	
	sub rsp, 0x18
	
	mov QWORD [rsp], 10
	mov QWORD [rsp + 8], 20
	mov QWORD [rsp + 16], 100
	mov rax, rsp
	
	add rsp, 0x18
	
	leave
	ret
vga_entry_color:
	push rbp
	mov rbp, rsp
	
	and rdi, 0x0F
	and rsi, 0x0F
	
	shl rsi, 4
	mov rax, rdi
	or rax, rsi
	
	leave
	ret
vga_entry:
	push rbp
	mov rbp, rsp
	
	and rdi, 0x0F
	and rsi, 0x0F
	
	shl rsi, 8
	mov rax, rdi
	or rax, rsi
	
	leave
	ret
%define VGA_WIDTH 80
vga_get_index:
	push rbp
	mov rbp, rsp
	
	;lea rax, [rsi * VGA_WIDTH + rdi]
	mov rax, rsi
	imul rax, VGA_WIDTH
	add rax, rdi
	
	leave
	ret
is_even:
	push rbp
	mov rbp, rsp
	
	mov rax, rdi
	not rax
	and rax, 1
	
	leave
	ret
is_odd:
	push rbp
	mov rbp, rsp
	
	call is_even
	not rax
	and rax, 1
	
	leave
	ret
math_fib:
	push rbp
	mov rbp, rsp
	mov rax, 1
	mov rbx, 1
	mov rcx, 3
	cmp rcx, rdi
	jle .L10
.L10:
	lea rdx, [rax + rbx]
	mov rax, rbx
	mov rbx, rdx
	inc rcx
	cmp rcx, rdi
	jle .L10
	mov rax, rbx
	leave
	ret

; char *bad__qword_to_string(char *buffer, qword number, unsigned char base);
bad__qword_to_string:
	push rbp
	mov rbp, rsp
	test rdi, rdi
	jz .L11
	mov rbx, rdx
	xor rcx, rcx
	test rsi, rsi
	js .L14
	jmp .L12
.L11:
	mov rax, rdi
	leave
	ret
.L12:
	xor rdx, rdx
	cqo
	idiv rax
	add rdx, '0'
	mov [rdi + rcx], rdx
	inc rcx
.L13:
	test rsi, rsi
	jnz .L12
	jmp .L11
.L14:
	mov BYTE [rdi], '-'
	inc rdi
	neg rsi
	jmp .L13
