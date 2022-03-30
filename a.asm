; (a+12)/5 , если a < b
; a/b-21 , если a > b
; 210 , a = b

section .data
    extern res_short, res_ushort

section .text
    global asm_short
    global asm_ushort

asm_short:
    push rbp
    mov rbp, rsp

    mov eax, edi
    mov ebx, esi
    cmp eax, ebx
    jge Bol
    add eax, 12
    cdq
    mov ebx, 5
    idiv ebx
    mov [res_short], rax
    
    mov rsp, rbp
    pop rbp
    ret


Bol:
    cmp eax, ebx
    je Ravno

    cdq
    idiv ebx
    mov ebx, 21
    sub rax, rbx
    mov [res_short], rax
    
    mov rsp, rbp
    pop rbp
    ret


Ravno:
    mov eax, 210
    mov [res_short], eax

    mov rsp, rbp
    pop rbp
    ret








asm_ushort:
    push rbp
    mov rbp, rsp

    mov eax, edi
    mov ebx, esi
    cmp eax, ebx
    jae _Bol

    add eax, 12
    cdq
    mov ebx, 5
    div ebx
    mov [res_ushort], rax
    
    mov rsp, rbp
    pop rbp
    ret


_Bol:
    cmp eax, ebx
    je _Ravno

    cdq
    div ebx
    mov ebx, 21
    sub rax, rbx
    mov [res_ushort], eax
    
    mov rsp, rbp
    pop rbp
    ret


_Ravno:
    mov eax, 210
    mov [res_ushort], eax

    mov rsp, rbp
    pop rbp
    ret


