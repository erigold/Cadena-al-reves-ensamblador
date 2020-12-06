.model small
.stack 64 
.data        


mens db 'escribe el mensaje:$'
salto db 13,10,'$'

cadena label byte

cant db 20
max  db 00
campo db 20 dup (' ')

.code

inicio:

mov ax,@data
mov ds,ax
push ds
pop es

mov ah,09h
mov dx,offset mens
int 21h

mov ah,0ah
mov dx,offset cadena
int 21h

mov ah,09h
mov dx,offset salto
int 21h

mov cl,cant
mov bx,offset campo
add bl,cant

ciclo:
mov dl,[bx]
mov ah,02h
int 21h
dec bl
dec cl
cmp cl,0
je salir
jmp ciclo

salir:
mov dl,[bx]     
mov ah,02h     
int 21h       
mov ax,4c00h 
int 21h     

end inicio


