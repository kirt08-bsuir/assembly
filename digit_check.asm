org 100h

jmp start


start:
    mov ah, 1
    int 21h          
    
    mov ah, 9
    mov dx, offset newline
    int 21h
    
    cmp al, '0'
    jb print_not_digit
    
    cmp al, '9'
    ja print_not_digit
    
    mov dl, 'Y'
    jmp print_res
    
    print_not_digit:
        mov dl, 'N'
    
    print_res:
        mov ah, 2
        int 21h
        
    ret        
    
newline db 13, 10, "$"
    
    