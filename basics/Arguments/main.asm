; Main.asm
; Main file in which we will be including our external function file

; Input-
;       ./main "This is first string" "This is second string" 3

; Output-
;       This is out first string
;       This is our second string
;       3

%include "function.asm"         ; Including our External file

section .text
        global _start

_start:
        ; When we run our program, any passed arguments are loaded onto the stack in reverse order
        ; The name of the program is then loaded onto the stack and lastly the total number of arguments in loaded onto the stack
        pop ecx                 ; first value on the stack is the number of arguments

nextArg:
        cmp ecx, 0h             ; check to see if we have any arguments left
        jz noMoreArgs           ; if zero flags is set jump to noMoreArgs label (Jumping over the end of the loop)
        pop eax                 ; pop the next argument off the stack
        call sprintLF           ; call out a newly defined function in function.asm, to print with linefeed function
        dec ecx                 ; decrease ecx (number of arguments left) by 1
        jmp nextArg             ; jump to nextArg label

noMoreArgs:
        call quit