.code
align xmmword	
Load:
	sub rsp,38h
	mov rcx,rsi
	mov edx,GENERIC_READ
	mov r8,FILE_SHARE_READ
	xor r9,r9
	mov dword ptr[rsp + 20h],OPEN_EXISTING
	mov dword ptr[rsp + 28h],FILE_ATTRIBUTE_READONLY
	mov dword ptr[rsp + 30h],GENERIC_READ
	call CreateFile
	
	HNFILE equ r15
	mov HNFILE,rax
	
	mov rcx,rax
	call GetFileSize
	
	SZFILE equ r14
	mov SZFILE,rax
	
	call GetProcessHeap
	
	HNHEAP equ r13
	mov HNHEAP,rax
	
	mov rcx,HNHEAP
	mov edx,HEAP_NO_SERIALIZE
	mov r8,SZFILE
	call HeapAlloc
	mov rsi,rax
	
	mov rcx,HNFILE
	mov rdx,rsi
	mov r8,SZFILE
	lea r9,[rsp + 28h]
	mov dword ptr[rsp + 20h],0
	call ReadFile
	
	mov rcx,HNFILE
	call CloseHandle
	
	add rsp,38h
	ret