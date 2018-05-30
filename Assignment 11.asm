; Chapter 4 Section 4.10 Programming Exercises: Question 2
; Arturo Rivera
; CIS 11
; Assignment 11

WriteInt64 proto
ReadInt64 proto
ExitProcess proto
.data
myArray QWORd 1d,2d,3d,4d,5d,6d,7d,8d,9d,10d
.code

main proc
	mov rcx, 10
 	mov rbx, 0
	mov r12 ,8

L1:
	mov rax,rbx
	mul r12
	mov r11,rax
	mov rax, myArray[r11]

	call WriteInt64
	inc rbx

loop L1
 	mov rcx, 5
   	mov rbx, 0
	mov r12 ,8

SWAPL2:
	mov rax,rbx
	mul r12
    mov r11,rax
	mov rbp,r11
	add rbp,8

	mov r14, myArray[r11]
	mov r15,myArray[rbp]
	mov myArray[r11],r15
	mov myArray[rbp],r14
	add rbx, 2

loop SWAPL2
	call ReadInt64
	mov rcx, 10
    mov rbx, 0
	mov r12 ,8

L3:		
    mov rax,rbx
	mul r12
	mov r11,rax
	mov rax, myArray[r11]		
	call WriteInt64
	inc rbx

loop L3

call ReadInt64
call ExitProcess

main endp

end