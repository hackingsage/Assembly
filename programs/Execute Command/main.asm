; main.asm

section .data
        ; command to execute
        command1 db "/bin/echo", 0h
        command2 db "/bin/ls", 0h
        commabd3 db "/bin/sleep", 0h

        ; arguments pass to commandline
        arg1 db "Hello World", 0h
        arg2 db " -l", 0h
        arg3 db " 2", 0h

        arguments dd command1   ; only passing one command in this case
        dd arg1                 ; arguments to pass to command 1
        dd 0h                   ; end of struct
        environment dd 0h       ; arguments to pass as environment variables

section .text
        global _start

_start:
        mov edx, environment    ; address of enviroment variables
        mov ecx, arguments      ; address of the arguments to pass to the commandline
        mov ebx, command1       ; address of the file to execute
        mov eax, 11             ; invoke sys_execve (kernel opcode 11)
        int 80h

        call quit