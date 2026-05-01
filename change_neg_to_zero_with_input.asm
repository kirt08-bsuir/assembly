.model small
.stack 100h

.data
    vector dw 50 dup(0)
    vector_size dw 0
    
    msg_n db "Enter N: $"
    msg_elem db 13, 10, "Element: $"
    
    temp_val dw 0
    is_neg db 0
                                                               
.code
start:   
    mov ax, @data
    mov ds, ax
    
    lea dx, msg_n
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h            
    
    sub al, '0'
    xor ah, ah
    mov vector_size, ax
    mov cx, ax
    
    lea si, vector
    
    input_loop:
        push cx
        
        lea dx, msg_elem
        mov ah, 9
        int 21h
        
        call scan_int
        
        mov [si], ax
        add si, 2
        
        pop cx   
        loop input_loop
    
    mov cx, vector_size
    lea si, vector
    
    find_neg:
        cmp word ptr [si], 0
        jns skip
        mov word ptr [si], 0
        
        skip:
            add si, 2
            loop find_neg
            
    mov ax, 4ch
    int 21h

scan_int proc
    mov temp_val, 0
    mov is_neg, 0
    
    mov ah, 1
    int 21h
    
    cmp al, '-'
    jne check_digit
    mov is_neg, 1
    jmp next_digit
    
check_digit:
    sub al, '0'
    mov ah, 0
    mov temp_val, ax

next_digit:
    mov ah, 1
    int 21h
    
    cmp al, 13
    je input_finish
    
    sub al, '0'
    xor ah, ah
    mov bx, ax
    
    mov ax, temp_val
    mov dx, 10
    mul dx
    add ax, bx
    mov temp_val, ax
    jmp next_digit

input_finish:
    mov ax, temp_val
    cmp is_neg, 1
    jne done
    neg ax
    
done:
    ret
    
scan_int endp
end start