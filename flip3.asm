	org 	$8000
start:  ld 	a,%00010000
	ld	c,%00010000
	out	(&fe),a
	xor	c
	out	(&fe),a
	end start
