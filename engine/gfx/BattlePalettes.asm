ForestColors:
CaveColors:
NightColors:
	call NightColorSwap
	
; b = gggrrrrr, c = 0bbbbbGG	
.loop
	ld a, b
	ld [de], a
	inc de
	inc hl
	
	ld a, c
       ld [de], a
	inc de
	inc hl
	
	call NightColorSwap
	
; b = gggrrrrr, c = 0bbbbbGG
.loop2
	ld a, b
	ld [de], a
	inc hl
	inc de
	
	ld a, c
	ld [de], a
	inc hl
	inc de
	
	ret
	
NightColorSwap:
	push de
	
; red
	ld a, [hl] ; gggrrrrr
	and $1f ; 00011111 -> 000rrrrr
	
	ld e, a ; red in e
	
;green
	ld a, [hli] ; gggrrrrr
	and $e0 ; 11100000 -> ggg00000
	ld b, a 
	ld a, [hl] ; 0bbbbbGG
	and 3 ; 00000011 -> 000000GG
	or b ; 000000GG + ggg00000
	swap a ; ggg0 00GG -> 00GGggg0
	rrca ; 000GGggg
	
	ld d, a ; green in d

;blue
	ld a, [hld] ; 0bbbbbGG
	and $7c ; 1111100 -> 0bbbbb00
	
	ld c, a ; blue in c

;modify colors here
	srl e ; 1/2 red
	srl d ; 1/2 green

; 3/4 blue	
	ld a, c
	rrca ; 1/2
	ld b, a
	rrca ; 1/4
	add b ; 2/4 + 1/4 = 3/4
	and %01111100 ; mask the blue bits
	ld c, a

;reassemble green
	ld a, d
	rlca ; 00GGggg0
	swap a ; 00GG ggg0 -> ggg000GG
	and $e0 ; 11100000 -> ggg00000
	ld b, a
	ld a, d
	rlca ; 00GGggg0
	swap a ; 00GG ggg0 -> ggg000GG
	and 3 ; 00000011 -> 000000GG
	ld d, a
	
;red in e, low green in b, high green in d, blue in c
	ld a, e 
	or b ; 000rrrrr + ggg00000
	ld b, a ; gggrrrrr
	ld a, d
	or c ; 0bbbbb00 + 000000GG
	ld c, a ; 0bbbbbGG
	pop de
	ret