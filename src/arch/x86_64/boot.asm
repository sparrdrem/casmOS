global start

section .text
bits 32
start:
    ; print Time to screen
    MOV   DL, 0Ah ; divide by: 10
    DIV   DL      ; first digit in AL (quotient), second digit in AH (remainder)
    MOV   DX, AX  ; save the digits
    ADD   AL, 30h ; ASCII '0'
    MOV   AH, 0Eh ; set up print
    INT   10h     ; print first digit.
    MOV   AL, DH  ; retrieve second digit
    ADD   AL, 30h
    INT   10h     ; print it
    RET
    loop start
