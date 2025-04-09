# 🧠 Assembly for Everyone

Welcome to **Assembly for Everyone**, a beginner-friendly guide to learning Assembly Language from scratch! Whether you're a curious programmer, a CS student, or a low-level system enthusiast — this repository is for you.

---

## 🚀 About This Project

This repository is a structured, hands-on journey through Assembly programming (x86_64 NASM syntax on Linux). We'll go from the absolute basics to more advanced concepts like memory management, system calls, file I/O, and integrating Assembly with C.

---

## 📚 What You'll Learn

- Assembly language fundamentals
- How the CPU interacts with memory
- Registers, flags, and calling conventions
- Writing and running NASM programs on Linux
- System calls and Linux interrupts
- Control flow: loops, conditions, and jumps
- File I/O in Assembly
- Mixing Assembly with C
- Exercises and challenges to reinforce learning

---

## 🛠 Requirements

- Linux-based system (Ubuntu, Arch, WSL, etc.)
- NASM assembler installed:
  ```bash
  sudo apt install nasm
  ```
- Basic understanding of terminal and programming logic

---

## 📁 Repository Structure

```
assembly-for-everyone/
│
├── basics/              # Introduction to Assembly, first programs
├── syscalls/            # Using Linux system calls (int 0x80 / syscall)
├── control_flow/        # If, else, loops, comparisons
├── memory/              # Stack, heap, registers, memory access
├── functions/           # Creating and calling functions
├── file_io/             # Reading/writing files in Assembly
├── mixed_c_asm/         # Mixing C and Assembly
├── challenges/          # Practice problems and solutions
└── README.md
```

---

## 🧪 How to Run Your First Program

```bash
nasm -f elf hello.asm -o hello.o
ld -m elf_i386 hello.o -o hello
./hello
```

---

## ✍️ Contribution Guidelines

Want to help? Found a bug or typo? Feel free to fork the repo and submit a pull request! You can also suggest topics or improvements by opening an issue.

---

## ❤️ Acknowledgements

This project is inspired by the belief that **low-level programming** shouldn’t be intimidating. Assembly helps us understand how computers truly work under the hood.

---

## 📜 License

MIT License — use it freely for learning or teaching!