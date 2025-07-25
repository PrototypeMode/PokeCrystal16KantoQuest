INCLUDE "engine/gfx/sgb_layouts.asm"

DEF SHINY_ATK_MASK EQU %0010
DEF SHINY_DEF_DV EQU 10
DEF SHINY_SPD_DV EQU 10
DEF SHINY_SPC_DV EQU 10


CheckShininess:
; Check if a mon is shiny by DVs at bc.
; Return carry if shiny.

	ld l, c
	ld h, b
		
.shiny
; Attack
	ld a, [hl]
	and SHINY_ATK_MASK << 4
	jr z, .not_shiny

; Defense
	ld a, [hli]
	and %1111
	cp SHINY_DEF_DV
	jr nz, .not_shiny

; Speed
	ld a, [hl]
	and %1111 << 4
	cp SHINY_SPD_DV << 4
	jr nz, .not_shiny

; Special
	ld a, [hl]
	and %1111
	cp SHINY_SPC_DV
	jr nz, .not_shiny

; shiny
	scf
	ret

.not_shiny
	and a
	ret

Unused_CheckShininess:
; Return carry if the DVs at hl are all 10 or higher.

; Attack
	ld a, [hl]
	cp 10 << 4
	jr c, .not_shiny

; Defense
	ld a, [hli]
	and %1111
	cp 10
	jr c, .not_shiny

; Speed
	ld a, [hl]
	cp 10 << 4
	jr c, .not_shiny

; Special
	ld a, [hl]
	and %1111
	cp 10
	jr c, .not_shiny

; shiny
	scf
	ret

.not_shiny
	and a
	ret

SGB_ApplyCreditsPals: ; unreferenced
	push de
	push bc
	ld hl, PalPacket_Pal01
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop bc
	pop de
	ld a, c
	ld [wSGBPals + 3], a
	ld a, b
	ld [wSGBPals + 4], a
	ld a, e
	ld [wSGBPals + 5], a
	ld a, d
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	call PushSGBPals
	ld hl, BlkPacket_AllPal0
	call PushSGBPals
	ret

InitPartyMenuPalettes:
	ld hl, PalPacket_PartyMenu + 1
	call CopyFourPalettes
	call InitPartyMenuOBPals
	call WipeAttrmap
	ret

; SGB layout for SCGB_PARTY_MENU_HP_BARS
SGB_ApplyPartyMenuHPPals:
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, $5
	jr z, .okay
	dec a
	ld e, $a
	jr z, .okay
	ld e, $f
.okay
	push de
	ld hl, wSGBPals + 10
	ld bc, $6
	ld a, [wSGBPals]
	call AddNTimes
	pop de
	ld [hl], e
	ret

Intro_LoadMagikarpPalettes: ; unreferenced
	call CheckCGB
	ret z

; CGB only
	ld hl, .MagikarpBGPal
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld hl, .MagikarpOBPal
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.MagikarpBGPal:
INCLUDE "gfx/intro/gs_magikarp_bg.pal"

.MagikarpOBPal:
INCLUDE "gfx/intro/gs_magikarp_ob.pal"

Intro_LoadAllPal0: ; unreferenced
	call CheckCGB
	ret nz
	ldh a, [hSGB]
	and a
	ret z
	ld hl, BlkPacket_AllPal0
	jp PushSGBPals

Intro_LoadBetaIntroVenusaurPalettes: ; unreferenced
	call CheckCGB
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	ret z
	ld hl, PalPacket_BetaIntroVenusaur
	jp PushSGBPals

.cgb
	ld de, wOBPals1
	ld a, PREDEFPAL_BETA_INTRO_VENUSAUR
	call GetPredefPal
	jp LoadHLPaletteIntoDE

Intro_LoadPackPalettes: ; unreferenced
	call CheckCGB
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	ret z
	ld hl, PalPacket_Pack
	jp PushSGBPals

