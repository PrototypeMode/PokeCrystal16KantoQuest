_CGB_TrainerCardE4_Johto_2:
	ld de, wBGPals1
	xor a ; ASH RED/BLUE ; 0
;    ld a, EXECUTIVEM
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, FALKNER ; KRIS ; 1
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, WHITNEY ; 2
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, LT_SURGE ; 3
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	;ld a, KOGA ; 4
	ld a, EXECUTIVEM
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	; ld hl, DUNSPARCE  ; 5
	; call GetPokemonIDFromIndex
	; ld [wCurPartySpecies], a
	; ld a, [wCurPartySpecies]
	; call GetMonPalettePointer
	; call LoadPalette_White_Col1_Col2_Black
	ld a, MORTY ; 5
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	ld a, JASMINE ; 6
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
	; ld a, CHAMPION ; 7
	; call GetTrainerPalettePointer
	; call LoadPalette_White_Col1_Col2_Black
	
		ld hl, ZAPDOS  ; 5
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	
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
 
.CardRed
	ld a, 2
	ld [wCardBorder], a
    jr .fill
.CardBlue
	ld a, 1
	ld [wCardBorder], a
	jr .fill
.CardGreen
	ld a, 3
	ld [wCardBorder], a
	jr .fill
.CardYellow
	ld a, 5
	ld [wCardBorder], a	
	
	
.fill	
	; Fill Screen with wCardBorder
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	; fill trainer sprite area with same-their respective palettes
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
	ld a, $0 ; Ash Costume
	jr z, .got_gender2
	ld a, [wPlayerGender]	
	cp 1
	ld a, $2 ; Misty Costume
	jr z, .got_gender2
	
.got_gender2
   call FillBoxCGB


.WillHair ; 
	hlcoord 3, 10, wAttrmap
	lb bc, 2, 3
	ld a, $4 ; Purple Color
    call FillBoxCGB
	
.WillBody 
	hlcoord 3, 13, wAttrmap
	lb bc, 3, 3
	ld a, $2 ; Red Color 	
	call FillBoxCGB
	
.WillStar 
	hlcoord 2, 13, wAttrmap
	lb bc, 1, 1
	ld a, $7 	
	call FillBoxCGB	
	
.KogaHair 
	hlcoord 7, 10, wAttrmap
	lb bc, 3, 3
	ld a, $4
	call FillBoxCGB
	
.KogaBody
	hlcoord 7, 13, wAttrmap
	lb bc, 3, 3
	ld a, $4 	
	call FillBoxCGB
	
.KogaStar
	hlcoord 6, 13, wAttrmap
	lb bc, 1, 1
	ld a, $7	
	call FillBoxCGB
	
.BrunoHair	
	hlcoord 11, 10, wAttrmap
	lb bc, 3, 3
	ld a, $6 ; Red Person
    call FillBoxCGB
	
.BrunoBody 
	hlcoord 11, 13, wAttrmap
	lb bc, 3, 3
	ld a, $6 
    call FillBoxCGB
	
.BrunoStar 
	hlcoord 10, 13, wAttrmap
	lb bc, 1, 1
	ld a, $7 	
	call FillBoxCGB
	
.KarenHair 
	hlcoord 15, 10, wAttrmap
	lb bc, 3, 3
	ld a, $5
	call FillBoxCGB
	
.KarenBody 
	hlcoord 15, 12, wAttrmap
	lb bc, 2, 3
	ld a, $5
	call FillBoxCGB
	
.KarenBody2
	hlcoord 16, 14, wAttrmap
	lb bc, 2, 1
	ld a, $7
	call FillBoxCGB	
	
.KarenStar	
	hlcoord 14, 13, wAttrmap
	lb bc, 1, 1
	ld a, $7 	
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
	call GetJohtoBadgePalettes
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret
	


