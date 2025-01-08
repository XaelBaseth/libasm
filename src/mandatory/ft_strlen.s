section .text
	global	ft_strlen 

; size_t	ft_strlen(char *str);
; s == rdi

ft_strlen:
	xor		rcx, rcx				; iniatilize the rcx registry. XOR is used here to clear the register

loop:
	cmp		byte [rdi + rcx],	0	; compare the byte at the adress rdi + rcx to 0
	jz		return					; jump if 0 (meaning we reach the end of the string), go to the return block
	inc		rcx						; increment the rcx counter
	jmp		loop					; return to the beginning of the loop

return:
	mov 		rax, rcx			; move the rcx value into rax
	ret								; return the rax value