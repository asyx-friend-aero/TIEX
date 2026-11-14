section .mulbootheader
headerstart:
	dd 0xe85250d6
	dd 0
	dd headerend - headerstart
	dd 0x100000000 - (0xe85250d6 + 0 + (headerend - headerstart))
	dw 0
	dw 0
	dd 8
headerend:
