; Hello World Program
; Output-
;   Hello World!
;   Segmentation fault


section .data                           ; data section
        msg db "Hello World!", 0Ah      ; assign msg variable with your message string
        len equ $ - msg                 ; assign len variablr to length of msg

section .text                   ; text section
        global _start           ; telling program entry point

_start:
        mov edx, len            ; number of bytes to write
        mov ecx, msg            ; move the memory address of our msg string into ecx
        mov ebx, 1              ; write to STDOUT file
        mov eax, 4              ; sys_write (kernel opcode 4)
        int 80h