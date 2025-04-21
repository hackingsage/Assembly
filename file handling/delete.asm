; delete.asm
section .data
        filename db "readme.txt", 0h    ; the file to create

section .text
        global _start

_start:
        mov ebx, filename   ; filename we will delete
        mov eax, 10     ; invoke sys_unlink (kernel opcode 10)
        int 80h

        call quit

quit:
        mov ebx, 0
        mov eax, 1
        int 80h
        ret