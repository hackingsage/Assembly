# 🧠 Assembly for Everyone

Welcome to **Assembly for Everyone**, a beginner-friendly guide to learning Assembly Language from scratch! Whether you're a curious programmer, Hacker, a CS student, or a low-level system enthusiast — this repository is for you.

---

## 🚀 About This Project

This repository is a structured, hands-on journey through Assembly programming (x86_64 NASM syntax on Linux). We'll go from the absolute basics to more advanced concepts like memory management, system calls, file I/O, etc.

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
├── programs/            # Making Intermediate level programs
└── README.md
```

---

## 🧪 How to Run Your First Program

```bash
nasm -f elf HelloWorld.asm -o HelloWorld.o
ld -m elf_i386 HelloWorld.o -o HelloWorld
./HelloWorld
```

---

## ✍️ Contribution Guidelines

Want to help? Found a bug or typo? Feel free to fork the repo and submit a pull request! You can also suggest topics or improvements by opening an issue.

---

## 📜 License

MIT License — use it freely for learning or teaching!