.cgb
	ld de, wOBPals1
	ld a, PREDEFPAL_PACK
	call GetPredefPal
	jp LoadHLPaletteIntoDE

GSIntro_LoadMonPalette: ; unreferenced
	call CheckCGB
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	ret z
	ld a, c
	push af
	ld hl, PalPacket_Pal01
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop af
	call GetMonPalettePointer
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	jp PushSGBPals

.cgb
	ld de, wOBPals1
	ld a, c
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ret

LoadTrainerClassPaletteAsNthBGPal:
	ld a, [wTrainerClass]
	call GetTrainerPalettePointer
	ld a, e
	jr LoadNthMiddleBGPal

LoadMonPaletteAsNthBGPal:
	ld a, [wCurPartySpecies]
	call _GetMonPalettePointer
	ld a, e
	bit 7, a
	jr z, LoadNthMiddleBGPal
	and $7f
	inc hl
	inc hl
	inc hl
	inc hl

LoadNthMiddleBGPal:
	push hl
	ld hl, wBGPals1
	ld de, 1 palettes
.loop
	and a
	jr z, .got_addr
	add hl, de
	dec a
	jr .loop

.got_addr
	ld e, l
	ld d, h
	pop hl
	call LoadPalette_White_Col1_Col2_Black
	ret

LoadBetaPokerPalettes: ; unreferenced
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ld hl, wBetaPokerSGBPals
	jp PushSGBPals

.cgb
	ld a, [wBetaPokerSGBCol]
	ld c, a
	ld a, [wBetaPokerSGBRow]
	hlcoord 0, 0, wAttrmap
	ld de, SCREEN_WIDTH
.loop
	and a
	jr z, .done
	add hl, de
	dec a
	jr .loop

.done
	ld b, 0
	add hl, bc
	lb bc, 6, 4
	ld a, [wBetaPokerSGBAttr]
	and $3
	call FillBoxCGB
	call CopyTilemapAtOnce
	ret

ApplyMonOrTrainerPals:
	call CheckCGB
	ret z
	ld a, e
	and a
	jr z, .get_trainer
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	jr .load_palettes

.get_trainer
	ld a, [wTrainerClass]
	call GetTrainerPalettePointer

.load_palettes
	ld de, wBGPals1
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ret

ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .Enemy
	cp $1
	jr z, .Player
	cp $2
	jr z, .PartyMenu
	ret

.Enemy:
	ld de, wBGPals2 palette PAL_BATTLE_BG_ENEMY_HP color 1
	jr .okay

.Player:
	ld de, wBGPals2 palette PAL_BATTLE_BG_PLAYER_HP color 1

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	ld bc, 4
	ld a, BANK(wBGPals2)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.PartyMenu:
	ld e, c
	inc e
	hlcoord 11, 1, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 8
	ld a, e
	call FillBoxCGB
	ret

LoadStatsScreenPals:
	call CheckCGB
	ret z
	ld hl, StatsScreenPals
	ld b, 0
	
	add hl, bc
	add hl, bc
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, [hli]
	ld [wBGPals1 palette 0], a
	ld [wBGPals1 palette 2], a
	ld a, [hl]
	ld [wBGPals1 palette 0 + 1], a
	ld [wBGPals1 palette 2 + 1], a
	pop af
	ldh [rSVBK], a
	call ApplyPals
	ld a, $1
	ret

LoadMailPalettes:
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .MailPals
	add hl, de
	call CheckCGB
	jr nz, .cgb
	push hl
	ld hl, PalPacket_Pal01
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hli]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	call PushSGBPals
	ld hl, BlkPacket_AllPal0
	call PushSGBPals
	ret

.cgb
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	call ApplyAttrmap
	ret

.MailPals:
INCLUDE "gfx/mail/mail.pal"

INCLUDE "engine/gfx/cgb_layouts.asm"


CopyFourPalettes:
	ld de, wBGPals1
	ld c, 4

