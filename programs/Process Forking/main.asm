; main.asm
; In this lesson we will use sys_fork to create a new process that duplicates our current process.

%include "function.asm"

section .data
        childMsg db "This is a child process", 0h
        parentMsg db "This is a parent process", 0h

section .text
        global _start

_start:
        mov eax, 2      ; invoke sys_fork (kernel opcode 2)
        int 80h

        cmp eax, 0      ; if eax is zero we are in the child process
        jz child        ; jump if eax is zero to child label

parent:
        mov eax, parentMsg      ; inside our parent process move parentMsg into eax
        call sprintLF           ; call our string printing with linefeed function

        call quit

child:
        mov eax, childMsg       ; inside our child process move childMsg into eax
        call sprintLF

        call quit