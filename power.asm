.MODEL SMALL
.DATA
        BASE DB 3       ; Sabit taban deðeri
        POW DB 4        ; Sabit üs deðeri

.CODE
MAIN PROC

        MOV AX,@DATA
        MOV DS,AX

        MOV AL, BASE    ; BASE'i AL register'ýna yükle
        MOV BL, AL      ; BL register'ýna da ayný deðeri yükle
        MOV CL, POW     ; CL register'ýna POW'u (üs) yükle
        DEC CL          ; Üsü bir azalt (çünkü 1. çarpma BASE ile zaten yapýlmýþ olacak)
        MOV AX, 00
        MOV AL, BASE    ; AX'i BASE ile baþlat

LBL1:
        MUL BL          ; AX = AX * BL
        LOOP LBL1       ; CL sýfýr olana kadar döngüyü devam ettir

        MOV CL, 10      ; Çýktýyý iki haneli olarak göstermek için 10'a böl
        DIV CL
        ADD AX, 3030H   ; Sonucu ASCII'ye çevir
        MOV DX, AX

        MOV AH, 02H     ; Ýlk basamaðý ekrana yazdýr
        INT 21H
        MOV DL, DH      ; Ýkinci basamaðý DL'ye yükle
        INT 21H         ; Ýkinci basamaðý ekrana yazdýr

        MOV AH, 4CH     ; Programý sonlandýr
        INT 21H

MAIN ENDP
END MAIN
