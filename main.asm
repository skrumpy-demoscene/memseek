Start:
	ld hl, $5fff ; start the count at $6000
Reset:
	ld b, $10 ; $10 is the threshold before we count a space
Loop:
	inc hl
	ld a, h
	cp $00 ; have we reached the top of memory?
	ret z ; exit if so
	ld a, (hl)
	cp $00 ; is it a $00
	jr nz, Reset ; if not, start again
	djnz Loop ; it is, carry on
Seek:
	ld de, $000f ; carry on from $0010
SeekLoop:
	inc de
	inc hl
	ld a, h
	cp $00 ; have we reached the top of memory?
	ret z ; exit if so
	ld a, (hl)
	cp $00 ; is it a $00
	jr z, SeekLoop ; it is, carry on
	
	push hl

	dec de
	push de ; put the length on the stack

	ld a, $ff ; get the address at the start of this space
	xor d
	ld d, a
	ld a, $ff
	xor e
	ld e, a
	add hl, de
	
	push hl
	pop bc
	call $2d2b ; push BC to arith stack
	call $2de3 ; print the value
	ld a, $20
	rst 16

	pop bc ; get the length off the stack
	call $2d2b ; push BC to arith stack
	call $2de3 ; print the value
	ld a, $0d
	rst 16

	pop hl ; retrieve the current spot in memory
	jr Reset
