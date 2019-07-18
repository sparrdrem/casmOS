; ====================================
;  The main script :D
; ====================================
; Changelog:
;
; July 17 2019: Remove ORG and SECTION
;
; November 16 2016: Create the script?

global start

section .text
bits 32

start:
    ; print `OK` to screen
    mov dword [0xb8000], 0x2f4b2f4f
    int 21h
    mov ax,07c0
    mov ds,ax
    xor bx,bx
    mov ah,0e
    mov si,offset(string)
@1  lodsb
    cmp al,00
    je @2
    int 10
    jmps @1
@2  xor ah,ah
    int 16
    callf ffff:0000

string  db      '' 0a 0d 
        db      'casmOS Alpha v0.0.2. Press any key to restart system . . .' 0a 0d 00
