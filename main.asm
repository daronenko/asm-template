section .data
    hello db 'hello, world!', 0

section .text
    global _start

_start:
    ; write 'hello, world!' to stdout
    mov eax, 4         ; sys_write
    mov ebx, 1         ; file descriptor 1 (stdout)
    mov ecx, hello     ; address of the string
    mov edx, 13        ; length of the string
    int 0x80           ; call kernel

    ; exit with code 0
    mov eax, 1         ; sys_exit
    xor ebx, ebx       ; exit code 0
    int 0x80           ; call kernel
