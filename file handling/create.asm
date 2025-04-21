; create.asm

section .data
        filename db "readme.txt", 0h    ; the file to create

section .text
        global _start

_start:
        mov ecx, 0777o          ; set all permission to read, write and execute
        mov ebx, filename       ; file we will create
        mov eax, 8              ; invoke sys_create (kernel opcode 8)
        int 80h

        call quit

quit:
        mov ebx, 0
        mov eax, 1
        int 80h
        ret