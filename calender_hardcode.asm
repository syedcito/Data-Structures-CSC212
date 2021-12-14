
org 100h

; add your code here
.model small
.data

Cal1 db " January 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 31 29 ",13,10,0

Cal2 db " February 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 ",13,10,0

Cal3 db " March 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 29 ",13,10,0

Cal4 db " April 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 31 29 ",13,10,0

Cal5 db " May 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 31 29 ",13,10,0

Cal6 db " June 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 29 ",13,10,0

Cal7 db " July 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 31 29 ",13,10,0

Cal8 db " August 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 31 29 ",13,10,0

Cal9 db " September 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30  29 ",13,10,0

Cal10 db " October 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 31 29 ",13,10,0

Cal11 db " November 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30  29 ",13,10,0

Cal12 db " December 2021 ",13,10
db "Sun Mon Tue Wed Thu Fri Sat",13,10
db " 1 2 3 4 ",13,10
db " 5 6 7 8 9 10 11 ",13,10
db " 12 13 14 15 16 17 18 ",13,10
db "19 20 21 22 23 24 25 ",13,10
db "26 27 28 29 30 31 29 ",13,10,0

EndStr db "$" ; tell DOS to stop printing here


.code


mov ax,@data ; initialize data segment
mov ds,ax

mov dx,offset Cal ; print Calender
mov ah,9
int 21h

mov ax, 4c00h ; return to DOS
int 21h
