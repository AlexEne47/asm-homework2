section .data
    extern len_cheie, len_haystack
    string: db "Ha  aidauasmama mcn an !" , 0
    i: db 0

section .text
    global columnar_transposition

;; void columnar_transposition(int key[], char *haystack, char *ciphertext);
columnar_transposition:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha 

    mov edi, [ebp + 8]   ;key
    mov esi, [ebp + 12]  ;haystack
    mov ebx, [ebp + 16]  ;ciphertext
    ;; DO NOT MODIFY

    xor eax , eax
    mov ecx , dword [len_haystack]
    mov dword [i] , 0

    while:
    mov al , 1
    mov ah , 0
    jmp find_cif

    found:

    inc dword [i]
    loop while

    find_cif:
    cmp al , byte [len_cheie]
    je found

    ;cmp ah , [edi + al]

    add byte al , 1
    loop find_cif
 
    exit:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY