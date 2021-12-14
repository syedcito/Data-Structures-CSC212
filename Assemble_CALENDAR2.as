.Model small
.stack 100h

.data
dtxt db "SunMonTueWedThuFriSat2021Previous Next Quit"
scr dw 80*25 dup(?)

; Length: 50
jan_name db "              J  A  N  U  A  R  Y               "
feb_name db "              F  E  B  U  A  R  Y               "
mar_name db "                 M  A  R  C  H                  "
apr_name db "                 A  P  R  I  L                  "
may_name db "                    M  A  Y                     "
jun_name db "                  J  U  N  E                    "
jul_name db "                  J  U  L  Y                    "
aug_name db "               A  U  G  U  S  T                 "
sep_name db "           S  E  P  T  E  M  B  E  R            "
oct_name db "              O  C  T  O  B  E  R               " 
nov_name db "            N  O  V  E  M  B  E  R              "
dec_name db "            D  E  C  E  M  B  E  R              "

;Length: 90
jan db "      1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262728293031                "
feb db "            1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262727                "
mar db "            1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262728293031          "
apr db "    1 2 3 4 5 6 7 8 9 101112131415161718192021222324252627282930                    "
may db "        1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262728293031              "
jun db "              1 2 3 4 5 6 7 8 9 101112131415161718192021222324252627282930          "
jul db "    1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262728293031                  "
aug db "          1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262728293031            "
sep db "  1 2 3 4 5 6 7 8 9 101112131415161718192021222324252627282930                      "
oct db "      1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262728293031                " 
nov db "            1 2 3 4 5 6 7 8 9 101112131415161718192021222324252627282930            "
des db "  1 2 3 4 5 6 7 8 9 10111213141516171819202122232425262728293031                    "

.code
.386
org 100h

jmp START

saveClrScreen:
	mov ax,0B800h
	mov es,ax
	mov cx,80*25
	sub si,si
	sCS:
	mov ax,es:[si]
	mov es:[si],0F20h
	mov scr[si],ax
	add si,2
	loop sCS
	ret
	
rtnScreen:
	mov ax,0B800h
	mov es,ax
	mov cx, 80*25
	sub si,si
	rS:
	mov ax,scr[si]
	mov es:[si],ax
	add si,2
	loop rS
	ret
	
clrScreen:
	mov ax,0B800h
	mov es,ax
	mov cx, 80*25
	mov si,80
	cS1:
	mov es:[si],0F20h
	add si,2
	loop cS1
	ret
	
shrinkCursor:
	mov ch,32
	mov ah,1
	int 10h
	ret
	
restoreCursor:
	mov ch,6
	mov cl,7
	mov ah,1
	int 10h
	ret
	
getDate:
	mov ah,2Ah
	int 21h
	dec dh
	mov month,dh
	ret

DRWHD proc near
	pusha
	; Draw the top part of the calendar
	; Color banner
	mov cx,160
	mov si,0
	mov ax,3f20h
dh1:mov es:[si],ax
	add si,2
	loop dh1
	; Head decorations
	mov ax,3fbah
	mov es:[0],ax
	mov es:[158],ax
	mov ax,3fc8h
	mov es:[160],ax
	mov ax,3fbch
	mov es:[318],ax
	mov ax,3fcdh
	mov si,162
	mov cx,34
dh2:mov es:[si],ax
	add si,2
	loop dh2
	add si,14
	mov cx,37
dh3:mov es:[si],ax
	add si,2
	loop dh3
	
	; Draw some other decorations 
	mov ax,3fcbh
	mov es:[168],ax
	mov es:[310],ax
	
	mov ax,1fbah
	mov si,328	; 3rd row 4th col
	mov cx,21
dh4:mov es:[si],ax
	add si,142
	mov es:[si],ax
	add si,18
	loop dh4
	
	mov ax,1fc8h	; si at bottom left corner
	mov es:[si],ax
	add si,2
	
	mov ax,1fcdh	;bottom row
	mov cx,70
dh5:mov es:[si],ax
	add si,2
	loop dh5
	
	mov ax,1fbch	; si is at bottom right corner
	mov es:[si],ax

	popa
	ret
DRWHD endp

DRWBD proc near
	pusha
	 Draws the body of the calendar
	
	mov cx,20
	mov si,502		; start
	mov ax,02b3h
db1:mov dx,8
db2:mov es:[si],ax
	add si,16
	dec dx
	jnz db2
	add si,32
	loop db1
	
	 Top horizontal
	mov cx,57
	mov si,342
	mov ax,02c4h
db3:mov es:[si],ax
	add si,2
	loop db3
	
	mov cx,7
	mov si,662
db4:mov dx,57
db5:mov es:[si],ax
	add si,2
	dec dx
	jnz db5
	add si,366
	loop db4
	

	mov si,342
	mov cx,6
	mov ax,02dah
	mov es:[si],ax
	add si,16
	mov ax,02c2h
db6:mov es:[si],ax
	add si,16
	loop db6

	mov ax,02bfh
	mov es:[454],ax

	mov cx,7
	mov si,662
