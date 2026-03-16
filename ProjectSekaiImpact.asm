; ProjectSekaiImpact.asm for windows dll
[BITS 64]


section .data
    index dq 0
    hp dq 100

section .rdata
    dllname db "ProjectSekaiImpact.dll",0

section .bss
    data resb 8
    sector resb 512
section .text 
    global DllMain
    global GetHP
    global GetIndex
    global DecrementHp
    global IncrementIndex

DLLMain:
    mov byte [rel data],0
    mov byte [rel sector],0
    mov rax,1
    ret

GetHP:
    mov rax, [rel hp]
    ret

GetIndex:
    mov rax, [rel index]
    ret

DecrementHp:
    mov rax, [rel hp]
    dec rax
    ret

IncrementIndex:
    mov rdi, [rel index]
    inc rdi
    ret