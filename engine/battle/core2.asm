GetTrainerBackpic:
; Load the player character's backpic (6x6) into VRAM starting from vTiles2 tile $31.

; Special exception for Dude.
    ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .TownCheck
	jr nz, .PlayerCheck

.TownCheck	
     ld a, [wMapGroup]
	 ld b, a	
	 ld a, [wMapNumber]
	 ld c, a
     call GetWorldMapLocation
     cp LANDMARK_PALLET_TOWN
	 jr z, .OakTutorial
     cp LANDMARK_VIRIDIAN_CITY
	 jr z, .OldDudeTutorial

	 
.OakTutorial 
	ld b, BANK(OakBackpic)
	ld hl, OakBackpic
	jr .Decompress

.OldDudeTutorial 
	ld b, BANK(OldDudeBackpic)
	ld hl, OldDudeBackpic
	jr .Decompress

.PlayerCheck	
	ld a, [wPlayerCostume]
    cp 2
	jr z, .BrockBackpic
	 cp 3
	jr z, .GaryBackpic
     cp 4
	jr z, .PikachuBackpic	
	
	; What gender are we?
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .AshBackpic
	ld a, [wPlayerGender]
;	bit PLAYERGENDER_FEMALE_F, a
    and a ; MALE
	jr z, .AshBackpic
	dec a ; FEMALE
	jr z, .MistyBackpic
	ret



.BrockBackpic:
	farcall GetBrockBackpic
	ret

.GaryBackpic:
	farcall GetGaryBackpic
	ret

.PikachuBackpic:
	farcall GetPikachuBackpic
	ret
	
.MistyBackpic:
; It's a girl.
	farcall GetMistyBackpic
	ret

.AshBackpic:
; It's a boy.
	ld b, BANK(ChrisBackpic)
	ld hl, ChrisBackpic

.Decompress:
	ld de, vTiles2 tile $31
	ld c, 7 * 7
	predef DecompressGet2bpp
	ret
