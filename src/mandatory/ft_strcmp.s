global  ft_strcmp
section .text

; ft_strcmp (rdi, rsi)

ft_strcmp:
    xor     rax, rax            ; c = NULL
    xor     rbx, rbx            ; h = NULL
    jmp     loop

loop:
    mov     al, BYTE [rdi]      ; c = *dest
    mov     bl, BYTE [rsi]      ; h = *src
    cmp     al, 0               ; if (c == \0)
    je      exit
    cmp     bl, 0               ; if (h == \0)
    je      exit
    cmp     al, bl              ; if (c != h)
    jne     exit
    inc     rdi                 ; *dest++
    inc     rsi                 ; *src
    jmp     loop

exit:
    movzx   rax, al             ; move from low registr (al) to 64-x registr (rax) with 0 byte
    movzx   rbx, bl             ; move from low registr (bl) to 64-x registr (rbx) with 0 byte
    sub     rax, rbx            ; temp = (c - h)
    ret                         ; return (temp)