global ft_write
section .text

; ft_write (rdi, rsi, rdx)

ft_write:
    xor rax, rax            ; clear registr
    mov rax, 0              ; system call write
    syscall                 ; call to write function
    jc  error
    jmp exit

error:
    xor rax, rax            ; clear registr
    mov rax, -1             ; -1 => system call error
    ret

exit:
    ret