# 🛠️ Introduction to Assembly Language

Assembly language is a **low-level programming language** that gives you **direct control over hardware**. It's specific to a CPU architecture (like x86 or ARM) and is used to write **performance-critical code**, interact with system hardware, or understand how computers work at a fundamental level.

---

## 🔧 Why Learn Assembly?

- 🚀 **Speed**: Write highly optimized code.
- 🧠 **Understanding**: Learn how high-level languages work under the hood.
- 🛠 **Low-level Access**: Interact directly with memory, CPU, and I/O.

---

## 🏗️ Structure of an Assembly Program (x86 NASM)

```nasm
section .data              ; For data definitions
    msg db "Hello, World!", 0Ah  ; A string with a newline
    len equ $ - msg              ; Compute the length of the string

section .text              ; Code section
    global _start          ; Entry point for the linker

_start:
    mov eax, 4             ; syscall number for sys_write
    mov ebx, 1             ; file descriptor (stdout)
    mov ecx, msg           ; pointer to message
    mov edx, len           ; message length
    int 0x80               ; make syscall

    mov eax, 1             ; syscall for exit
    xor ebx, ebx           ; exit code 0
    int 0x80               ; make syscall
```

---

## ⚙️ Basic Concepts

| Term        | Meaning |
|-------------|---------|
| **Register** | Small, fast storage inside the CPU (e.g., `eax`, `ebx`, `ecx`) |
| **Opcode**   | Instruction like `mov`, `add`, `int` |
| **Section**  | Code and data are separated (`.text`, `.data`) |
| **Syscall**  | Way to request services from the kernel |

---

## 💻 How to Compile and Run (on Linux)

```bash
nasm -f elf32 hello.asm -o hello.o
ld -m elf_i386 hello.o -o hello
./hello
```

> ⚠️ Make sure you have NASM and GCC installed.

---

## 🧠 Registers You Should Know (x86, 32-bit)

| Register | Purpose                  | Explanation |
|----------|--------------------------| ------------|
| `eax`    | Accumulator / Return value | accumulator. Very general purpose. Used for math, data, and function return values. |
| `ebx`    | Base register / Syscall arg |  base address (within ds). |
| `ecx`    | Counter                   | counter. Used for loops and repeats. |
| `edx`    | Data                      | data. Very general purpose. Used for math and data. |
| `esp`    | Stack Pointer             |  stack pointer (within ss). Always points to the current bottom of the stack. |
| `ebp`    | Base Pointer (stack frame) | base pointer (within ss). Used for stack frames within functions. |
| `eip`    | Instruction Pointer       | instruction pointer. Always points to the next instruction to execute after the current one. |

---

## 🔗 Useful Tools

- [NASM Assembler](https://www.nasm.us/)
- [Godbolt Compiler Explorer](https://godbolt.org/)
- [x86 Instruction Set Reference](https://www.felixcloutier.com/x86/)

---

Happy Hacking! 💻🧠