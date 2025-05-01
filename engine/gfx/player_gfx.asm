BetaLoadPlayerTrainerClass: ; unreferenced
	ld c, CAL
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_class
	ld c, KAREN ; not KRIS?
.got_class
	ld a, c
	ld [wTrainerClass], a
	ret

MovePlayerPicRight:
	hlcoord 6, 4
	ld de, 1
	jr MovePlayerPic

MovePlayerPicLeft:
	hlcoord 13, 4
	ld de, -1
	; fallthrough

MovePlayerPic:
; Move player pic at hl by de * 7 tiles.
	ld c, $8
.loop
	push bc
	push hl
	push de
	xor a
	ldh [hBGMapMode], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ldh [hBGMapThird], a
	call WaitBGMap
	call DelayFrame
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	ret z
	push hl
	push bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	lb bc, 7, 7
	call ClearBox
	pop bc
	pop hl
	jr .loop

; ShowPlayerNamingChoices:
	; ld hl, ChrisNameMenuHeader
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr z, .got_header
	; ld hl, KrisNameMenuHeader
; .got_header
	; call LoadMenuHeader
	; call VerticalMenu
	; ld a, [wMenuCursorY]
	; dec a
	; call CopyNameFromMenu
	; call CloseWindow
	; ret
ShowPlayerNamingChoices:
    ld a, [wPlayerCostume]
	cp 0
	jr z, .Ash
	ld a, [wPlayerCostume]
	cp 1
	jr z, .Misty
    ld a, [wPlayerCostume]
    cp 2
	jr z, .Brock
	cp 3
	jr z, .Gary
	cp 4
	jr z, .Pikachu		
	

.Ash
	ld hl, AshNameMenuHeader
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_header

	ld hl, MistyNameMenuHeader
	jr z, .got_header

.Misty	
		ld hl, MistyNameMenuHeader
        jr .got_header
		ret
    
.Brock	
		ld hl, BrockNameMenuHeader
        jr .got_header
		ret
		
.Gary	
		ld hl, GaryNameMenuHeader
        jr .got_header
		ret

.Pikachu	
		ld hl, PikachuNameMenuHeader
        jr .got_header			
        ret
		
.got_header
	call LoadMenuHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	call CloseWindow
	ret		

INCLUDE "data/player_names.asm"

; GetPlayerNameArray: ; unreferenced
	; ld hl, wPlayerName
	; ld de, MalePlayerNameArray
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr z, .got_array
	; ld de, FemalePlayerNameArray
; .got_array
	; call InitName
	; ret

GetPlayerIcon:
    ld a, [wPlayerCostume]
	cp 0
	jr z, .IconGender
	cp 1
	jr z, .IconGender
	
	cp 2
    jr z, .BrockIcon
	cp 3
    jr z, .GaryIcon
	cp 4
    jr z, .PikachuIcon
	
.IconGender
    ld a, [wPlayerGender]
	cp 0
    jr z, .AshIcon
	cp 1
    jr z, .OldMistyIcon

.AshIcon
	ld de, AshSpriteGFX
	ld b, BANK(AshSpriteGFX)
	jr z, .got_gfx
.OldMistyIcon	
	ld de, OldMistySpriteGFX
	ld b, BANK(OldMistySpriteGFX)
	jr z, .got_gfx
	
.BrockIcon
	ld de, BrockSpriteGFX
	ld b, BANK(BrockSpriteGFX)
	jr z, .got_gfx
	
.GaryIcon
	ld de, GarySpriteGFX
	ld b, BANK(GarySpriteGFX)
	jr z, .got_gfx

.PikachuIcon
	ld de, WalkingPikachuSpriteGFX
	ld b, BANK(WalkingPikachuSpriteGFX)
	jr z, .got_gfx	

; GetPlayerIcon:
	; ld de, ChrisSpriteGFX
	; ld b, BANK(ChrisSpriteGFX)
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr z, .got_gfx
	; ld de, KrisSpriteGFX
	; ld b, BANK(KrisSpriteGFX)
.got_gfx
	ret

; GetCardPic:
	; ld hl, AshCardPic
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr z, .got_pic
	; ld hl, OldMistyCardPic
