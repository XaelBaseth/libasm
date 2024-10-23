global _ft_strcpy     
section .text

; rdi = dest, rsi = src

_ft_strcpy:
    xor     rax, rax        ; tmp
    push    rdi             ; rdi => stqck
    jmp     loop

loop:
    cmp     BYTE [rsi], 0   ; make sure the rsi != \0
    je      exit            ; if rsi = \0 return rdi
    mov     rax, [rsi]      ; tmp = src[0]
    mov     [rdi], rax      ; dest[0] = tmp
    inc     rdi             ; *rdi++
    inc     rsi             ; *rsi++
    jmp     loop

exit:
    mov     BYTE [rdi], 0   ; add \0 to dest
    pop     rax             ; rax <= stack
    ret                     