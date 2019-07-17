; ====================================
;  The main script :D
; ====================================
; Changelog:
;
; July 16 2019: Remove ORG instruction
;
; June 25 2019: Add the BEEP driver
;
; November 16 2016: Create the script?

global start

section .text
bits 32
; This might be causing the problem?
;org 100h

start:
    ; print `OK` to screen
    mov dword [0xb8000], 0x2f4b2f4f
    call beep_setup
    mov ax, 2000
    mov bx, 36
    call beep_play
    xor ax, ax
    int 16h
    call beep_teardown
    mov ax, 4c00h
    int 21h
    hlt
    ret
    
beep_setup:
    push es
    push ax
    xor ax, ax
    mov es, ax
    mov ax, word [es: timer_int * 4]
    mov word [cs:original_timer_isr], ax
    mov ax, word [es: timer_int * 4 + 2]
    mov word [cs:original_timer_isr + 2], ax
    cli
    mov ax, beep_isr
    mov word [es: timer_int * 4], ax
    mov ax, cs
    mov word [es: timer_int * 4 + 2], ax
    sti
    pop ax
    pop es
    ret
    
beep_teardown:
    push es
    push ax
    call beep_stop
    xor ax, ax
    mov es, ax
    cli
    mov ax, word [cs:original_timer_isr]
    mov word [es: timer_int * 4], ax
    mov ax, word [cs:original_timer_isr + 2]
    mov word [es: timer_int * 4 + 2], ax
    sti
    pop ax
    pop es
    ret
    
beep_isr:
    cmp byte [cs:sound_playing], 0
    je _bi_end
    cmp word [cs:sound_counter], 0
    je _bi_stop
    dec word [cs:sound_counter]
    jmp _bi_end
    
_bi_stop:
    call beep_stop
    
_bi_end:
    jmp far [cs:original_timer_isr]
    
beep_stop:
    push ax
    in al, 61h
    and al, 0fch
    out 61h, al
    mov byte [cs:sound_playing], 0
    pop ax
    ret
    
beep_play:
    push ax
    push dx
    mov dx, ax
    mov al, 0b6h
    out 43h, al
    mov ax, dx
    out 42h, al
    mov al, ah
    out 42h, al
    mov word [cs:sound_counter], bx
    in al, 61h
    or al, 3h
    out 61h, al
    mov byte [cs:sound_playing], 1
    pop dx
    pop ax
    ret
    
sound_playing      db  0
sound_counter      dw  0
original_timer_isr     dd  0
timer_int      equ     1ch
