global ft_write
section .text

; ft_write(file_descriptor (rdi), buffer (rsi), count (rdx))

ft_write:
    mov rax, 1              ; System call number for write
    syscall                 ; Make the system call
    cmp rax, 0              ; Check if the return value is negative (error)
    jl error                ; If less than zero, jump to error handler
    ret                     ; Return if successful

error:
    mov rax, -1             ; Set return value to -1 on error
    ret                     ; Return
