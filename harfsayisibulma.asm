;bir cumledeki harf sayisini bulman kod mantik guzel ama calismasinda sýkýnti var
.MODEL SMALL
.STACK 100H

.DATA
    STRING DB 10,13,"ELA LALE EL ELE$"
    HARF DB ?
    MSG1 DB 10,13,"HARF SAYISI: $"

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
    CMP AL, 'A'
    JAE COUNT   ; Eger AL >= 'A' ise ve bir harfse
    CMP AL, 'Z'
    JBE COUNT   ; Eger AL <= 'Z' ise ve bir harfse
    CMP AL, 'a'
    JAE COUNT   ; Eger AL >= 'a' ise ve bir harfse
    CMP AL, 'z'
    JBE COUNT   ; Eger AL <= 'z' ise ve bir harfse
    INC SI
    JMP DONGU

COUNT: 
    INC BL    ; sayac bl
    INC SI    ; arrayda sonraki yere giden SI
    JMP DONGU    

SON: 
    ; Mesajý yazdýr
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Harf sayýsýný yazdýr
    MOV AL, BL
    ADD AL, 30H   ; ASCII'ye dönüþtür
    MOV DL, AL
    MOV AH, 02H
    INT 21H         ; print 

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
