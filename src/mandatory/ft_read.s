global ft_read
section .text

; ft_read(rdi, rsi, rdx)

ft_read:
    xor rax, rax        ; reset register
    mov rax, 0
    syscall             ; invoke the system call read
    jc  error           ; error handling
    jmp exit

error:
    xor rax, rax
    mov rax, -1         ; if failure, returns -1
    ret

exit:
    ret                 ; returns the bytes read number

