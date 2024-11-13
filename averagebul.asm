DATA SEGMENT
    ARRAY DB 1,2,3,4,5
    AVG DB ?                    ; Ortalamay� saklamak i�in bellek alan�
    MSG DB "AVERAGE = $"        ; Yazd�r�lacak mesaj
ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
START:
     MOV AX, DATA               ; Data segmentini yukler
     MOV DS, AX

     LEA SI, ARRAY              ; SI kaydina dizinin baslangic� adresini yukler
     
     LEA DX, MSG                ; DX kaydina MSG'nin adresini yukle
     MOV AH, 9                  ; 09h islevi, ekrana diziyi yazdirir
     INT 21H                    ; Yazdirma iilemi icin 

     MOV AX, 00                 ; AX kaydini sifirla 
     MOV BL, 5                  ; BL'ye dizideki eleman sayisini yikle (bolme isleminde bolen)

     MOV CX, 5                  ; CX'e dongu sayisini yukle (5 eleman i�in)
LOOP1:
     ADD AL, [SI]               ; SI'nin isaret ettigi adresteki degeri AL'ye ekle
     INC SI                     ; SI +1
     LOOP LOOP1                 ; Dongu CX sifira olana kadar 

     DIV BL                     ;  bolme isleminde bolen

     ADD AL, 30H                ; Sonucu ASCII formatinda ekrana basar(tek karakter icin)

     MOV DL, AL                 ; Sonucu� (ortalama) DL'ye yukler
     MOV AH, 2                  ; 02h i�levi, DL'deki tek karakteri ekrana yazar
     INT 21H                    ; Yazd�rma i�lemini yap

     MOV AH, 4CH                ; Program� sonland�rma i�levi
     INT 21H                    ; Program� bitir

ENDS
END START
