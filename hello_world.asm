org 100h

jmp start

start:
    mov ah, 09h
    mov dx, offset msg
    int 21h
    
msg db "Hello world!", 13, 10, "$"