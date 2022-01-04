	org $8000

start:	di
flip:	xor %00010011
	out (&fe), a
	ld b, 100
freq:	dec b
	jr nz, freq
	jr flip
	ei
	end start
