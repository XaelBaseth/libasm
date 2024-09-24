section .text					; definit la section de texte
	global _ft_strlen			; declaration de la fonction ft_strlen et la rend accessible a d'autres fichiers

_ft_strlen:
	xor	rax, rax
	cmp	rdi, 0
	je	exit
	jmp	loop

loop:
	cmp	BYTE [rdi + rax], 0
	je	exit
	inc	rax
	jmp	loop

exit:
	ret