;       UCLA SPRING 2003
;       CS 33 PROJECT 6:  CONSTRUCTION PROJECT:
;                         SUPPORT SUBROUTINES 4
;       JOHN A. ROHR
;       JANUARY 20, 2003
;
        .EQU     N,6                     ; BRICK GRAB LIMIT
        .EQU     TRYLMT,10               ; MOVE  TRY  LIMIT

        .EQU     TIMBIN,$FF7             ; BINARY TIME LOCATION

        .EQU     DEBUG,0                 ; DEBUG CONTROL
        .EQU     ROWS,14                 ; DISPLAY ROWS
        .EQU     COLS,38                 ; DISPLAY COLUMNS

        .EQU     DROWS,3                 ; DATA     ROWS
        .EQU     BROWS,10                ; BUILDING ROWS
        .EQU     BCOLS,24                ; BUILDING COLUMNS
        .EQU     SROWS,10                ; BUILDING ROWS
        .EQU     SCOLS,12                ; BUILDING COLUMNS
        .EQU     MAXGRD,8                ; MAXIMUM  GIRDERS

        .EQU     BURPOS,14               ; INITIAL BUILDING ROW
        .EQU     BUCPOS,1                ; INITIAL BUILDING COLUMN
        .EQU     SURPOS,14               ; INITIAL SUPPLY   ROW
        .EQU     SUCPOS,27               ; INITIAL SUPPLY   COLUMN
        .EQU     CRRPOS,4                ; INITIAL CRANE    ROW
        .EQU     CRCPOS,27               ; INITIAL CRANE    COLUMN
        .EQU     CRICHR,'c'              ; INITIAL CRANE    CHAR

        .EQU     MOVERT,'M'              ; MOVE RIGHT CHARACTER
        .EQU     MOVELT,'K'              ; MOVE LEFT  CHARACTER
        .EQU     MOVEUP,'H'              ; MOVE UP    CHARACTER
        .EQU     MOVEDN,'P'              ; MOVE DOWN  CHARACTER

        .EQU     ENDPRG,'Q'              ; QUIT               CHAR
        .EQU     SHOCON,'C'              ; SHOW CONSTRUCTION  CHAR
        .EQU     SHOSOL,'S'              ; SHOW SOLUTION      CHAR
        .EQU     GRAB1,'1'               ; GRAB ONE BRICK     CHAR
        .EQU     GRABG,'G'               ; GRAB GIRDER INPUT  CHAR
        .EQU     GRABGC,'C'              ; GRAB GIRDER DISPLY CHAR
        .EQU     RELEAS,'R'              ; RELEASE LOAD       CHAR

        .EQU     TITPOS,0                ; TITLE          POSITION
        .EQU     STAPOS,TITPOS+COLS      ; STATUS         POSITION
        .EQU     SEPPOS,TITPOS+2*COLS    ; SEPARATOR      POSITION
        .EQU     MODPOS,STAPOS           ; MODE           POSITION
        .EQU     TIMPOS,STAPOS+10        ; TIME           POSITION
        .EQU     BRKPOS,STAPOS+21        ; BRICKS         POSITION
        .EQU     BRTPOS,STAPOS+25        ; BRICK TOTAL    POSITION
        .EQU     GRDPOS,STAPOS+35        ; GIRDERS        POSITION
        .EQU     GRTPOS,STAPOS+37        ; TOTAL GIRDERS  POSITION
        .EQU     ERRPOS,STAPOS+9         ; TERMINAL ERROR POSITION
        .EQU     TRYPOS,STAPOS+16        ; TOO MAY TRIES  POSITION
        .PAGE                    ;
        .EQU     CRT_BUF,$100    ; CRT DISPLAY I/O ADDRESS
        .EQU     CRT_XPOS,$314   ; CRT X POSITION  ADDRESS
        .EQU     CRT_YPOS,$315   ; CRT Y POSITION  ADDRESS
        .EQU     CRT_CTRL,$316   ; CRT CONTROL I/O ADDRESS

        .EQU     INIFUN,$FFC     ; I/O INITIALIZATION FUNCTION
        .EQU     KBDFUN,$FFD     ; I/O KEYBOARD       FUNCTION
        .EQU     TAPFUN,$FFE     ; I/O TAPE DRIVE     FUNCTION
        .EQU     CLKFUN,$FFF     ; I/O CLOCK          FUNCTION


        .EQU     CLEAR,1         ; CRT   CLEAR SCREEN OPCODE
        .EQU     BELLOP,6        ; CRT   RING BELL    OPCODE

        .EQU     TAPREW,0        ; TAPE  REWIND       OPCODE
        .EQU     TAPRD,1         ; TAPE  READ         OPCODE

        .EQU     CLKRES,1        ; CLOCK RESET OPCODE + 1
        .EQU     CLKGO,2         ; CLOCK START OPCODE + 1
        .EQU     CLKSTP,0        ; CLOCK STOP  OPCODE + 1


        .EQU     TERM,0          ; STRING TERMINATOR


        .EQU     ERROR,$B00      ; DISPLAY ERROR       SUBROTUINE
        .EQU     PUTNUM,$B01     ; DISPLAY NUMBER      SUBROUTINE
        .EQU     PTOA,$B02       ; POSITION-TO-ADDRESS FUNCTION

        .EQU     @,$A00          ; SUBROUTINE MODULE CODE ADDRESS

                                 ; TRANSFER TABLE
         JMP     SAVCON          ; SAVE    CONSTRUCTION  SUBROUTINE
         JMP     DISCON          ; DISPLAY CONSTRUCTION  SUBROUTINE
         JMP     DISSOL          ; DISPLAY SOLUTION      SUBROUTINE
         JMP     CKSOLN          ; CHECK   SOLUTION      FUNCTION
        .PAGE                    ; ******************************
                                 ; * SAVE CONSTRUCTION PROJECT  *
                                 ; ******************************
                                 ;
                                 ;
        .EQU     SVCNCH,2        ; PROJECT CHARACTER
        .PAGE                    ;
SAVCON: BGN#    3               ; INITIATE SUBROUTINE
         PSHA                    ; SAVE ACC
         PSHX                    ; SAVE XR


;     **************************************************************
;     **************************************************************
;     **                                                          **
;     **      ADD CODE HERE TO SAVE THE CONSTRUCTION PROJECT      **
;     **                                                          **
;     **************************************************************
;     **************************************************************


SAVCDN: FIN#    3               ; TERMINATE SUBROUTINE
         POPX                    ; RESTORE XR
         POPA                    ; RESTORE ACC
         RTN                     ; RETURN
        .PAGE                    ; ********************************
                                 ; * DISPLAY CONSTRUCT'N PROJECT  *
                                 ; ********************************
                                 ;
                                 ;
        .EQU     DSCNCH,2        ; PROJECT CHARACTER
        .PAGE                    ;
DISCON: BGN#    3               ; INITIATE SUBROUTINE
         PSHA                    ; SAVE ACC
         PSHX                    ; SAVE XR


;     *****************************************************************
;     *****************************************************************
;     **                                                             **
;     **      ADD CODE HERE TO DISPLAY THE CONSTRUCTION PROJECT      **
;     **                                                             **
;     *****************************************************************
;     *****************************************************************


DISCDN: LDX#    MODPOS          ; DISPLAY 'C' MODE
         LDA#    'C'             ;
         OUTB+   CRT_BUF         ;

         FIN#    3               ; TERMINATE SUBROUTINE
         POPX                    ; RESTORE XR
         POPA                    ; RESTORE ACC
         RTN                     ; RETURN
        .PAGE                    ; *************************
                                 ; * DISPLAY THE SOLUTION  *
                                 ; *************************
                                 ;
                                 ;
        .EQU     R,0             ; ROW
        .EQU     C,1             ; COLUMN
                                 ;
DISSOL: BGN#    2               ; INITIATE SUBROUTINE
         PSHA                    ; SAVE ACC
         PSHX                    ; SAVE XR


;     *************************************************************
;     *************************************************************
;     **                                                         **
;     **      ADD CODE HERE TO DISPLAY THE PROJECT SOLUTION      **
;     **                                                         **
;     *************************************************************
;     *************************************************************


         LDA#    'S'             ; SET SOLUTION MODE
         OUTB    CRT_BUF+MODPOS  ;

DISSDN: FIN#    2               ; TERMINATE SUBROUTINE
         POPX                    ; RESTORE XR
         POPA                    ; RESTORE ACC
         RTN                     ; RETURN
        .PAGE                    ; ***************************
                                 ; * CHECK THE SOLUTION      *
                                 ; *                         *
                                 ; * RESULT:  0: NO SOLUTION *
                                 ; *          1: OK SOLUTION *
                                 ; *                         *
                                 ; ***************************
                                 ;
                                 ;
        .EQU     I,0             ; ROW
        .EQU     J,1             ; COLUMN
        .EQU     RESULT,2        ; RESULT
        .EQU     CKSNCH,3        ; SOLUTION CHARACTER
        .PAGE                    ;
