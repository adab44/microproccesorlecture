.MODEL SMALL
.DATA
        BASE DB 3       ; Sabit taban de�eri
        POW DB 4        ; Sabit �s de�eri

.CODE
MAIN PROC

        MOV AX,@DATA
        MOV DS,AX

        MOV AL, BASE    ; BASE'i AL register'�na y�kle
        MOV BL, AL      ; BL register'�na da ayn� de�eri y�kle
        MOV CL, POW     ; CL register'�na POW'u (�s) y�kle
        DEC CL          ; �s� bir azalt (��nk� 1. �arpma BASE ile zaten yap�lm�� olacak)
        MOV AX, 00
        MOV AL, BASE    ; AX'i BASE ile ba�lat

LBL1:
        MUL BL          ; AX = AX * BL
        LOOP LBL1       ; CL s�f�r olana kadar d�ng�y� devam ettir

        MOV CL, 10      ; ��kt�y� iki haneli olarak g�stermek i�in 10'a b�l
        DIV CL
        ADD AX, 3030H   ; Sonucu ASCII'ye �evir
        MOV DX, AX

        MOV AH, 02H     ; �lk basama�� ekrana yazd�r
        INT 21H
        MOV DL, DH      ; �kinci basama�� DL'ye y�kle
        INT 21H         ; �kinci basama�� ekrana yazd�r

        MOV AH, 4CH     ; Program� sonland�r
        INT 21H

MAIN ENDP
END MAIN
