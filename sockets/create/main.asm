; main.asm

%include "function.asm"

section .text
        global _start

_start:
        xor eax, eax    ; init eax 0
        xor ebx, ebx
        xor edi, edi
        xor esi, esi

_socket:
        push byte 6     ; push 6 onto the stack (IPPROTO_TCP)
        push byte 1     ; push 1 onto the stack (SOCK_STREAM)
        push byte 2     ; push 2 onto the stack (PF_INET)
        mov ecx, esp    ; move address of arguments into ecx
        mov ebx, 1      ; invoke subroutine socket (1)
        mov eax, 102    ; invoke sys_socketcall (kernel opcode 102)
        int 80h

        call iprintLF

_exit:
        call quit