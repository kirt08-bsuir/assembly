org 100h

.data
    arr db 5, 10, 15, 87, 3, 4
    size dw 6
    ma db 0
    
.code
    mov ax, @data
    mov ds, ax
    
    mov cx, size
    lea si, arr
    mov al, [si]
    
    find_max:
        cmp al, [si]
        jnb skip
        mov al, [si]
        
        skip:
            inc si
            loop find_max
    mov ma, al
    ret 