db7:mov ax,02c3h
	mov es:[si],ax
	mov ax,02b4h
	add si,112
	mov es:[si],ax
	add si,368
	loop db7
	
	
	mov ax,02c5h
	mov si,678
	mov cx,7
db8:mov dx,6
db9:mov es:[si],ax
	add si,16
	dec dx
	jnz db9
	add si,384
	loop db8
	
	mov si,3542
	mov cx,6
	mov ax,02c0h
	mov es:[si],ax
	add si,16
	mov ax,02c1h
db0:mov es:[si],ax
	add si,16
	loop db0

	mov ax,02d9h
	mov es:[3654],ax
	
	popa
	ret
DRWBD endp

COLBD proc near
	pusha
	; Colors calendar
	; Day colors
	mov al,67h
	mov si,343
	mov cx,3
c1:	mov bx,57
c2: mov es:[si],al
	add si,2
	dec bx
	jnz c2
	add si,46
	loop c1
	
	; Number colors
	mov al,47
	mov si,823
	mov cx,18
c3:	mov bx,57
c4:	mov es:[si],al
	add si,2
	dec bx
	jnz c4
	add si,46
	loop c3
	
	popa
	ret
COLBD endp

DRWTXT proc near
	pusha
	mov ax,@data
	mov ds,ax
	
	mov cx,7	; 7 days
	mov si,offset dtxt
	mov di,0
	mov bx,506
	mov ah,60h
dt1:mov dx,3
dt2:lodsb
	mov es:[bx],ax
	add bx,2
	dec dx
	jnz dt2
	add bx,10
	loop dt1
	
	mov cx,4	; Length of year
	mov bx,230
	mov ah,3fh
dt3:lodsb
	mov es:[bx],ax
	add bx,4
	loop dt3
	
	mov cx,24	; Length of instructions
	mov bx,3898
	mov ah,0fh	; Match the back color
dt4:lodsb
	mov es:[bx],ax
	add bx,2
	loop dt4
	
	popa
	ret
DRWTXT endp

MONTH proc near
	pusha
	mov cx,52	; Size of month text
	mov bx,38	; Month start position
	mov ah,60h	; Text 

cm:lodsb
	mov es:[bx],ax
	add bx,2
	loop cm
	
	popa
	ret
MONTH endp

CALEND proc near
	pusha
	
	cmp dh,1	; Jan
	jne cl1
	mov si,offset jan_name	; Set to jan text
	call MONTH
	mov si,offset jan	
	jmp don
	
cl1:cmp dh,2	
	jne cl2
	mov si,offset feb_name
	call MONTH
	mov si, offset feb
	jmp don
	
cl2:cmp dh,3	
	jne cl3
	mov si,offset mar_name
	call MONTH
	mov si, offset mar
	jmp don
	
cl3:cmp dh,4
	mov si,offset apr_name
	call MONTH
	mov si, offset apr
	jmp don
	; May
	jne cl5
	mov si,offset may_name
	call MONTH
	mov si, offset may
	jmp don
	
cl5:cmp dh,6	
	jne cl6
	mov si,offset jun_name
	call MONTH
	mov si, offset jun
	jmp don
	
cl6:cmp dh,7	
	jne cl7
	mov si,offset jul_name
	call MONTH
	mov si, offset jul
	jmp don
	
cl7:cmp dh,8	
	jne cl8
	mov si,offset aug_name
	call MONTH
	mov si, offset aug
	jmp don
	
cl8:cmp dh,9 	
	jne cl9
	mov si,offset sep_name
	call MONTH
	mov si, offset sep
	jmp don
	
cl9:cmp dh,10	
	jne cl0
	mov si,offset oct_name
	call MONTH
	mov si, offset oct
	jmp don
	
cl0:cmp dh,11	
	jne cla
	mov si,offset nov_name
	call MONTH
	mov si, offset nov
	jmp don
	
cla:mov si,offset dec_name
	call MONTH
	mov si, offset des
	jmp don


don:				
	mov ah,60h		
	mov bx,986		
	mov cx,6		; length of dates 48
da1:mov dx,7
da2:lodsb
	mov es:[bx],al
	lodsb
	add bx,2
	mov es:[bx],al
	add bx,14		; Jump to next cell
	dec dx
	jnz da2
	add bx,368		; Jump to next row
	loop da1

	popa
	ret
CALEND endp

CONTROL proc near
	; Get user input (Z-Previous X-Next C-Quit)
IP1:mov ah,00h	
	int 16h
	cmp al,7ah	
	je pre
	cmp al,78h	
	je nex
	cmp al,63h  
	je exi
	jmp IP1		
	
pre:cmp dh,1	
	je IP1
	dec dh		
	call CALEND
	jmp IP1

nex:cmp dh,12	
	je IP1
	inc dh		
	call CALEND
	jmp IP1
	
exi:ret			
CONTROL endp

START:
	mov 	ax,0300h
	int 	10h
	mov 	ax,0B800h	
	mov		es,ax		
	call	saveClrScreen	
	call	clrScreen		
	call 	DRWHD		
	call	DRWBD		
	call	DRWTXT		
	mov 	ah,2ah		
	int 	21h			
	call 	CALEND		
	call 	CONTROL		
	call	rtnScreen		
.exit
end START
