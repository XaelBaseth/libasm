global ft_read
section .text
extern __errno_location

; ft_read(rdi, rsi, rdx)

ft_read:
	test	rsi,	rsi
	jz		error
    mov     rax,	0
    syscall
    cmp		rax, 	0
	jl		error
	ret

error:
    neg		rax
	mov		rdi,	rax
	call	__errno_location
	mov		[rax],	rdi
	mov		rax, 	-1
	ret
