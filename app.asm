;β variables that may changed through out the lifecycle of the program π
;β uninitialized data section π€
;β block starting symbol π«
section .bss

;β where we can initialize constants/data that does not change π―
;β initialized data section π€
;β block starting symbol π«
section .data
    hello: db "Hello, World!", 10 ;β db is a directive that defines a byte of data ποΈ
                                  ;β 10 is the ASCII code for a newline character π€
                                  ;β $ is a special symbol that represents the current address in the current sectionπ²
                                  ;β the address of the first byte of the string is stored in the hello variable π

    helloLength: equ $-hello      ;β equ is a directive that defines a constant ποΈ
                                  ;β $ is a special symbol that represents the current address in the current sectionπ²
                                  ;β hello is a variable that stores the address of the first byte of the string π€
                                  ;β $-hello is the difference between the current address and the address of the first byte of the string π€
                                  ;β the difference is stored in the helloLength variable

;β where can write our code π
;β code section βοΈβοΈ
section .text
    global _start                 ;β _start is the entry point of the program π
                                  ;β global is a directive that makes the symbol available to other files ποΈ

    _start:                       ;β block starting symbol π«

        mov rax, 1                ;β mov is a directive that moves data from one operand to another ποΈ
                                  ;β rax is a register that stores the return value of the system call π¦
                                  ;β 1 is the system call number for write ποΈ

        mov rdi, 1                ;β rdi is a register that stores the file descriptor of the output
                                  ;β 1 is the file descriptor for standard output β¬οΈ
                                  ;β ps: 0 is the file descriptor for standard input β¬οΈ

        mov rsi, hello            ;β rsi is a register that stores the address of the first byte of the string to be written ποΈ
                                  ;β hello is a variable that stores the address of the first byte of the string π«

        mov rdx, helloLength      ;β rdx is a register that stores the length of the string to be written ποΈ
                                  ;β helloLength is a variable that stores the length of the string π«
                                  ;β ps: the length of the string does not include the null terminator π«‘

        syscall                   ;β syscall is a directive that executes the system call specified in the rax register ποΈ

        ; IF WE RUN IT AT THIS POINT WE WILL GET A SEGMENTATION FAULT π₯π₯

        ; end program
        mov rax, 60               ;β update the racks register with 60 which is the system call number for exit π€
        mov rdi, 0                ;β update the rdi register with 0 for successfull exit β
        syscall                   ;β execute call kernel to exit the program ποΈ
