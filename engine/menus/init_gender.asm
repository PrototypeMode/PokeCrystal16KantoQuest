InitCrystalData:
	ld a, $1
	ld [wd474], a
	xor a
	ld [wd473], a
	ld [wPlayerGender], a
	ld [wd475], a
	ld [wd476], a
	ld [wd477], a
	ld [wd478], a
	ld [wd002], a
	ld [wd003], a
	ld a, [wd479]
	res 0, a ; ???
	ld [wd479], a
	ld a, [wd479]
	res 1, a ; ???
	ld [wd479], a
	ret

INCLUDE "mobile/mobile_12.asm"

InitGender:
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	;ld hl, AreYouABoyOrAreYouAGirlText
	ld hl, ChooseCharacterText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	; ld a, [wMenuCursorY]
	; dec a
	; ld [wPlayerGender], a
	; ld c, 10
	; call DelayFrames
	; ret
	
.ChooseCharacter	
	ld a, [wMenuCursorY]
	cp 1
	jr z, .Ash
	cp 2
	jr z, .Misty
	cp 3
	jr z, .Brock
	cp 4
	jr z, .Gary
	cp 5
	jr z, .Pikachu
	
.Ash
	xor a
	ld [wPlayerGender], a
	ld [wPlayerCostume], a
	jr .Next
	
.Misty
    ld a, 1
	ld [wPlayerGender], a
	ld [wPlayerCostume], a	
	jr .Next
	
.Brock
    ld a, 0
	ld [wPlayerGender], a
	ld a, 2
	ld [wPlayerCostume], a	
	jr .Next	
	
.Gary
    ld a, 0
	ld [wPlayerGender], a
	ld a, 3
	ld [wPlayerCostume], a	
	jr .Next
	
.Pikachu
    xor a
	ld [wPlayerGender], a
	ld a, 4
	ld [wPlayerCostume], a	
	jr .Next
	
.Next	
	ld c, 10
	call DelayFrames
	ret
	

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 12, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 4 ; items
	db "Ash@"
	db "Misty@"
	db "Brock@"
	db "Gary@"
;	db "Pikachu@"

; AreYouABoyOrAreYouAGirlText:
	; text_far _AreYouABoyOrAreYouAGirlText
	; text_end
	
ChooseCharacterText:
	text_far _ChooseCharacterText
	text_end	

InitGenderScreen:
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call InitCrystalData
	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

LoadGenderScreenPal:
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

.Palette:
INCLUDE "gfx/new_game/gender_screen.pal"

LoadGenderScreenLightBlueTile:
	ld de, .LightBlueTile
	ld hl, vTiles2 tile $00
	lb bc, BANK(.LightBlueTile), 1
	call Get2bpp
	ret

.LightBlueTile:
INCBIN "gfx/new_game/gender_screen.2bpp"
