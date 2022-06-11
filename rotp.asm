section .data
   i: dd 0

section .text
    global rotp

;; void rotp(char *ciphertext, char *plaintext, char *key, int len);
rotp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; ciphertext
    mov     esi, [ebp + 12] ; plaintext
    mov     edi, [ebp + 16] ; key
    mov     ecx, [ebp + 20] ; len
    ;; DO NOT MODIFY

    ;; FREESTYLE STARTS HERE

    mov dword [i], 0
looptask:
    xor eax , eax
    xor ebx , ebx

    mov eax , [i]
    mov bl , byte [edi + eax]

    xor eax , eax
    mov al , byte [esi + ecx - 1]

    xor eax , ebx

    mov byte [edx + ecx - 1] , al

    inc dword [i]
    loop looptask

    ;; FREESTYLE ENDS HERE

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY