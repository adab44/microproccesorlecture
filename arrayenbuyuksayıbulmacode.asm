 data segment
    grades db 10h, 12h, 70h, 55h, 30h  ;5 numbers in an array
    message db "Highest grade is: $"  ;message to print highest grade
    highest_grade db ?                ;variable to store highest grade
data ends

code segment
assume cs:code, ds:data
start:
       mov ax, data
       mov ds, ax         ;initialize data segment 
       
       mov cx, 05h        ;set up loop counter to 5 (for 5 grades)

       mov bl, 00h        ;bl stores highest grade, initialize to 0
       lea si, grades     ;si points to the start of the grades array

find_highest:
       mov al, [si]       ;load next grade into al
       cmp al, bl         ;compare al with current highest grade in bl
       jle skip           ; if current grade is less than or equal to highest, skip
       mov bl, al         ;else, update highest grade in bl

skip:  inc si             ;point to next grade in the array
       loop find_highest  ;repeat for all grades

       mov highest_grade, bl ;store the highest grade

       ;Displaying the highest grade
       lea dx, message    ;load address of message
       mov ah, 09h        ;function to display string
       int 21h

       mov dl, highest_grade ;load highest grade to dl ,
       add dl, 30h           ;convert to ASCII
       mov ah, 02h           ;to display 
       int 21h

       ;End program
       mov ah, 4ch         ;terminate program
       int 21h

code ends
end start
    