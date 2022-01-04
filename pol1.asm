; adapted from Pavel Lebedev (Мир звуков Спектрума, https://vtrd.in/book/ZXSWORLD.ZIP)

	org 	$8000

chord: 	ex	af,af'		; swap primary and alternative AF registers
	ld	b,d		; counter 2
	ld	c,e		; counter 1
beep:	ex	af,af'		; swap registers (swap the voice)
	dec	c		; decrement c
	jr	nz,cont		; if not zero, go to cont
	ld	c,e		; restore counter 1
	xor	16		; invert bit 4 of voice 1
cont:	out	(254),a		; send accumulator to port 254 (&FE)
	ex	af,af'		; swap registers (swap the voice)
	dec	b		; decrement b
	jr	nz,cont2	; if not zero, go to cont2
	ld	b,d		; restore counter 2
	xor	16		; invert bit 4 of voice 2
cont2:	out	(254),a		; send accumulator to port 254 (&FE)
	inc	l		; This loop...
	jr	nz,beep		; ...is constant just to stretch the duration
	dec	h		; This loop...
	jr	nz,beep		; ...controls the duration.
	ret			; return from subroutine "chord"

start:	di
	ld	d,165		; 165 C3 (131 Hz)
	ld	e,113		; 113 G3 (195 Hz)
	ld	h,90		; duration
	call	chord
	ld	d,113		; 113 G3 (195 Hz)
	ld	e,75		; 75 D4 (294 Hz)
	ld	h,90		; duration
	call	chord
	ld	d,100		; 100 A3 (220 Hz)
	ld	e,67		; 67 E4 (329 Hz)
	ld	h,90		; duration
	call	chord
	ld	d,63		; 63 F4 (349 Hz)
	ld	e,75		; 75 D4 (294 Hz)
	ld	h,90		; duration
	call	chord
	ld	d,165		; 165 C3 (131 Hz)
	ld	e,113		; 113 G3 (195 Hz)
	ld	h,90		; duration
	call	chord
	ld	d,113		; 113 G3 (195 Hz)
	ld	e,75		; 75  D4 (294 Hz)
	ld	h,90		; duration
	call	chord
	ld	d,100		; 100 A3 (220 Hz)
	ld	e,67		; 67 E4 (329 Hz)
	ld	h,90		; duration
	call	chord
	ld	d,113		; 113 G3 (195 Hz)
	ld	e,84		; 84 C4 (262 Hz)
	ld	h,90		; duration
	call	chord
	jr	start		; repeat ad infinitum
	ei
	end 	start
