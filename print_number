org 100h

mov ax, 123
mov bl, 10
mov cx, 0


divide:
    mov ah, 0
    div bl
    push ax
    inc cx
    cmp al, 0
    jne divide
    
print:
    pop ax
    mov dl, ah
    add dl, 48
    mov ah, 2
    int 21h
    loop print
