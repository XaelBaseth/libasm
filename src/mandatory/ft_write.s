global ft_write
section .text
extern	__errno_location

; ft_write(file_descriptor (rdi), buffer (rsi), count (rdx))

ft_write:
	test	rsi,	rsi
	jz		error_inval
    mov		rax,	1
    syscall
    cmp		rax,	0
    jl		error
    ret

error:
	neg		rax
	mov		rdi,	rax
	call	__errno_location
	mov		[rax],	rdi
    mov		rax,	-1
    ret

error_inval:
	mov		rdi,	22
    call	__errno_location
    mov		[rax],	edi
    mov		rax,	-1
    ret
