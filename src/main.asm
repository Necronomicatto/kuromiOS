org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
    jmp main

;prints the string
puts:
    push si             ;save the registers 
    push ax

.loop:
    lodsb               ;loads next character
    or al, al           ;verify if next character is null
    jz .done

    mov ah, 0x0e
    int 0x10

    jmp .loop


.done
    pop ax
    pop si
    ret



main:

    ;data segmetns
    mov ax, 0
    mov ds, ax
    mov es, ax

    ;stacks
    mov ss, ax
    mov sp, 0x7C00

    ;print
    mov si, msg_hello
    call puts


    hlt


.halt:
    jmp .halt

msg_hello: db 'Lets all love Lain!', ENDL, 0 


times 510-($-$$) db 0
dw 0AA55h