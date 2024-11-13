;bir cumledeki sesli harf sayisini bulan program
.MODEL SMALL
.STACK 100H

.DATA
    STRING DB 10,13,"ELA LALE EL ELE$"
    SESLI DB ?
    MSG1 DB 10,13,"SESLI HARF SAYISI: $"

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET STRING
    MOV BL, 00

DONGU:
    MOV AL, [SI]
    CMP AL,'$'
    JZ SON
    CMP AL,'A'
    JZ COUNT   
    CMP AL,'E'
    JZ COUNT   
    CMP AL,'I'
    JZ COUNT   
    CMP AL,'O'
    JZ COUNT   
    CMP AL,'U'
    JZ COUNT
    CMP AL,'a'
    JZ COUNT   
    CMP AL,'e'
    JZ COUNT   
    CMP AL,'i'
    JZ COUNT   
    CMP AL,'o'
    JZ COUNT   
    CMP AL,'u'
    JZ COUNT   
    INC SI
    JMP DONGU

COUNT: 
    INC BL    ;sayac bl
    INC SI    ;arrayda sonraki yere giden SI
    JMP DONGU    

SON: 
    ; Mesajý yazdýr
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ;Sesli harf sayýsýný yazdýr
    MOV AL, BL
    ADD AL, 30H   ; ASCII'ye dönüþtür
    MOV DL, AL
    MOV AH, 02H
    INT 21H         ; print 

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END