CKSOLN: BGN#    4               ; INITIATE SUBROUTINE
         PSHX                    ; SAVE XR


;     ***********************************************************
;     ***********************************************************
;     **                                                       **
;     **      ADD CODE HERE TO CHECK THE PROJECT SOLUTION      **
;     **                                                       **
;     ***********************************************************
;     ***********************************************************


CKSEND: LDA   ! RESULT          ; SET RESULT
         FIN#    4               ; TERMINATE SUBROUTINE
         POPX                    ; RESTORE XR
         RTN                     ; RETURN
        .PAGE                    ;
        .EQU     @,$B80           ; CONSTANT DATA BASE

TITLE: .BLKW    13               ;
        .EQU     TITLE_LENGTH,38  ;

STATUS:.BLKW    13               ;
        .EQU     STATUS_LENGTH,38 ;

SEPLIN:.BLKW    13               ;
        .EQU     SEPLIN_LENGTH,38 ;

AGAIN: .BLKW    13               ;
        .EQU     AGAIN_LENGTH,38  ;

OVER:  .BLKW    13               ;
        .EQU     OVER_LENGTH,38   ;

RINVST:.BLKW    13               ;
        .EQU     RINVST_LENGTH,38 ;

SINVST:.BLKW    13               ;
        .EQU     SINVST_LENGTH,38 ;

ERRMSG:.BLKW    13               ;
        .EQU     ERRMSG_LENGTH,38 ;

TRYMSG:.BLKW    13               ;
        .EQU     TRYMSG_LENGTH,38 ;

BLANKS:.BLKW    1                ;
        .PAGE
        .EQU     @,$C00          ; VARIABLE DATA BASE

DBGCTL:.BLKW    1               ; DEBUG CONTROL
TIMER: .BLKW    1               ; LOCAL PROJECT TIME
PHASE: .BLKW    1               ; PROGRAM PHASE
ACTION:.BLKW    1               ; ACTION INPUI
MORE:  .BLKW    1               ; MORE   ANSWER
ERRIND:.BLKW    1               ; ERROR INDICATOR
TRIES: .BLKW    1               ; BLOCKED MOVE TRIES
SLINE: .BLKW    1               ; SOLUTION LINE

GIRDL: .BLKW    1               ; LEFT  GIRDER SEGMENTS
GIRDR: .BLKW    1               ; RIGHT GRIDER SEGMENTS
TBRICK:.BLKW    1               ; TOTAL   BRICK  COUNT
TGIRD: .BLKW    1               ; TOTAL   GIRDER COUNT
CBRICK:.BLKW    1               ; CURRENT BRICK  COUNT
CGIRD: .BLKW    1               ; CURRENT GIRDER COUNT
SBRICK:.BLKW    1               ; SUPPLY  BRICK  COUNT
SGIRD: .BLKW    1               ; SUPPLY  GIRDER COUNT

NEXT:  .BLKW    1               ; NEXT SUPPLY TIME
READY: .BLKW    1               ; NEXT SUPPLY READY
INTYPE:.BLKW    1               ; INPUT TYPE
INTIME:.BLKW    1               ; INPUT TIME
INCNT: .BLKW    1               ; INPUT ITEM   COUNT
INBRIK:.BLKW    1               ; INPUT BRICK  COUNT
INGIRD:.BLKW    1               ; INPUT GIRDER COUNT
INLEN: .BLKW    1               ; INPUT GIRDER LENGTH

CRANE: .BLKW    1               ; CRANE CHARACTER
CRNROW:.BLKW    1               ; CRANE ROW
CRNCOL:.BLKW    1               ; CRANE COLUMN
PICKUP:.BLKW    1               ; LOAD PICKUP AREA
M:     .BLKW    1               ; CRANE BRICK LIFT COUNT
SCNLST:.BLKW    1               ; LAST INPUT SCAN CHARACTER
DECDIG:.BLKW    1               ; DECIMAL DIGIT VALUE
BUFADR:.BLKW    1               ; INPUT BUFFER ADDRESS

SGIRDL:.BLKW    MAXGRD          ; SUPPLY GIRDER LENGTHS

        .BLKW    8               ; FILL

SBUF:  .BLKW    (BROWS*BCOLS+2)/3             ; SOLUTION BUFFER

CBUF:  .BLKW    ((ROWS-DROWS)*(SUCPOS-1)+2)/3 ; CONSTRUCT BUFFER

DATEND:.BLKW    1               ;
        .PAGE                    ;
        .END                     ;
