global  ft_strdup
extern  malloc
extern  ft_strlen
extern  ft_strcpy
section .text

; ft_strdup (rdi)

ft_strdup:
    xor     rax, rax
    cmp     rdi, 0          ; if (rdi == NULL)
    je      exit
    push    rdi             ; rdi => stack
    call    ft_strlen       ; return size in rax
    mov     rdi, rax        ; rax in rdi
    inc     rdi
    call    malloc          ; allocate rax
    cmp     rax, 0          ; if (rax == NULL)
    je      error
    pop     rsi             ; rsi <= stack
    mov     rdi, rax        ; move allocate rax to rdi
    call    ft_strcpy       ; copy rsi to rdi return rax
    jmp     exit

error:
    xor     rax, rax
    mov     rax, -1         ; call error => -1
    ret

exit:
    ret
