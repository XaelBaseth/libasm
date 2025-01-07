global  ft_strdup
extern  malloc
extern  ft_strlen
extern  ft_strcpy
extern __errno_location
section .text

; ft_strdup (rdi)

ft_strdup:
	push	rdi
	call	ft_strlen
	inc		rax
	mov		rdi,	rax
	call	malloc
	test	rax,	rax
	jz		error
	mov		rdi,	rax
	pop		rsi
	call	ft_strcpy
	ret

error:
	pop		rsi
	neg		rax
	mov		rdi,	rax
	call	__errno_location
	mov		[rax],	rdi
	mov		rax,	-1
	ret