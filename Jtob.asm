.code
align xmmword
Jtob proc
Jtob endp
	push rbx
	push rbp
	push rsi
	push rdi

	push r13
	push r14
	push r15

	mov rdi,rcx
	mov rsi,rdx
	
	call Load

	cmp word ptr [rsi], 0d8ffh
	jnz ERROR
	add rsi,word
	
align xmmword
Main:
	movzx eax,word ptr[rsi]
	cmp eax, 0feffh
	jz  CommentJPG
	cmp eax, 0dbffh
	jz  CountQuantum
	
ERROR:
   	ret

	SIZEBMP      equ 0c0ffh
	DATABITS     equ 0daffh
	COUNTHUFFMAN equ 0c4ffh
