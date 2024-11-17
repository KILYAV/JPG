.code
align xmmword
CommentJPG:
	movzx eax, word ptr [rsi + word]
	ror ax,8
	lea rsi,[rsi + rax + 2]
jmp Main