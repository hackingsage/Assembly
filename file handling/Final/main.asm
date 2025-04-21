; main.asm

%include "function.asm"

section .data
        filename db "readme.txt", 0h
        contents db "Hello World", 0h

section .bss
        fileContents resb 255,          ; variable to store file contents

section .text
        global _start

_start:
        ; Create file
        mov ecx, 0777o
        mov ebx, filename
        mov eax, 8
        int 80h

        ; Write contents
        mov edx, 11
        mov ecx, contents
        mov ebx, eax
        mov eax, 4
        int 80h

        ; Open file
        mov ecx, 0      ; flag for readonly access mode
        mov ebx, filename
        mov eax, 5      ; invoke sys_open (kernel opcode 5)
        int 80h

        mov edx, 11     ; number to bytes to read
        mov ecx, fileContents   ; move the memory address of our file contents variable into ecx
        mov ebx, eax    ; move the opened file descriptor into ebx
        mov eax, 3      ; invoke sys_read (kernel opcode 3)
        int 80h

        mov eax, fileContents   ; move the memory address of our file contents variable into eax for printing
        call sprintLF

        mov ebx, ebx    ; not needed but used to demonstrate the sys_close takes a file descriptor from ebx
        mov eax, 6      ; invoke sys_close (kernel opcode 6)
        int 80h

        call quit