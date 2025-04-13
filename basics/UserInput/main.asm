; Main.asm

%include "function.asm"

section .data
    userInput db "Please enter your name: ", 0h     ; user input string
    displayMsg db "Hello ", 0h                      ; string to display hello <name>

section .bss
    sinput:  resb 255                               ; reserve a 255 byte space in memory for user input

section .text
    global _start

_start:
    mov eax, userInput
    call sprint

    mov edx, 255        ; number of bytes to read
    mov ecx, sinput     ; reserved space to store our input (known as buffer)
    mov ebx, 0          ; read from STDIN file
    mov eax, 3          ; invoke sys_read (kernel opcode 3)
    int 80h

    mov eax, displayMsg
    call sprint

    mov eax, sinput     ; move our buffer into eax (Note: input contains linefeed)
    call sprint

    call quit