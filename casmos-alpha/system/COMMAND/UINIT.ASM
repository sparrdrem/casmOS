; ***************************************************
;   UINIT.ASM: init for COMMAND.COM and displays
;                   version info.
;   Modified by SparrOSDeveloperTeam (2019-11-09)
; ***************************************************

TITLE   COMMAND Initialization messages

        INCLUDE COMSW.ASM

        INCLUDE IFEQU.ASM

INIT    SEGMENT PUBLIC BYTE

        PUBLIC  BADCOMLKMES

        PUBLIC  HEADER
        IF      NOT IBM
HEADER  DB      13,10,"casmOS Alpha v0.0.3"
        IF      HIGHMEM
        DB      "H"
        ENDIF
        DB      13,10,"$"
        ENDIF
        IF IBM
HEADER  DB      13,10,13,10,"casmOS Alpha v0.0.3",13,10
        DB      "(C) Copyright SparrDrem, 2018-2020",13,10
        DB      "Based on MS-DOS v2.11 by Microsoft Corp.",13,10,"$"
        ENDIF

BADCOMLKMES DB  "Specified COMMAND search directory bad",13,10,"$"

INIT    ENDS

        END
