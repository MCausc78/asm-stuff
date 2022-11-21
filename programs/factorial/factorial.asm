extern printf
extern puts
extern errno
extern strerror
extern strtoll
extern fdopen
extern fgets
extern __errno_location

section .text
	global main
main:
	push rbp
	mov rbp, rsp
	mov rdi, 0
	mov rsi, mode
	call fdopen wrt ..plt
	mov [stdin], rax
	mov rdi, inp
	;lea rdi, [inp]
	mov rsi, 16
	mov rdx, [stdin]
	call fgets wrt ..plt
	mov rdi, inp
	xor rsi, rsi
	mov rdx, 10
	call __errno_location
	mov rbx, rax
	mov [rbx], DWORD 0
	call strtoll wrt ..plt
	mov rbx, [rbx]
	test rbx, rbx
	jnz .L4
	cmp rax, 1
	jl msg4
	mov rdi, rax
	call factorial
	mov rsi, rdi
	mov rdi, msg1
	mov rdx, rax
	call printf wrt ..plt
	jmp .L3
.L3:
	leave
	ret
.L4:
	mov rdi, rbx
	call strerror wrt ..plt
	mov rsi, rax
	mov rdi, msg3
	call printf wrt ..plt
	jmp .L3

factorial:
	push rbp
	mov rbp, rsp
	mov rcx, 1
	mov rax, rcx
	jmp .L6
.L5:
	imul rax, rcx
	inc rcx
	jmp .L6
.L6:
	cmp rcx, rdi
	jle .L5
	leave
	ret
section .data
	msg1 db '%zu! = %zu', 10, 0
	msg2 db 'error: invalid number', 10, 0
	msg3 db 'unknown error: %s', 10, 0
	msg4 db 'error: out of range', 10, 0
	mode db 'r', 0
segment .bss
	inp resb 16
	stdin resq 1
	