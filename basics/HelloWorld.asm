; Hello World Program
; Output-
;   Hello World!


section .data                           ; data section
        msg db "Hello World!", 0Ah      ; assign msg variable with your message string
        len equ $ - msg                 ; assign len variable to length of msg

section .text                   ; text section
        global _start           ; entry point for the linker

_start:
        ; Write "Hello World!" to stdout
        mov edx, len            ; number of bytes to write for msg
        mov ecx, msg            ; pointer to the message
        mov ebx, 1              ; file descriptor 1 = stdout
        mov eax, 4              ; sys_write (kernel opcode 4)
        int 80h                 ; make syscall

        ;Exit cleanly
        mov eax, 1              ; sys_exit (kernel opcode 1) (syscall number for sys_exit)
        xor ebx, ebx            ; exit code 0
        
        ; or we can use
        ; 'mov ebx, 0'            -> this does the same as 'xor ebx, ebx'  
        
        int 80h                 ; make syscall