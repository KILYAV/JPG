.data
test_data db 0,0,0,0,0
	db 01h,02h,03h,04h,05h,06h,07h,08h
	db 09h,10h,11h,12h,13h,14h,15h,16h
	db 17h,18h,19h,20h,21h,22h,23h,24h
	db 25h,26h,27h,28h,29h,30h,31h,32h
	db 33h,34h,35h,36h,37h,38h,39h,40h
	db 41h,42h,43h,44h,45h,46h,47h,48h
	db 49h,50h,51h,52h,53h,54h,55h,56h
	db 57h,58h,59h,60h,61h,62h,63h,64h

.code
align xmmword
CountQuantum:
	lea rsi,[test_data + 5]
	
	movd xmm0,dword ptr[rsi + 00]
	pinsrw xmm0,word ptr[rsi + 05],1
	pinsrw xmm0,word ptr[rsi + 14],2
	pinsrw xmm0,word ptr[rsi + 27],3
	
	mov ecx,[rsi + 02]	; 6 5 4 3
	mov edx,ecx			; 6 5 4 3
	mov ch,cl			; 6 5 3 3
	shl ecx,8			; 5 3 3 0
	
	mov eax,[rsi + 07]	; 11 10 9 8
	mov cl,al			; 5 3 3 8
	mov dl,ah			; 6 5 4 9
	bswap edx			; 9 4 5 6
	shld ebx,eax,10h	; 0 0 11 10
	
	mov eax,

jmp	Main