CopyPalettes:
.loop
	push bc
	ld a, [hli]
	push hl
	call GetPredefPal
	call LoadHLPaletteIntoDE
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

GetPredefPal:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PredefPals
	add hl, bc
	ret

LoadHLPaletteIntoDE:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld c, 1 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	
	
; A double-check to see whether Stat Pages 1, 2 or 3 are active, to make sure that palettes stay consistent when switching between pages and Pokemon, 
; set them to day palette to avoid graphical error. Assuming you added a fourth stats page, we skip the 0 check here due to the value's default state
 ;being 0, which causes inconsistent battle palette loading when on particular tiles due to memory overlap, but that's handled by the Stats Screen 
 ;initialization in the prior steps.

.StatsFlags
        ld a, [wStatsScreenFlags]
	cp 1
	  jr z, .day
	cp 2
	  jr z, .day
	cp 3
         jr z, .day

 ; Check whether the weather is Sunny (re: Sunny Day), set to day palette.	

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .day

	ld a, [wBattleTimeOfDay]
       and a
	jr z, .day
	
	ld a, [wBattleTimeOfDay]
       cp 1
	jr z, .night
	
	ld a, [wBattleTimeOfDay]
       cp 2
	jr z, .cave
	
	ld a, [wBattleTimeOfDay]
       cp 3
	jr z, .forest


 ;  Below are the sections which call the correct colors, formatted into easily marked commented blocks, for easy recognition amongst the extended code, 
 ;  which can be easily copy+pasted for your own custom palettes.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	NIGHT START
.night
;call background colors
   ld a, LOW(PALRGB_NIGHT)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_NIGHT)
	ld [de], a
	inc de
	

;call sprite colors
     call NightColors
	ld c, 2 * PAL_COLOR_SIZE

	jr .black
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NIGHT END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CAVE START
.cave
;call background colors
   ld a, LOW(PALRGB_CAVE)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_CAVE)
	ld [de], a
	inc de
	

;call sprite colors
       call CaveColors
	ld c, 2 * PAL_COLOR_SIZE

	jr .black
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CAVE END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FOREST START
.forest
;call background colors
   ld a, LOW(PALRGB_FOREST)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_FOREST)
	ld [de], a
	inc de
	

;call sprite colors
       call ForestColors
	ld c, 2 * PAL_COLOR_SIZE

	jr .black
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FOREST END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DAY START
.day
;call background colors
	ld a, LOW(PALRGB_WHITE)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_WHITE)
	ld [de], a
	inc de
;call sprite colors    
	ld c, 2 * PAL_COLOR_SIZE
 
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop

.black
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ldh [rSVBK], a
	ret
	

	; ld a, LOW(PALRGB_WHITE)
	; ld [de], a
	; inc de
	; ld a, HIGH(PALRGB_WHITE)
	; ld [de], a
	; inc de

	; ld c, 2 * PAL_COLOR_SIZE
; .loop
	; ld a, [hli]
	; ld [de], a
	; inc de
	; dec c
	; jr nz, .loop

	; xor a
	; ld [de], a
	; inc de
	; ld [de], a
	; inc de

	; pop af
	; ldh [rSVBK], a
	; ret

FillBoxCGB:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

ResetBGPals:
	push af
	push bc
	push de
	push hl

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, wBGPals1
	ld c, 1 palettes
.loop
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop

	pop af
	ldh [rSVBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret

WipeAttrmap:
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ret

ApplyPals:
	ld hl, wBGPals1
	ld de, wBGPals2
	ld bc, 16 palettes
	ld a, BANK(wGBCPalettes)
	call FarCopyWRAM
	ret

ApplyAttrmap:
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .UpdateVBank1
	ldh a, [hBGMapMode]
	push af
	ld a, $2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	ret

.UpdateVBank1:
	hlcoord 0, 0, wAttrmap
	debgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld a, $1
	ldh [rVBK], a
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add e
	jr nc, .okay
	inc d
.okay
	ld e, a
	dec b
	jr nz, .row
	ld a, $0
	ldh [rVBK], a
	ret

; CGB layout for SCGB_PARTY_MENU_HP_BARS
CGB_ApplyPartyMenuHPPals:
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wSGBPals]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 8
	ld a, e
	call FillBoxCGB
	ret

