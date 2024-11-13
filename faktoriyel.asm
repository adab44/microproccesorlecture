; Bir sayýnýn faktöriyelini bulan program

DATA SEGMENT
    SAY DW 0005H
    FAK DW ?
DATA ENDS

ASSUME CS:CODE, DS:DATA

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX
    
    MOV BX, SAY
    CMP BX, 0000H
    JZ  SONUC
    CALL faktor
    
SONUC:
    MOV FAK, AX
    MOV FAK+2, DX
       
    MOV AH, 4CH
    INT 21H

faktor PROC
    CMP BX, 01H
    JZ SONUC1
    PUSH BX
    DEC BX
    CALL faktor
    POP BX
    MUL BX
    RET
    
SONUC1:  
    MOV AX, 01H
    RET
faktor ENDP
CODE ENDS
END START
       