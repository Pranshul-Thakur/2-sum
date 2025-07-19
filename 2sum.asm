section .data
    nums dd 3, 5, 7, 9
    n equ 4
    target dd 12
    found dd 0

section .text
    global _start

_start:
    xor eax, eax

outer_loop:
    cmp eax, n
    jge end

    mov ebx, eax
    inc ebx

inner_loop:
    cmp ebx, n
    jge next_i

    mov esi, [nums + eax*4]
    mov edi, [nums + ebx*4]
    add esi, edi
    cmp esi, [target]
    je match

    inc ebx
    jmp inner_loop

next_i:
    inc eax
    jmp outer_loop

match:
    mov dword [found], 1

end:
    mov eax, 1
    xor ebx, ebx
    int 0x80

