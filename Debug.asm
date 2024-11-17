.data
align xmmword
bitmap BITMAP {}
pathFile db "C:\JPG.jpg",0

.code
align xmmword
Debug proc
Debug endp
	lea rcx,bitmap
	lea rdx,pathFile
	sub rsp,10h
	
	call Jtob