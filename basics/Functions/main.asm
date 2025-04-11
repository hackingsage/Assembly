; Main.asm
; Main file in which we will be including our external function file
; Output-
;       This is out first string
;       This is our second string

%include "function.asm"         ; Including our External file

section .data
        msg1 db "This is our first string", 0Ah, 0h     ; 0h is the null terminating byte, it is used for string break
        msg2 db "This is our second string", 0Ah, 0h    ; as in c and assembly strings are not stored in length
                                                        ; they are simply arrays of characters terminated by null byte

section .text
        global _start

_start:
        mov eax, msg1           ; move the address of our msg1 string into eax
        call sprint             ; call our string printing function

        mov eax, msg2           ; move the address of our msg2 string into eax
        call sprint

        call quit