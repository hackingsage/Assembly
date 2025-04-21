; write.asm

section .data
        filename db "readme.txt", 0h
        contents db "Hello World", 0h   ; content to write

section .text:
        global _start

_start:
        mov ecx, 0777o
        mov ebx, filename
        mov eax, 8
        int 80h

        mov edx, 11             ; number of bytes to write
        mov ecx, contents       ; move the memory address of our contents string into ecx
        mov ebx, eax            ; move the file descriptor of the file we created into ebx
        mov eax, 4              ; invoke sys_write (kernel opcode 4)
        int 80h

        call quit

quit:
        mov ebx, 0
        mov eax, 1
        int 80h
        ret