; .got_pic
	; ld de, vTiles2 tile $00
	; ld bc, $23 tiles
	; ld a, BANK(AshCardPic) ; aka BANK(KrisCardPic)
	; call FarCopyBytes
	; ld hl, TrainerCardGFX
	; ld de, vTiles2 tile $23
	; ld bc, 6 tiles
	; ld a, BANK(TrainerCardGFX)
	; call FarCopyBytes
	; ret

; AshCardPic:
; INCBIN "gfx/trainer_card/ash_card.2bpp"

; OldMistyCardPic:
; INCBIN "gfx/trainer_card/old_misty_card.2bpp"

; TrainerCardGFX:
; INCBIN "gfx/trainer_card/trainer_card.2bpp"

GetPlayerBackpic:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, GetChrisBackpic
	farcall GetMistyBackpic
	ret

GetChrisBackpic:
	ld hl, ChrisBackpic
	ld b, BANK(ChrisBackpic)
	ld de, vTiles2 tile $31
	ld c, 7 * 7
	predef DecompressGet2bpp
	ret

HOF_LoadTrainerFrontpic:
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a

; Get class
	ld e, CHRIS
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_class
	ld e, KRIS
.got_class
	ld a, e
	ld [wTrainerClass], a

; Load pic
	ld de, ChrisPic
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_pic
	ld de, KrisPic
.got_pic
	ld hl, vTiles2
	ld b, BANK(ChrisPic) ; aka BANK(KrisPic)
	ld c, 7 * 7
	call Get2bpp

	call WaitBGMap
	ld a, $1
	ldh [hBGMapMode], a
	ret
;;;

DrawIntroPlayerPic:
    ld a, [wPlayerCostume]
	cp 0
	jr z, .Gender
	cp 1
	jr z, .Gender    
	cp 2
    jr z, .BrockPic
	cp 3
    jr z, .BluePic
	cp 4
    jr z, .PikachuPic



; Draw the player pic at (6,4).
.Gender
; Get class
	ld e, CHRIS
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_class
	ld e, MISTY
.got_class
	ld a, e
	ld [wTrainerClass], a

; Load pic
	ld de, ChrisPic
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_pic
	ld de, KrisPic
    jr .got_pic
	
.BrockPic
	ld e, BUGSY
	ld a, e
	ld [wTrainerClass], a	
	ld de, BrockPic
	jr .got_pic

.BluePic
	ld e, BLUE
	ld a, e
	ld [wTrainerClass], a
	ld de, BluePic
	jr .got_pic	
	
.PikachuPic	
	ld de, PikachuPic
	jr .got_pic
	
.got_pic
	ld hl, vTiles2
	ld b, BANK(ChrisPic) ; aka BANK(KrisPic)
	ld c, 7 * 7 ; dimensions
	call Get2bpp

; DrawIntroPlayerPic:
; ; Draw the player pic at (6,4).

; ; Get class
	; ld e, CHRIS
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr z, .got_class
	; ld e, KRIS
; .got_class
	; ld a, e
	; ld [wTrainerClass], a

; ; Load pic
	; ld de, AshPic
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr z, .got_pic
	; ld de, KrisPic
; .got_pic
	; ld hl, vTiles2
	; ld b, BANK(ChrisPic) ; aka BANK(KrisPic)
	; ld c, 7 * 7 ; dimensions
	; call Get2bpp

; Draw
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

ChrisPic:
INCBIN "gfx/player/player_front/ash.2bpp"

KrisPic:
INCBIN "gfx/player/player_front/old_misty.2bpp"

BrockPic:
INCBIN "gfx/player/player_front/brock.2bpp"

BluePic:
INCBIN "gfx/player/player_front/gary.2bpp"

PikachuPic:
INCBIN "gfx/player/player_front/pikachu.2bpp"

GetMistyBackpic:
; Kris's backpic is uncompressed.
	ld de, MistyBackpic
	ld hl, vTiles2 tile $31
	lb bc, BANK(ChrisBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret



GetBrockBackpic:
; Kris's backpic is uncompressed.
	ld de, BrockBackpic
	ld hl, vTiles2 tile $31
	lb bc, BANK(ChrisBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret


GetGaryBackpic:
; Kris's backpic is uncompressed.
	ld de, GaryBackpic
	ld hl, vTiles2 tile $31
	lb bc, BANK(ChrisBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret
	

GetPikachuBackpic:
; Kris's backpic is uncompressed.
	ld de, PikachuBackpic
	ld hl, vTiles2 tile $31
	lb bc, BANK(ChrisBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret
	
