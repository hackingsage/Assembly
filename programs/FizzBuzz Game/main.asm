; main.asm

%include "function.asm"

section .data
        fizz db "fizz", 0h
        buzz db "buzz", 0h

section .text
        global _start

_start:
        mov esi, 0      ; initialize our checkfizz boolean varaible
        mov edi, 0      ; intiialize our checkbuzz boolean variable
        mov ecx, 0      ; Initialize counter variable

nextNumber:
        inc ecx

.checkFizz:
        mov edx, 0      ; clear the edx register - this will hold our remainder after division
        mov eax, ecx    ; move the value of our counter into eax for division
        mov ebx, 3      ; move our number to divide by into ebx (in this case the value is 3)
        div ebx         ; divide eax by ebx
        mov edi, edx    ; move our remainder into edi
        cmp edi, 0
        jne .checkBuzz  ; if the remainder is not 0 jump to local label checkBuzz
        mov eax, fizz   ; else move the address of our fizz into eax for printing
        call sprint

.checkBuzz:
        mov edx, 0
        mov eax, ecx
        mov ebx, 5
        div ebx
        mov esi, edx
        cmp esi, 0
        jne .checkInt
        mov eax, buzz
        call sprint

.checkInt:
        cmp edi, 0
        je .continue
        cmp esi, 0
        je .continue
        mov eax, ecx
        call iprint

.continue:
        mov eax, 0Ah
        push eax
        mov eax, esp    ; get the stack pointer (address on the stack of our linefeed char)
        call sprint
        pop eax
        cmp ecx, 100    ; compare if our counter is equal to 100
        jne nextNumber

        call quit