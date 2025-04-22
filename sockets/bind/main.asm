; main.asm

%include "function.asm"

section .text
        global _start

_start:
        xor eax, eax
        xor ebx, ebx
        xor edi, edi
        xor esi, esi

_socket:
        push byte 6
        push byte 1
        push byte 2
        mov ecx, esp
        mov ebx, 1
        mov eax, 102
        int 80h

_bind:
        mov edi, eax    ; move return value of sys_socketcall into edi (file descriptor for new socket or -1 for error)
        push dword 0x00000000   ; push 0 dec onto the stack ip address (0.0.0.0)
        push word 0x2923        ; push 9001 dec onto the stack port (reverse byte order)
        push word 2             ; push 2 dec onto stack AF_INET
        mov ecx, esp            ; move address of stack pointer into ecx
        push byte 16            ; push 16 dec onto the stack (arguments length)
        push ecx                ; push the address of the arguments onto the stack
        push edi                ; push the file descriptor onto stack
        mov ecx, esp            ; move address of arguments into ecx
        mov ebx, 2              ; invoke subroutine bind (2)
        mov eax, 102
        int 80h

_exit:
        call quit