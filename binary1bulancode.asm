DATA SEGMENT
    DATA1 DB ?               ; Kullanýcýnýn girdiði sayý burada saklanacak
    MSG1 DB 10,13,"SAYI Gir: $"     ; Kullanýcýdan sayý istemek için mesaj
    MSG2 DB 10,13,"ICINDEKI 1 SAYISI = $"  ; Sonucu göstermek için mesaj
DATA ENDS

ASSUME CS:CODE, DS:DATA

CODE SEGMENT
START:
    MOV AX, DATA             ; DATA segmentinin baþlangýç adresini AX'e yükle
    MOV DS, AX               ; DS'ye AX'teki adresi yükleyerek veri segmentini ayarla

    SUB BL, BL               ; `BL` kaydýný sýfýrla (binary `1` sayýsýný tutacak)

    LEA DX, MSG1             ; MSG1 mesajýnýn adresini DX'e yükle
    MOV AH, 9H               ; AH = 9, ekrana yazdýrma iþlemi için
    INT 21H                  ; "SAYI Gir: $" mesajýný ekrana yazdýr

    MOV AH, 1H               ; Kullanýcýdan bir karakter almak için AH'ye 1 yüklüyoruz
    INT 21H                  ; Kullanýcýdan bir karakter girilmesini bekler
    SUB AL, 30H              ; Girilen ASCII karakterini sayýya dönüþtür (ASCII - 30h)

    MOV DATA1, AL            ; Kullanýcýnýn girdiði sayýyý DATA1'de sakla
    MOV DL, 8H               ; DL'ye 8 yükle, 8 bitlik sayýyý kontrol etmek için

TEKRAR:
    ROL AL, 1                ; (Rotate Left)
    JNC NEXT                 ; Carry Flag 0 `NEXT` etiketine atla
    INC BL                   ; Carry Flag 1 ise (1 biti varsa), `BL`'yi artýr

NEXT:
    DEC DL                   ; DL'yi bir azalt
    JNZ TEKRAR               ; DL sýfýr deðilse TEKRAR döngüsüne git

    LEA DX, MSG2             
    MOV AH, 9H               
    INT 21H                  

    ADD BL, 30H              
    MOV DL, BL               
    MOV AH, 2H              
    INT 21H                  

EXIT:
    MOV AH, 4CH              ; Programdan çýkmak için
    MOV AL, 0
    INT 21H 

CODE ENDS
END START
