section .text
	global  ft_strcmp

; int   strcmp(const char *s1, const char *s2);
; s1 == rdi, s2 == rsi

ft_strcmp:
    xor     rax, rax		; iniatilize the rax registry. XOR is used here to clear the register
    xor     rbx, rbx		; iniatilize the rbx registry. XOR is used here to clear the register
    jmp     loop			; begin the loop

loop:
    mov     al, BYTE [rdi]	; move the character from the rdi string to al
    mov     bl, BYTE [rsi]	; move the character from the rsi string to bl
    cmp     al, 0			; compares the character al to a 0
    je      exit			; jump equals to 0, go to exit block
    cmp     bl, 0			; compares the character bl to a 0
    je      exit			; jump equals to 0, go to exit block
    cmp     al, bl			; compares al to bl
    jne     exit			; jump not equals, go to exit block
    inc     rdi				; increments the pointer of rdi
    inc     rsi				; increments the pointer of rsi
    jmp     loop			; return to the beginning of the loop

exit:
    movzx   rax, al			; moves the last compared al characters into rax, zero-extending to make sure the character are unsigned
    movzx   rbx, bl			; moves the last compared bl characters into rbx zero-extending to make sure the character are unsigned
    sub     rax, rbx		; substract the second chars from the first, storing into rax	
    ret