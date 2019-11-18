; ====================================
;  The main script :D
; ====================================
; Changelog:
;
; November 13 2019: Roll back to old kernel.
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
    hlt