InitPartyMenuOBPals:
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ret

GetBattlemonBackpicPalettePointer:
	push de
	farcall GetPartyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempBattleMonSpecies]
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
   ld a, [wBattleType]
   cp BATTLETYPE_GHOST
   jr z, .GhostFrontpicPalette
   
   cp BATTLETYPE_SCOPE
   jr z, .GhostFrontpicPalette
   jr nz, .NormalFrontpicPalette
	

	
	
.GhostFrontpicPalette
	push de
	ld hl, GhostPalette
	pop de

	ret
	
.NormalFrontpicPalette
	push de
	farcall GetEnemyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempEnemyMonSpecies]
	call GetFrontpicPalettePointer
	pop de
	ret
	

GetPlayerUseBallPalettePointer:
.Dude	
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .dude
	 

.Costumes
    ld a, [wPlayerCostume]
    cp 2
	jr z, .BrockPal
	cp 3
	jr z, .GaryPal
	cp 4
	jr z, .PikachuPal


.Gender	
   ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	jr nz, .female


.BrockPal
	ld hl, BrockPalette
    ret
.GaryPal
	ld hl, GaryPalette
    ret
.PikachuPal	
	ld hl, PikachuPalette
    ret


.female	
	ld hl, OldMistyPalette
    ret
	
.male
	ld hl, PlayerPalette
	ret

.dude
    ld a, [wMapGroup]
	 ld b, a	
	 ld a, [wMapNumber]
	 ld c, a
     call GetWorldMapLocation
     cp LANDMARK_PALLET_TOWN
	 jr z, .OakPalette
      cp LANDMARK_VIRIDIAN_CITY
	 jr z, .OldDudePalette
     ret


.OakPalette 
	ld hl, OakPalette
	ret	
	

.OldDudePalette 
	ld hl, OldDudePalette
	ret		
	

GetPlayerOrMonPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	
.CatchTutorial	
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .TutorialCharacter
	
	
    ld a, [wPlayerCostume]
    cp 2
	jr z, .BrockPal
	cp 3
	jr z, .GaryPal
	cp 4
	jr z, .PikachuPal
	
.Gender	
   ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .AshPal
	jr nz, .OldMistyPal
    ret
	
.TutorialCharacter
    ld a, [wMapGroup]
	 ld b, a	
	 ld a, [wMapNumber]
	 ld c, a
     call GetWorldMapLocation
     cp LANDMARK_PALLET_TOWN
	 jr z, .OakPal
     cp LANDMARK_VIRIDIAN_CITY
	 jr z, .OldDudePal



.BrockPal
	ld hl, BrockPalette
    ret
.GaryPal
	ld hl, GaryPalette
    ret
.PikachuPal	
	ld hl, PikachuPalette
    ret

.OldMistyPal	
	ld hl, OldMistyPalette
    ret
	
.AshPal
	ld hl, PlayerPalette
	ret

.OakPal
	ld hl, OakPalette
	ret	

.OldDudePal
	ld hl, OldDudePalette
	ret	


GetFrontpicPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	ld a, [wTrainerClass]

GetTrainerPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret
	
GetKantoBadgePalettes:	
	ld hl, .KantoBadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
    ret
	
.KantoBadgePalettes:
INCLUDE "gfx/trainer_card/kanto_badges.pal"

GetJohtoBadgePalettes:	
	ld hl, .JohtoBadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
    ret

.JohtoBadgePalettes:
INCLUDE "gfx/trainer_card/johto_badges.pal"

GetMonPalettePointer:
	call _GetMonPalettePointer
	ret

