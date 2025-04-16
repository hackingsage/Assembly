; CountToTen.asm

%include "function.asm"

section .text
        global _start

_start:
        mov ecx, 0              ; ecx is initialized to 0

nextNumber:
        inc ecx
        mov eax, ecx
        call iprintLF
        cmp ecx, 10
        jne nextNumber

        call quit