; ====================================
;  The main script :D
; ====================================
; Changelog:
;
; July 17 2019: Make it restart
;
; November 16 2016: Create the script?

global start

section .text
bits 32

start:
    ; print `OK` to screen
    mov dword [0xb8000], 0x2f4b2f4f
    int 21h
    mov al, 0xFE
    out 0x64, al
    hlt
    ret