CGBCopyBattleObjectPals: ; unreferenced
; dummied out
	ret
	call CheckCGB
	ret z
	ld hl, BattleObjectPals
	ld a, (1 << rOBPI_AUTO_INCREMENT) | $10
	ldh [rOBPI], a
	ld c, 6 palettes
.loop
	ld a, [hli]
	ldh [rOBPD], a
	dec c
	jr nz, .loop
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ret

BattleObjectPals:
INCLUDE "gfx/battle_anims/battle_anims.pal"

CGBCopyTwoPredefObjectPals: ; unreferenced
	call CheckCGB
	ret z
	ld a, (1 << rOBPI_AUTO_INCREMENT) | $10
	ldh [rOBPI], a
	ld a, PREDEFPAL_TRADE_TUBE
	call GetPredefPal
	call .PushPalette
	ld a, PREDEFPAL_RB_GREENMON
	call GetPredefPal
	call .PushPalette
	ret

.PushPalette:
	ld c, 1 palettes
.loop
	ld a, [hli]
	ldh [rOBPD], a
	dec c
	jr nz, .loop
	ret

_GetMonPalettePointer:
	call GetPokemonIndexFromID
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

GetMonNormalOrShinyPalettePointer:
    ; ld a, [wBattleType]
	; cp BATTLETYPE_SCOPE
	; jr nz, .Normal
	
	
; .GhostPalette
	; push bc
	; call _GetMonPalettePointer
	; pop bc
	
	; push hl
	; ld hl, KrisPalette
    ; ret
	
; .Normal	
	push bc
	call _GetMonPalettePointer
	pop bc
	
	push hl

	call CheckShininess
	pop hl
	ret nc
rept 4
	inc hl
endr	
	ret


PushSGBPals:
	ld a, [wJoypadDisable]
	push af
	set JOYPAD_DISABLE_SGB_TRANSFER_F, a
	ld [wJoypadDisable], a
	call _PushSGBPals
	pop af
	ld [wJoypadDisable], a
	ret

_PushSGBPals:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.loop
	push bc
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld b, $10
.loop2
	ld e, $8
	ld a, [hli]
	ld d, a
.loop3
	bit 0, d
	ld a, $10
	jr nz, .okay
	ld a, $20
.okay
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .loop3
	dec b
	jr nz, .loop2
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	call SGBDelayCycles
	pop bc
	dec b
	jr nz, .loop
	ret

InitSGBBorder:
	call CheckCGB
	ret nz

; SGB/DMG only
	di
	ld a, [wJoypadDisable]
	push af
	set JOYPAD_DISABLE_SGB_TRANSFER_F, a
	ld [wJoypadDisable], a

	xor a
	ldh [rJOYP], a
	ldh [hSGB], a
	call PushSGBBorderPalsAndWait
	jr nc, .skip
	ld a, $1
	ldh [hSGB], a
	call _InitSGBBorderPals
	call SGBBorder_PushBGPals
	call SGBDelayCycles
	call SGB_ClearVRAM
	call PushSGBBorder
	call SGBDelayCycles
	call SGB_ClearVRAM
	ld hl, MaskEnCancelPacket
	call _PushSGBPals

.skip
	pop af
	ld [wJoypadDisable], a
	ei
	ret

InitCGBPals::
	call CheckCGB
	ret z

; CGB only
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	ld hl, vTiles3
	ld bc, $200 tiles
	xor a
	call ByteFill
	ld a, BANK(vTiles0)
	ldh [rVBK], a
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld c, 4 * TILE_WIDTH
.bgpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rBGPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rBGPD], a
	dec c
	jr nz, .bgpals_loop
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld c, 4 * TILE_WIDTH
.obpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rOBPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rOBPD], a
	dec c
	jr nz, .obpals_loop
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, wBGPals1
	call .LoadWhitePals
	ld hl, wBGPals2
	call .LoadWhitePals
	pop af
	ldh [rSVBK], a
	ret

