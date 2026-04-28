org 100h
    
mov dl, 65
mov cx, 26
    
print_letter:
    mov ah, 2
    int 21h
    
    inc dl
    
    loop print_letter

ret
    