_CGB_TrainerCardKanto2:
; Define Colors to use sequentially
	ld de, wBGPals1
	xor a ; CHRIS ; $0
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, FALKNER ; KRIS ; BLUE PERSON ; $1
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, WHITNEY ; RED PERSON ; $2
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, LT_SURGE ; GREEN PERSON; $3
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, KOGA ; GARY PURPLE PERSON $4
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, SABRINA ; YELLOW $5
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, BLAINE ; $6
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, a
	call GetTrainerPalettePointer
	
	ld hl, .KantoBadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	
	; call LoadPalette_White_Col1_Col2_Black
	; ld a, PREDEFPAL_CGB_BADGE
	; call GetPredefPal
	; call LoadHLPaletteIntoDE
	
	
	ld a, [wPlayerCostume]
	cp 0
	jr z, .CardRed
	cp 1
	jr z, .CardBlue
	cp 2
	jr z, .CardGreen
	cp 3
	jr z, .CardBlue
	cp 4
	jr z, .CardYellow
 
 ;.CardZero  
  ;  xor a
;	ld [wCardBorder], a
;	jr .fill
.CardBlue
	ld a, 1
	ld [wCardBorder], a
    jr .fill
.CardGreen
	ld a, 3
	ld [wCardBorder], a
	jr .fill
.CardRed
	ld a, 2
	ld [wCardBorder], a
	jr .fill
.CardYellow
	ld a, 4
	ld [wCardBorder], a	
	
	
.fill	
	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	; ld a, [wPlayerCostume]
	; and a
	;ld a, [wCardBorder]
	;jr z, .got_gender
	
	
.got_gender


	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	ld a, [wPlayerCostume]
	cp 0
	jr z, .GenderCheck
	cp 1
	jr z, .GenderCheck

; Trainer Image Palette	
.CostumeCheck
    ld a, [wPlayerCostume]	
	cp 2 ; Brock Costume
	ld a, $3 ; Green
	jr z, .got_gender2
	
	ld a, [wPlayerCostume]
	cp 3 ; Gary Costume
	ld a, $1 ; Blue
	jr z, .got_gender2
	
    ld a, [wPlayerCostume]
	cp 4 ; Pikachu Costume
	ld a, $2 ; Red
	jr z, .got_gender2
	
.GenderCheck
	ld a, [wPlayerGender]
	cp 0
	ld a, $0 ; ASH
	jr z, .got_gender2
	ld a, [wPlayerGender]	
	cp 1
	ld a, $2 ; MISTY
	jr z, .got_gender2
	
.got_gender2

.FirstBadge ; Brock
	call FillBoxCGB
	hlcoord 3, 10, wAttrmap
	lb bc, 3, 3
	ld a, $0
	
.SecondBadge ; Misty
	call FillBoxCGB
	hlcoord 7, 10, wAttrmap
	lb bc, 3, 3
	ld a, $2 ;  red person
	
.ThirdBadge	; LT SURGE
	call FillBoxCGB
	hlcoord 11, 10, wAttrmap
	lb bc, 3, 3
	ld a, $3 ; green person
	
.FourthBadge ; ERIKA
	call FillBoxCGB
	hlcoord 15, 10, wAttrmap
	lb bc, 3, 3
	ld a, $3 ; green person
	
.FifthBadge ; KOGA	
	call FillBoxCGB
	hlcoord 3, 13, wAttrmap
	lb bc, 3, 3
	ld a, $4 ; chuck
	
.SixthBadge	; SABRINA
	call FillBoxCGB
	hlcoord 7, 13, wAttrmap
	lb bc, 3, 3
	ld a, $5 ; jasmine
	
.SeventhBadge ; BLAINE
	call FillBoxCGB
	hlcoord 11, 13, wAttrmap
	lb bc, 3, 3
	ld a, $6 ; prycE
	
.EighthBadge ; GIOVANNI
	call FillBoxCGB
	hlcoord 15, 13, wAttrmap
	lb bc, 3, 3
	ld a, $2 ;clair
	call FillBoxCGB
	
	; top-right corner still uses the border's palette
;	ld a, [wPlayerCostume]
;	and a
;	ld a, [wCardBorder] ;Set Corner to Border
;    inc a
;    dec a
;	jr z, .got_gender3

.SetColorOfCorner
	ld a, $2 ; Whitney Red for Misty
	hlcoord 18, 1, wAttrmap
	ld [hl], a
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.KantoBadgePalettes:
INCLUDE "gfx/trainer_card/kanto_badges.pal"
	
_CGB_TrainerCardJohto2:
	ld de, wBGPals1
	xor a ; CHRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BUGSY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, WHITNEY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, MORTY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, CHUCK
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, JASMINE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, PRYCE
	ld hl, .JohtoBadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ret
	
.JohtoBadgePalettes:
INCLUDE "gfx/trainer_card/johto_badges.pal"

