GetCardPic:
    ld a, [wPlayerCostume]
    cp 0
	jr z, .Check0
    cp 1
	jr z, .Check1
    cp 2
	jr z, .Check2
	cp 3
	jr z, .Check3
	cp 4
	jr z, .Check4
	
.Check0
     ld hl, AshCardPic	
	 jr .got_pic
.Check1
     ld hl, OldMistyCardPic	
	 jr .got_pic	
.Check2
     ld hl, BrockCardPic	
	 jr .got_pic
.Check3
     ld hl, GaryCardPic
	 jr .got_pic
.Check4
     ld hl, PikachuCardPic	
	 jr .got_pic
	 
	 
	; ld hl, AshCardPic
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr z, .got_pic
	; ld hl, OldMistyCardPic
.got_pic
	ld de, vTiles2 tile $00
	ld bc, $23 tiles
	ld a, BANK(OldMistyCardPic) ; aka BANK(KrisCardPic)
	call FarCopyBytes
	ld hl, TrainerCardGFX
	ld de, vTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(TrainerCardGFX)
	call FarCopyBytes
	ret

AshCardPic:
INCBIN "gfx/trainer_card/ash_card.2bpp"

OldMistyCardPic:
INCBIN "gfx/trainer_card/old_misty_card.2bpp"

BrockCardPic:
INCBIN "gfx/trainer_card/brock_card.2bpp"

GaryCardPic:
INCBIN "gfx/trainer_card/gary_card.2bpp"

PikachuCardPic:
INCBIN "gfx/trainer_card/pikachu_card.2bpp"

TrainerCardGFX:
INCBIN "gfx/trainer_card/trainer_card.2bpp"