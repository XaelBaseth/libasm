section .text
	global ft_read
	extern __errno_location

; size_t	ft_read(int fd, void *buf, size_t count);
; fd == rdi, buf == rsi, count == rdx

ft_read:
	test	rsi,	rsi			; checks if rsi is 0
	jz		error				; jump if zero, go to error
    mov     rax,	0			; sets up the syscall to 0 for read
    syscall						; performs the syscall
    cmp		rax, 	0			; compares rax to 0
	jl		error				; jumps if less 0, go to error
	ret

error:
    neg		rax					; convert the rax to a negative value
	mov		rdi,	rax			; move the rax into the rdi
	call	__errno_location	; get the address of the error
	mov		[rax],	rdi			; store the code into rax
	mov		rax, 	-1			; set rax to -1
	ret
