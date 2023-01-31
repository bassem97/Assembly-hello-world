;┃ variables that may changed through out the lifecycle of the program 🔃
;┃ uninitialized data section 🤔
;┃ block starting symbol 🛫
section .bss

;┃ where we can initialize constants/data that does not change 💯
;┃ initialized data section 🤔
;┃ block starting symbol 🛫
section .data
    hello: db "Hello, World!", 10 ;┃ db is a directive that defines a byte of data 🏗️
                                  ;┃ 10 is the ASCII code for a newline character 🤔
                                  ;┃ $ is a special symbol that represents the current address in the current section💲
                                  ;┃ the address of the first byte of the string is stored in the hello variable 👋

    helloLength: equ $-hello      ;┃ equ is a directive that defines a constant 🏗️
                                  ;┃ $ is a special symbol that represents the current address in the current section💲
                                  ;┃ hello is a variable that stores the address of the first byte of the string 🤔
                                  ;┃ $-hello is the difference between the current address and the address of the first byte of the string 🤔
                                  ;┃ the difference is stored in the helloLength variable

;┃ where can write our code 📝
;┃ code section ⚒️⚒️
section .text
    global _start                 ;┃ _start is the entry point of the program 🏁
                                  ;┃ global is a directive that makes the symbol available to other files 🏗️

    _start:                       ;┃ block starting symbol 🛫

        mov rax, 1                ;┃ mov is a directive that moves data from one operand to another 🏗️
                                  ;┃ rax is a register that stores the return value of the system call 🏦
                                  ;┃ 1 is the system call number for write 🖋️

        mov rdi, 1                ;┃ rdi is a register that stores the file descriptor of the output
                                  ;┃ 1 is the file descriptor for standard output ⬆️
                                  ;┃ ps: 0 is the file descriptor for standard input ⬇️

        mov rsi, hello            ;┃ rsi is a register that stores the address of the first byte of the string to be written 🗃️
                                  ;┃ hello is a variable that stores the address of the first byte of the string 🎫

        mov rdx, helloLength      ;┃ rdx is a register that stores the length of the string to be written 🗃️
                                  ;┃ helloLength is a variable that stores the length of the string 🎫
                                  ;┃ ps: the length of the string does not include the null terminator 🫡

        syscall                   ;┃ syscall is a directive that executes the system call specified in the rax register 🏗️

        ; IF WE RUN IT AT THIS POINT WE WILL GET A SEGMENTATION FAULT 💥💥

        ; end program
        mov rax, 60               ;┃ update the racks register with 60 which is the system call number for exit 📤
        mov rdi, 0                ;┃ update the rdi register with 0 for successfull exit ✅
        syscall                   ;┃ execute call kernel to exit the program 🏗️