.LoadWhitePals:
	ld c, 4 * 16
.loop
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	dec c
	jr nz, .loop
	ret

_InitSGBBorderPals:
	ld hl, .PacketPointerTable
	ld c, 9
.loop
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call _PushSGBPals
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

.PacketPointerTable:
	dw MaskEnFreezePacket
	dw DataSndPacket1
	dw DataSndPacket2
	dw DataSndPacket3
	dw DataSndPacket4
	dw DataSndPacket5
	dw DataSndPacket6
	dw DataSndPacket7
	dw DataSndPacket8

UpdateSGBBorder: ; unreferenced
	di
	xor a
	ldh [rJOYP], a
	ld hl, MaskEnFreezePacket
	call _PushSGBPals
	call PushSGBBorder
	call SGBDelayCycles
	call SGB_ClearVRAM
	ld hl, MaskEnCancelPacket
	call _PushSGBPals
	ei
	ret

PushSGBBorder:
	call .LoadSGBBorderPointers
	push de
	call SGBBorder_YetMorePalPushing
	pop hl
	call SGBBorder_MorePalPushing
	ret

.LoadSGBBorderPointers:
	ld hl, SGBBorderGFX
	ld de, SGBBorderMapAndPalettes
	ret

SGB_ClearVRAM:
	ld hl, STARTOF(VRAM)
	ld bc, SIZEOF(VRAM)
	xor a
	call ByteFill
	ret

PushSGBBorderPalsAndWait:
	ld hl, MltReq2Packet
	call _PushSGBPals
	call SGBDelayCycles
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ldh [rJOYP], a
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $10
	ldh [rJOYP], a
rept 6
	ldh a, [rJOYP]
endr
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	call .FinalPush
	and a
	ret

.carry
	call .FinalPush
	scf
	ret

.FinalPush:
	ld hl, MltReq1Packet
	call _PushSGBPals
	vc_hook Unknown_network_reset ; Unknown why this hook is here, doesn't seem to be needed
	jp SGBDelayCycles

SGBBorder_PushBGPals:
	call DisableLCD
	ld a, %11100100
	ldh [rBGP], a
	ld hl, PredefPals
	ld de, vTiles1
	ld bc, $100 tiles
	call CopyData
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, PalTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

SGBBorder_MorePalPushing:
	call DisableLCD
	ld a, $e4
	ldh [rBGP], a
	ld de, vTiles1
	ld bc, (6 + SCREEN_WIDTH + 6) * 5 * 2
	call CopyData
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld bc, 6 * 2
	call CopyData
	ld bc, SCREEN_WIDTH * 2
	call ClearBytes
	ld bc, 6 * 2
	call CopyData
	pop bc
	dec b
	jr nz, .loop
	ld bc, (6 + SCREEN_WIDTH + 6) * 5 * 2
	call CopyData
	ld bc, $100
	call ClearBytes
	ld bc, 16 palettes
	call CopyData
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, PctTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

SGBBorder_YetMorePalPushing:
	call DisableLCD
	ld a, %11100100
	ldh [rBGP], a
	ld de, vTiles1
	ld b, $80
.loop
	push bc
	ld bc, 1 tiles
	call CopyData
	ld bc, 1 tiles
	call ClearBytes
	pop bc
	dec b
	jr nz, .loop
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, ChrTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

CopyData:
; copy bc bytes of data from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

ClearBytes:
; clear bc bytes of data starting from de
.loop
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

DrawDefaultTiles:
; Draw 240 tiles (2/3 of the screen) from tiles in VRAM
	hlbgcoord 0, 0 ; BG Map 0
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	ld a, $80 ; starting tile
	ld c, 12 + 1
.line
	ld b, 20
.tile
	ld [hli], a
	inc a
	dec b
	jr nz, .tile
; next line
	add hl, de
	dec c
	jr nz, .line
	ret

SGBDelayCycles:
	ld de, 7000
.wait
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .wait
	ret

