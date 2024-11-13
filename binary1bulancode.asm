DATA SEGMENT
    DATA1 DB ?               ; Kullan�c�n�n girdi�i say� burada saklanacak
    MSG1 DB 10,13,"SAYI Gir: $"     ; Kullan�c�dan say� istemek i�in mesaj
    MSG2 DB 10,13,"ICINDEKI 1 SAYISI = $"  ; Sonucu g�stermek i�in mesaj
DATA ENDS

ASSUME CS:CODE, DS:DATA

CODE SEGMENT
START:
    MOV AX, DATA             ; DATA segmentinin ba�lang�� adresini AX'e y�kle
    MOV DS, AX               ; DS'ye AX'teki adresi y�kleyerek veri segmentini ayarla

    SUB BL, BL               ; `BL` kayd�n� s�f�rla (binary `1` say�s�n� tutacak)

    LEA DX, MSG1             ; MSG1 mesaj�n�n adresini DX'e y�kle
    MOV AH, 9H               ; AH = 9, ekrana yazd�rma i�lemi i�in
    INT 21H                  ; "SAYI Gir: $" mesaj�n� ekrana yazd�r

    MOV AH, 1H               ; Kullan�c�dan bir karakter almak i�in AH'ye 1 y�kl�yoruz
    INT 21H                  ; Kullan�c�dan bir karakter girilmesini bekler
    SUB AL, 30H              ; Girilen ASCII karakterini say�ya d�n��t�r (ASCII - 30h)

    MOV DATA1, AL            ; Kullan�c�n�n girdi�i say�y� DATA1'de sakla
    MOV DL, 8H               ; DL'ye 8 y�kle, 8 bitlik say�y� kontrol etmek i�in

TEKRAR:
    ROL AL, 1                ; (Rotate Left)
    JNC NEXT                 ; Carry Flag 0 `NEXT` etiketine atla
    INC BL                   ; Carry Flag 1 ise (1 biti varsa), `BL`'yi art�r

NEXT:
    DEC DL                   ; DL'yi bir azalt
    JNZ TEKRAR               ; DL s�f�r de�ilse TEKRAR d�ng�s�ne git

    LEA DX, MSG2             
    MOV AH, 9H               
    INT 21H                  

    ADD BL, 30H              
    MOV DL, BL               
    MOV AH, 2H              
    INT 21H                  

EXIT:
    MOV AH, 4CH              ; Programdan ��kmak i�in
    MOV AL, 0
    INT 21H 

CODE ENDS
END START
