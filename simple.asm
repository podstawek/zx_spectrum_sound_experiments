	org $8000

start: 	ld de, 500

flip: 	xor %00010111
	out (&fe), a
	ld bc, 500

freq: 	dec c
	jr nz, freq
	dec b
	jr nz, freq
	jr flip

	end start
