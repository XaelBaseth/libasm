section .text
	global ft_write
	extern	__errno_location

; size_t   write(int fd, const void *buf, size_t count);
; fd == rdi, buf == rsi, count == rdx

ft_write:
	test	rsi,	rsi			; checks if rsi is not 0
	jz		error_inval			; jumps if zero, go to error_inval
    mov		rax,	1			; sets up the syscall to 1 for write
    syscall						; perform the syscall
    cmp		rax,	0			; compare rax with 0
    jl		error				; jump if less 0, go to error
    ret

error:
	neg		rax					; convert the rax to a negative value
	mov		rdi,	rax			; move the rax into the rdi
	call	__errno_location	; get the address of the error
	mov		[rax],	rdi			; store the code into rax
    mov		rax,	-1			; set rax to -1
    ret

error_inval:
	mov		rdi,	22			; set rdi to 22 (EINVAL)
    call	__errno_location	; get the address of the error
    mov		[rax],	edi			; store the code into rax
    mov		rax,	-1			; set rax to -1
    ret
