; Functions.asm
; This is out external function file we will be calling in our main program


; --------------------------------------------------------------------------------------------------------------
; void iprint(Integer number)
; Integer printing function (itoa)

iprint:
        ; preserve these on the stack to be restored after the function runs
        push eax
        push ecx
        push edx
        push esi
        mov ecx, 0      ; Counter of how many bytes we need to print in the end

divideLoop:
        inc ecx
        mov edx, 0      ; empty edx
        mov esi, 10     ; mov 10 into esi
        idiv esi        ; divide eax by esi
        add edx, 48     ; convert edx to it's ascii representation
        push edx        ; push edx (string representation of an integer) onto the stack
        cmp eax, 0      ; can the integer be divided anymore?
        jnz divideLoop  ; jump if not zero to divideLoop

printLoop:
        dec ecx         ; count down each byte that we put on the stack
        mov eax, esp    ; mov the stack pointer into eax for printing
        call sprint
        pop eax         ; remove the last character from the stack to move esp forward
        cmp ecx, 0      ; have we printed all bytes we pushed onto the stack
        jnz printLoop

        ; restore these from the value we pushed onto the stack at the start
        pop esi
        pop edx
        pop ecx
        pop eax
        ret

; --------------------------------------------------------------------------------------------------------------
; void iprintLF(Integer number)
; Integer printing function with linefeed (itoa)

iprintLF:
        call iprint

        push eax        ; push eax onto the stack to preserve it while we use the eax register in this function
        mov eax, 0Ah    ; ascii character for a linefeed
        push eax        ; push the linefeed onto the stack so we can get the address
        mov eax, esp    ; move the address of the current stack pointer into eax for sprint
        call sprint
        pop eax         ; remove our linefeed character from the stack
        pop eax         ; restore the original value of eax before our function was called
        ret

; --------------------------------------------------------------------------------------------------------------
; int slen(String message)
; String length calculation function

slen:                   ; function declaration
        push ebx        ; push the value in ebx onto the stack to preserve it while we use ebx in this function
        mov ebx, eax    ; move the address in eax into ebx (both point to the same segment in memory)

nextChar:
        cmp byte [eax], 0       ; compare the byte pointed to by eax at this address against zero ( Zero is an end of string delimiter)
        jz finished             ; jump (if the zero flagged has been set) to the point in the code labeled 'finished'
        inc eax                 ; increment the address in eax by one byte (if the zero flagged has NOT been set)
        jmp nextChar            ; jump to the point in the code labeled 'nextChar'

finished:
        sub eax, ebx            ; subtract the address in ebx from the address in eax.
                                ; Remember both registers started pointed to the same address
                                ; but eax has been incremented one byte for each character in the message string
                                ; when you subtract one memory address from another of the same type
                                ; the result is number of segments between them - in this case the number of bytes
        pop ebx                 ; pop the value on the stack back into ebx
        ret                     ; return to where the function was called

; --------------------------------------------------------------------------------------------------------------
; void sprint(String message)
; String printing function

sprint:
        ; Preserving the values of registers on the stack
        push edx
        push ecx
        push ebx
        push eax
        call slen               ; calling function slen

        mov edx, eax
        pop eax

        mov ecx, eax
        mov ebx, 1
        mov eax, 4
        int 80h

        pop ebx
        pop ecx
        pop edx
        ret

; --------------------------------------------------------------------------------------------------------------
; void sprintLF(String Message)
; string printing with line feed function

sprintLF:
        call sprint

        push eax                ; push eax onto the stack to preserve it while we use the eax register
        mov eax, 0Ah            ; move 0Ah into eax - 0Ah is the ascii character for linefeed
                                ; as eax is 4 bytes wide, it now contains 0000000Ah
        push eax                ; push the linefeed onto the stack so we can get the address
                                ; eax register bytes are stored in reverse order
                                ; this corresponds to stack memory contents of 0Ah, 0h, 0h, 0h
                                ; giving us a linefeed followed by a NULL terminating byte
        mov eax, esp            ; move the address of the current stack pointer into eax for sprint
        call sprint             ; call our sprint function
        pop eax                 ; remove our linefeed character from the stack
        pop eax                 ; restore the original value of eax before our function was called
        ret

; --------------------------------------------------------------------------------------------------------------
; void exit()
; Exit program and restore resources

quit:
        mov ebx, 0
        mov eax, 1
        int 80h
        ret