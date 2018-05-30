; Assignment 13 
; Arturo Rivera
; CIS 11 Assembly Language Programming


WriteInt64 proto
ReadString proto
ExitProcess proto
Crlf proto

.data
	rangeDec QWORD 1						
	array QWORD 12, 10, 3, 89, 8, 11, 420, 8, 9, 2, 43, 22,

.code
main proc
	mov rcx, LENGTHOF array
	mov rsi, OFFSET array
	call printArray

	mov rcx, LENGTHOF array-1	
loopOne:
	push rcx			
	mov rcx, LENGTHOF array			
	sub rcx, rangeDec	
	mov rsi, OFFSET array

loopTwo:
	mov rax, [rsi]
	mov rbx, [rsi + TYPE QWORD]
	cmp rax, rbx
	jng IncPoint			
	mov [rsi], rbx		
	mov [rsi + TYPE QWORD], rax

IncPoint:
	add rsi, TYPE QWORD
	loop loopTwo
	add rangeDec, 1
	pop rcx				
	loop loopOne

	mov rcx, LENGTHOF array		
	mov rsi, OFFSET array
	call printArray
	
	call ReadString	

    call ExitProcess
main endp

printArray PROC USES rax rsi rcx

printLoop:
	mov rax, [rsi]
	add rsi, TYPE QWORD
	call WriteInt64
	loop printLoop
	call Crlf
	ret
printArray ENDP

end