; ***************************************************
;   BEEP Driver for DOS by SparrOSDeveloperTeam
;               for casmOS Shell
; ***************************************************
; This program is open source and comes with absolutely
; NO WARRANTY.
;

BITS 16

ORG 100h

START:
    ; Configures the beep to play for ~2sec
    CALL BEEP_SETUP
    
    MOV AX, 2000
    MOV BX, 36
    CALL BEEP_PLAY
    
    XOR AX, AX
    INT 16h
    
    CALL BEEP_TEARDOWN
    
    CALL WELCOME_MSG
    
    MOV AX, 4c00h
    INT 21h
    
    RET
    
WELCOME_MSG:
    ; Displays msg upon entrance
    
    MOV DX, MSG
    MOV AH, 9
    INT 21h

    MOV AH, 0x4c
    INT 21h

    MSG DB 'BEEP Driver for casmOS. Copyright (C) 2018-2019 SparrDrem.', 0x0d, 0x0a, '$'
    RET
    
BEEP_SETUP:
    ; Defines the BEEP and how long to play BEEP
    PUSH ES
    PUSH AX
    
    XOR AX, AX
    MOV ES, AX
    
    MOV AX, WORD [ES: TIMER_INT * 4]
    MOV WORD [CS:ORIGINAL_TIMER_ISR], AX
    MOV AX, WORD [ES: TIMER_INT * 4 + 2]
    MOV WORD [CS:ORIGINAL_TIMER_ISR + 2], AX
    
    CLI
    MOV AX, BEEP_ISR
    MOV WORD [ES: TIMER_INT * 4], AX
    MOV AX, CS
    MOV WORD [ES: TIMER_INT * 4 + 2], AX
    STI
    
    POP AX
    POP ES
    RET
    
BEEP_TEARDOWN:
    ; Teardown the ISR for BEEP
    PUSH ES
    PUSH AX
    
    CALL BEEP_STOP
    
    XOR AX, AX
    MOV ES, AX
    
    CLI
    MOV AX, WORD [CS:ORIGINAL_TIMER_ISR]
    MOV WORD [ES: TIMER_INT * 4], AX
    MOV AX, WORD [CS:ORIGINAL_TIMER_ISR + 2]
    MOV WORD [ES: TIMER_INT * 4 + 2], AX
    STI
    
    POP AX
    POP ES
    RET
    
BEEP_ISR:
    ; Define BEEP ISR
    CMP BYTE [CS:SOUND_PLAYING], 0
    JE _BI_END
    
    CMP WORD [CS:SOUND_COUNTER], 0
    JE _BI_STOP
    
    DEC WORD [CS:SOUND_COUNTER]
    
    JMP _BI_END
    
_BI_STOP:
    ; Uses BEEP_STOP
    CALL BEEP_STOP
    
_BI_END:
    ; Goes to Chain
    JMP FAR [CS:ORIGINAL_TIMER_ISR]
    
BEEP_STOP:
    ; Kills the BEEP to prevent loop
    PUSH AX
    
    IN AL, 61h
    AND AL, 0fch
    OUT 61h, AL
    
    MOV BYTE [CS:SOUND_PLAYING], 0
    
    POP AX
    RET
    
BEEP_PLAY:
    ; Plays the BEEP after it is created
    PUSH AX
    PUSH DX
    
    MOV DX, AX
    
    MOV AL, 0b6h
    OUT 43h, AL
    
    MOV AX, DX
    OUT 42h, AL
    MOV AL, AH
    OUT 42h, AL
    
    MOV WORD [CS:SOUND_COUNTER], BX
    
    IN AL, 61h
    OR AL, 3h
    OUT 61h, AL
    
    MOV BYTE [CS:SOUND_PLAYING], 1
    
    POP DX
    POP AX
    
    RET
    
SOUND_PLAYING      DB  0
SOUND_COUNTER      DW  0
ORIGINAL_TIMER_ISR     DD  0

TIMER_INT      EQU     1ch
