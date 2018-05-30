; Assignment 12
; Arturo Rivera
; CIS 11 - Assembly Language Programming



WriteInt64 PROTO
ReadInt64 PROTO
ExitProcess PROTO
Crlf PROTO
.data
myArray QWORD 10d,20d,30d,40d
finalArray QWORD 4 DUP(0)


.code
main proc
	mov rcx, 4
	mov rsi, 0
	mov r15, 8

mov rcx, 4
mov rsi, 0
loopTwo:
    mov rax, rsi
    mul r15
    mov rdi, rax
    mov rax, myArray[rax]
    call WriteInt64
	inc rsi

LOOP loopTwo
call Crlf
mov rcx, 4
mov rsi, 0
mainLoop:

	mov rax, rsi
	mul r15
	mov rdx, myArray[rax]

	cmp rsi, 3
	je HandleLast

	mov finalArray[rax + 8], rdx
	jmp EndLoop
		
	HandleLast:
	mov finalArray[0], rdx

	EndLoop:
	inc rsi
LOOP mainLoop
  
mov rcx, 4
mov rsi, 0

loopThree:
    mov rax, rsi
    mul r15
    mov rdi, rax
    mov rax, finalArray[rax]
    call WriteInt64
	inc rsi

LOOP loopThree
	call ReadInt64
	call ExitProcess
main endp
end