global start
section .text
bits 32
start:
        mov esi, msg
        mov edi, 0xb8000
        mov ah, 0x2f
.l:
        lodsb
        stosw
        test al, al
        jnz .l
        hlt
msg:
        db "[ INFO ]  kernel booted successfully", 0