INCLUDE "gfx/sgb/blk_packets.asm"
INCLUDE "gfx/sgb/pal_packets.asm"
INCLUDE "data/sgb_ctrl_packets.asm"

PredefPals:
	table_width PALETTE_SIZE
INCLUDE "gfx/sgb/predef.pal"
	assert_table_length NUM_PREDEF_PALS

SGBBorderMapAndPalettes:
; interleaved tile ids and palette ids, without the center 20x18 screen area
INCBIN "gfx/sgb/sgb_border.sgb.tilemap"
; four SGB palettes of 16 colors each; only the first 4 colors are used
INCLUDE "gfx/sgb/sgb_border.pal"

SGBBorderGFX:
INCBIN "gfx/sgb/sgb_border.2bpp"

HPBarPals:
INCLUDE "gfx/battle/hp_bar.pal"

ExpBarPalette:
INCLUDE "gfx/battle/exp_bar.pal"

INCLUDE "data/pokemon/palettes.asm"

INCLUDE "data/trainers/palettes.asm"

LoadMapPals:
	farcall LoadSpecialMapPalette
	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wEnvironment]
	maskbits NUM_ENVIRONMENTS + 1
	ld e, a
	ld d, 0
	ld hl, EnvironmentColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, wBGPals1
	ld b, 8
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ldh [rSVBK], a

.got_pals
; This jumps to MuseumPal/MapObject2Pals when Pewter City (for Amber)
	ld a, [wMapGroup]
	ld b, a	
	ld a, [wMapNumber]
	ld c, a
    call GetWorldMapLocation
    cp LANDMARK_PEWTER_CITY
    jp z, MuseumPal
	
;If not Pewter, fallthrough to regular palette set
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

OriginalPal:
	ld a, [wEnvironment]
	cp TOWN
	jr z, .outside
	cp ROUTE
	ret nz
.outside
	ld a, [wMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPals
	add hl, de
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp NITE_F
	jr c, .morn_day
rept 4
	inc hl
endr
.morn_day
	ld de, wBGPals1 palette PAL_BG_ROOF color 1
	ld bc, 4
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret
	
MuseumPal:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	ld hl, MapObject2Pals
	call AddNTimes
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
    jp OriginalPal	
    ret	

INCLUDE "data/maps/environment_colors.asm"

PartyMenuBGMobilePalette:
INCLUDE "gfx/stats/party_menu_bg_mobile.pal"

PartyMenuBGPalette:
INCLUDE "gfx/stats/party_menu_bg.pal"

TilesetBGPalette:
INCLUDE "gfx/tilesets/bg_tiles.pal"

MapObjectPals::
INCLUDE "gfx/overworld/npc_sprites.pal"

MapObject2Pals::
INCLUDE "gfx/overworld/npc_sprites2.pal"

RoofPals:
	table_width PAL_COLOR_SIZE * 2 * 2
INCLUDE "gfx/tilesets/roofs.pal"
	assert_table_length NUM_MAP_GROUPS + 1

DiplomaPalettes:
INCLUDE "gfx/diploma/diploma.pal"

PartyMenuOBPals:
INCLUDE "gfx/stats/party_menu_ob.pal"

UnusedBattleObjectPals: ; unreferenced
INCLUDE "gfx/battle_anims/unused_battle_anims.pal"

UnusedGSTitleBGPals:
INCLUDE "gfx/title/unused_gs_bg.pal"

UnusedGSTitleOBPals:
INCLUDE "gfx/title/unused_gs_fg.pal"

MalePokegearPals:
INCLUDE "gfx/pokegear/pokegear.pal"

FemalePokegearPals:
INCLUDE "gfx/pokegear/pokegear_f.pal"

BetaPokerPals:
INCLUDE "gfx/beta_poker/beta_poker.pal"

SlotMachinePals:
INCLUDE "gfx/slots/slots.pal"

CaveColors:
ForestColors:
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
