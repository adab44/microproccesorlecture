data segment
    arr db 10, 20, 30, 40  ; array of 4 num
    message db " $"       ; message to print after each number
data ends

code segment
assume cs:code, ds:data

Main proc
       mov ax, data       ; initialize data segment
       mov ds, ax         
       mov cx, 4          ; set up loop counter for 4 elements
       lea si, arr        ; load address of the array into si

loop1:
       mov al, [si]       ; load current array element into al
       add al, 30h        ; convert to ASCII
       mov dl, al         ; move the converted value to dl
       mov ah, 02h        ; function to display character
       int 21h

       lea dx, message    ; load address of the message (a space)
       mov ah, 09h        ; function to display string
       int 21h

       inc si             ; point to the next array element
       loop loop1         ; repeat for all elements

       ; End program
       mov ah, 4ch        ; terminate program
       int 21h

Main endp
code ends
end Main