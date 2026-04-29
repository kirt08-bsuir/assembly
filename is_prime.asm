org 100h

jmp start

msg_in    db "Enter a number: $"
msg_prime db 13, 10, "Result: Prime!$"
msg_not   db 13, 10, "Result: Not Prime!$"

start:
    mov dx, offset msg_in
    mov ah, 09h
    int 21h
                                            
    call input_num    
    
    mov bx, ax        

    cmp bx, 2
    jb not_prime      
    je is_prime       

    mov cx, 2         

check_loop:
    cmp cx, bx        
    je is_prime       
    
    mov ax, bx        
    xor dx, dx        
    div cx            
    
    cmp dx, 0         
    je not_prime      
    
    inc cx            
    jmp check_loop    

is_prime:
    mov dx, offset msg_prime
    jmp print_result

not_prime:
    mov dx, offset msg_not

print_result:
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h

input_num proc
    push bx
    push cx
    push dx
    push di
    
    xor di, di        
    mov bx, 10        
    
@in_loop:
    mov ah, 01h       
    int 21h
    
    cmp al, 13        
    je @in_done
    
    sub al, 48        
    
    
    xor ah, ah        
    mov cx, ax        
    
    mov ax, di        
    xor dx, dx        
    mul bx            
    
    add ax, cx        
    mov di, ax        
    
    jmp @in_loop
    
@in_done:
    mov ax, di        
    
    pop di
    pop dx
    pop cx
    pop bx
    ret
input_num endp