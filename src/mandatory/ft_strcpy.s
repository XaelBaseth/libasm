section .text
	global ft_strcpy     

;	char	*ft_strcpy(char *dest, const char *src);
; 	dest == rdi, src == rsi
;	rcx = counter, dl = tmp

ft_strcpy:
	xor		rcx,	rcx				; iniatilize the rcx registry. XOR is used here to clear the register

loop:
	cmp		byte [rsi + rcx],	0	; compare the byte at the adress rdi + rcx to 0
	jz		return					; jump if 0 (meaning we reach the end of the string), go to the return block
	mov		dl,	[rsi + rcx]			; moves the rsi + rcx character to the dl register
	mov		[rdi + rcx],	dl		; moves the dl character to rdi + rcx register
	inc		rcx						; increment the rcx counter
	jmp		loop					; return to the beginning of the loop

return:
	mov		byte [rdi + rcx],	0	; move the 0 (end of the string) to the end of the destination string
	mov		rax,	rdi				; move the pointer of rdi to rax to return it
	ret