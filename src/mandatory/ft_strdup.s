section .text
	global	ft_strdup
	extern  malloc
	extern  ft_strlen
	extern  ft_strcpy
	extern __errno_location

; char	*strdup(const char *s1);
; s1 == rdi

ft_strdup:
	push	rdi					; saves the value on the rdi register
	call	ft_strlen			; use the ft_strlen function, passing the rdi and returning the value in the rax register
	inc		rax					; increase the rax value by one
	mov		rdi,	rax			; rdi must be equals to the rax register for the malloc
	call	malloc				; use the malloc function for the rax string
	test	rax,	rax			; checks if the rax address is zero
	jz		error				; jumps if zero, go to the error block
	mov		rdi,	rax			; sets up the destination for the copy
	pop		rsi					; retrieves the original string for the copy operation
	call	ft_strcpy			; use the ft_strcpy function to copy the string in rax
	ret						

error:
	pop		rsi					; retrieves the rsi
	neg		rax					; convert the rax to a negative value
	mov		rdi,	rax			; stores the rax at the rdi location 
	call	__errno_location	; get the address of the global error number
	mov		[rax],	rdi			; store the value of rdi into rax
	mov		rax,	-1			; set the return values to -1
	ret