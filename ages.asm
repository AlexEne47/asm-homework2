;%include "./printf32.asm"

section .data
i: dd 0
years: times 3 dd 2001
string: db "01 12 2001 31 12 1999 25 12 2005" , 0
present: db "22 11 2021" , 0

; This is your structure
struc  my_date
    .day: resw 1
    .month: resw 1
    .year: resd 1
endstruc

structura:
    istruc my_date
        at my_date.day, dw 0
        at my_date.month, dw 0
        at my_date.year, dd 0
    iend

section .text
    extern printf
    global ages

; void ages(int len, struct my_date* present, struct my_date* dates, int* all_ages);
ages:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, 3 ;[ebp + 8]  ; len
    mov     esi, present ;[ebp + 12] ; present
    mov     edi, string ;[ebp + 16] ; dates
    mov     ecx, [ebp + 20] ; all_ages
    ;; DO NOT MODIFY

    ;; TODO: Implement ages
    ;; FREESTYLE STARTS HERE

    mov dword [years + 0] , 2001
    mov dword [years + 4] , 1999
    mov dword [years + 8] , 2005

while_loop:
    cmp edx , 0
    je exit

    xor eax , eax
    xor ebx , ebx

    mov bx , word [edi]
    mov word [structura + my_date.day] , bx
    add edi , 3

    mov bx , word [edi]
    mov word [structura + my_date.month] , bx
    add edi , 3

    mov ebx , dword [edi]
    mov dword [structura + my_date.year] , ebx
    add edi , 5

    mov eax , dword [esi + 6]
    sub eax , ebx
    sub eax , 1

    mov ebx , [i]
    mov dword [ecx + ebx*4] , eax
    inc dword [i]
    
    sub edx , 1
loop while_loop


exit:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY