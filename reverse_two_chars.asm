org 100h

jmp start


start:    
    mov cx, 2
    
    input_chars:
        mov ah, 1
        int 21h
        
        push ax
        
        loop input_chars
    
    mov ah, 9
    mov dx, offset newline
    int 21h
    
    mov cx, 2           
    
    print_chars_reverse:
        pop ax
        mov dl, al
        
        mov ah, 2
        int 21h
        
        loop print_chars_reverse
    
    ret

newline db 13, 10, "$" 