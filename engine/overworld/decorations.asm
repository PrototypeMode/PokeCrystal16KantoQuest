InitDecorations1:

	ld a, DECO_PIKACHU_BED
	ld [wDecoBed], a
	; ld a, [wDecoPoster]
	; ld [wDecoPoster], a
	; ld a, DECO_PIKACHU_DOLL
	; ld [wDecoLeftOrnament], a
	; ld a, [wDecoRightOrnament]
	; ld [wDecoRightOrnament], a
	; ld a, [wDecoBigDoll]
	; ld [wDecoBigDoll], a
    ret

; InitDecorations2:

	; ld a, DECO_GREEN_BED
	; ld [wDecoBed], a
	; ld a, [wDecoPoster]
	; ld [wDecoPoster], a
	; ld a, DECO_SQUIRTLE_DOLL
	; ld [wDecoLeftOrnament], a
	; ld a, [wDecoRightOrnament]
	; ld [wDecoRightOrnament], a
	; ld a, [wDecoBigDoll]
	; ld [wDecoBigDoll], a
    ; ret
	
    ; ld a, [wPlayerCostume]
	; cp 0
    ; jr z, .Ash
	; cp 1
    ; jr z, .Gary
	; jr nz, .Gary
	
; .Ash
	; ld a, DECO_PIKACHU_BED
	; ld [wDecoBed], a
	; ld a, DECO_PIKACHU_POSTER
	; ld [wDecoPoster], a
	; ld a, DECO_PIKACHU_DOLL
	; ld [wDecoLeftOrnament], a
	; ld a, DECO_SURF_PIKACHU_DOLL
	; ld [wDecoRightOrnament], a
	; ld a, DECO_BIG_LAPRAS_DOLL
	; ld [wDecoBigDoll], a
	; ret
	
; .Gary
	; ld a, DECO_POLKADOT_BED
	; ld [wDecoBed], a
	; ld a, DECO_CLEFAIRY_POSTER
	; ld [wDecoPoster], a
	; ld a, DECO_CLEFAIRY_DOLL
	; ld [wDecoLeftOrnament], a
	; ld a, DECO_FARFETCHD_DOLL
	; ld [wDecoRightOrnament], a
	; ld a, DECO_BIG_SNORLAX_DOLL
	; ld [wDecoBigDoll], a
	; ret
	ret

_PlayerDecorationMenu:
	ld a, [wWhichIndexSet]
	push af
	ld hl, .MenuHeader
	call LoadMenuHeader
	xor a ; FALSE
	ld [wChangedDecorations], a
	ld a, $1 ; bed
	ld [wCurDecorationCategory], a
.top_loop
	ld a, [wCurDecorationCategory]
	ld [wMenuCursorPosition], a
	call .FindCategoriesWithOwnedDecos
	call DoNthMenu
	ld a, [wMenuCursorY]
	ld [wCurDecorationCategory], a
	jr c, .exit_menu
	ld a, [wMenuSelection]
	ld hl, .category_pointers
	call MenuJumptable
	jr nc, .top_loop

.exit_menu
	call ExitMenu
	pop af
	ld [wWhichIndexSet], a
	ld a, [wChangedDecorations]
	ld c, a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; items
	dw wNumOwnedDecoCategories
	dw PlaceNthMenuStrings
	dw .category_pointers

.category_pointers:
	table_width 2 + 2, _PlayerDecorationMenu.category_pointers
	dw DecoBedMenu,      .bed
	dw DecoCarpetMenu,   .carpet
	dw DecoWallpaperMenu,  .wallpaper
	dw DecoPlantMenu,    .plant
	dw DecoPosterMenu,   .poster
	dw DecoConsoleMenu,  .game
	dw DecoOrnamentMenu, .ornament
	dw DecoBigDollMenu,  .big_doll
	; dw DecoSeasonDirtMenu,      .season_dirt
	; dw DecoSeasonGrassMenu,      .season_grass
	dw DecoExitMenu,     .exit
	
	
	assert_table_length NUM_DECO_CATEGORIES + 1

.bed:      db "BED@"
.carpet:   db "CARPET@"
.wallpaper: db "WALLPAPER@"
.plant:    db "PLANT@"
.poster:   db "POSTER@"
.game:     db "GAME CONSOLE@"
.ornament: db "ORNAMENT@"
.big_doll: db "BIG DOLL@"
; .season_dirt: db "DIRT@"
; .season_grass: db "GRASS@"
.exit:     db "EXIT@"

.FindCategoriesWithOwnedDecos:
	xor a
	ld [wWhichIndexSet], a
	call .ClearStringBuffer2
	call .FindOwnedDecos
	ld a, 8
	call .AppendToStringBuffer2
	ld hl, wStringBuffer2
	ld de, wDecoNameBuffer
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ret

.ClearStringBuffer2:
	ld hl, wStringBuffer2
	xor a
	ld [hli], a
	ld bc, ITEM_NAME_LENGTH - 1
	ld a, -1
	call ByteFill
	ret

.AppendToStringBuffer2:
	ld hl, wStringBuffer2
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	ret

.FindOwnedDecos:
	ld hl, .owned_pointers
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	or e
	jr z, .done
	push hl
	call _de_
	pop hl
	jr nc, .next
	ld a, [hl]
	push hl
	call .AppendToStringBuffer2
	pop hl
.next
	inc hl
	jr .loop
.done
	ret

.owned_pointers:
	table_width 3, _PlayerDecorationMenu.owned_pointers
	dwb FindOwnedBeds,       0 ; bed
	dwb FindOwnedCarpets,    1 ; carpet
	dwb FindOwnedWallpapers, 2 ; wallpaper
	dwb FindOwnedPlants,     3 ; plant
	dwb FindOwnedPosters,    4 ; poster
	dwb FindOwnedConsoles,   5 ; game console
	dwb FindOwnedOrnaments,  6 ; ornament
	dwb FindOwnedBigDolls,   7 ; big doll
	; dwb FindOwnedSeasonDirts,    8 ; season dirt
	; dwb FindOwnedSeasonGrasses,   9 ; season grass
	assert_table_length NUM_DECO_CATEGORIES
	dw 0 ; end

Deco_FillTempWithMinusOne:
	xor a
	ld hl, wNumOwnedDecoCategories
	ld [hli], a
	assert wNumOwnedDecoCategories + 1 == wOwnedDecoCategories
	ld a, -1
	ld bc, 16
	call ByteFill
	ret

CheckAllDecorationFlags:
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push hl
	push af
	ld b, CHECK_FLAG
	call DecorationFlagAction
	ld a, c
	and a
	pop bc
	ld a, b
	call nz, AppendDecoIndex
	pop hl
	jr .loop

.done
	ret

AppendDecoIndex:
	ld hl, wNumOwnedDecoCategories
	inc [hl]
	assert wNumOwnedDecoCategories + 1 == wOwnedDecoCategories
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	ret

FindOwnedDecosInCategory:
	push bc
	push hl
	call Deco_FillTempWithMinusOne
	pop hl
	call CheckAllDecorationFlags
	pop bc
	ld a, [wNumOwnedDecoCategories]
	and a
	ret z

	ld a, c
	call AppendDecoIndex
	ld a, 0
	call AppendDecoIndex
	scf
	ret

DecoBedMenu:
	call FindOwnedBeds
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedBeds:
	ld hl, .beds
	ld c, BEDS
	jp FindOwnedDecosInCategory

.beds:
	db DECO_FEATHERY_BED ; 2
	db DECO_PINK_BED ; 3
	db DECO_POLKADOT_BED ; 4
	db DECO_PIKACHU_BED ; 5
	db DECO_GREEN_BED ; 5
	db -1

DecoCarpetMenu:
	call FindOwnedCarpets
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedCarpets:
	ld hl, .carpets
	ld c, CARPETS
	jp FindOwnedDecosInCategory

.carpets:
	db DECO_RED_CARPET ; 7
	db DECO_BLUE_CARPET ; 8
	db DECO_YELLOW_CARPET ; 9
	db DECO_GREEN_CARPET ; a
	db -1

DecoWallpaperMenu:
	call FindOwnedWallpapers
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedWallpapers:
	ld hl, .wallpapers
	ld c, WALLPAPERS
	jp FindOwnedDecosInCategory

.wallpapers:
	db DECO_RED_WALLPAPER ; 7
	db DECO_BLUE_WALLPAPER ; 8
	db DECO_YELLOW_WALLPAPER ; 9
	db DECO_GREEN_WALLPAPER ; a
	db -1
	

DecoPlantMenu:
	call FindOwnedPlants
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedPlants:
	ld hl, .plants
	ld c, PLANTS
	jp FindOwnedDecosInCategory

.plants:
	db DECO_MAGNAPLANT ; c
	db DECO_TROPICPLANT ; d
	db DECO_JUMBOPLANT ; e
	db -1

DecoPosterMenu:
	call FindOwnedPosters
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedPosters:
	ld hl, .posters
	ld c, POSTERS
	jp FindOwnedDecosInCategory

.posters:
	db DECO_TOWN_MAP ; 10
	db DECO_PIKACHU_POSTER ; 11
	db DECO_CLEFAIRY_POSTER ; 12
	db DECO_JIGGLYPUFF_POSTER ; 13
	db -1

DecoConsoleMenu:
	call FindOwnedConsoles
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedConsoles:
	ld hl, .consoles
	ld c, CONSOLES
	jp FindOwnedDecosInCategory

.consoles:
	db DECO_FAMICOM ; 15
	db DECO_SNES ; 16
	db DECO_N64 ; 17
	db DECO_GAMECUBE ; 18
	db -1

DecoOrnamentMenu:
	call FindOwnedOrnaments
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedOrnaments:
	ld hl, .ornaments
	ld c, DOLLS
	jp FindOwnedDecosInCategory

.ornaments:

	db DECO_PIKACHU_DOLL ; 1e
	db DECO_SURF_PIKACHU_DOLL ; 1f
	db DECO_CLEFAIRY_DOLL ; 20
	db DECO_JIGGLYPUFF_DOLL ; 21
	 db DECO_BULBASAUR_DOLL ; 22
	 db DECO_CHARMANDER_DOLL ; 23
	 db DECO_SQUIRTLE_DOLL ; 24
	db DECO_POLIWAG_DOLL ; 25
	db DECO_DIGLETT_DOLL ; 26
	db DECO_STARMIE_DOLL ; 27
	db DECO_MAGIKARP_DOLL ; 28
	db DECO_ODDISH_DOLL ; 29
	db DECO_GENGAR_DOLL ; 2a
	db DECO_SHELLDER_DOLL ; 2b
	db DECO_GRIMER_DOLL ; 2c
	db DECO_VOLTORB_DOLL ; 2d
	db DECO_WEEDLE_DOLL ; 2e
	db DECO_UNOWN_DOLL ; 2f
	db DECO_GEODUDE_DOLL ; 30
	db DECO_MACHOP_DOLL ; 31
	db DECO_TENTACOOL_DOLL ; 32
	
	; db DECO_GROWLITHE_DOLL ; 29
	; db DECO_ZUBAT_DOLL ; 2a
	; db DECO_TOGEPI_DOLL ; 2b
	; db DECO_BUTTERFREE_DOLL ; 2c
	; db DECO_JYNX_DOLL ; 2d
	; db DECO_EKANS_DOLL ; 2e
	; db DECO_PARAS_DOLL ; 2f
	; db DECO_TAUROS_DOLL ; 30
	; db DECO_LAPRAS_DOLL ; 31
	
	; db DECO_RHYDON_DOLL ; 2e
	; db DECO_FARFETCHD_DOLL ; 2f
	; db DECO_SNORLAX_DOLL ; 30
	
	; db DECO_ARTICUNO_DOLL ; 31
	; db DECO_ZAPDOS_DOLL ; 32
	; db DECO_MOLTRES_DOLL ; 33
	
	; db DECO_GYARADOS_DOLL ; 34
	; db DECO_LUGIA_DOLL ; 35
	; db DECO_HO_OH_DOLL ; 36
	
	db DECO_GOLD_TROPHY_DOLL ; 37
	db DECO_SILVER_TROPHY_DOLL ; 38
	db -1

DecoBigDollMenu:
	call FindOwnedBigDolls
	call PopulateDecoCategoryMenu
	xor a
	ret

FindOwnedBigDolls:
	ld hl, .big_dolls
	ld c, BIG_DOLLS
	jp FindOwnedDecosInCategory

.big_dolls:
	db DECO_BIG_SNORLAX_DOLL ; 1a
	db DECO_BIG_ONIX_DOLL ; 1b
	db DECO_BIG_LAPRAS_DOLL ; 1c
	db -1

DecoExitMenu:
	scf
	ret
    ; ld a, [wMusicPlaying]
	; cp MUSIC_MOBILE_ADAPTER
	; jr nz, .NES
    ; ld a, [wMusicPlaying]
	; cp MUSIC_MOBILE_ADAPTER_MENU
	; jr nz, .SNES
	; cp MUSIC_GS_OPENING
	; jr nz, .N64
	; cp MUSIC_GS_OPENING_2
	; jr nz, .GCN


; .NES
 ; scf
 ; changeblock 3, 3, $1c ; nes controller
 ; ret

; .SNES
 ; scf
 ; changeblock 3, 3, $1d ; snes controller
 ; ret

; .N64
 ; scf
 ; ret

; .GCN
 ; scf
 ; ret

PopulateDecoCategoryMenu:
	ld a, [wNumOwnedDecoCategories]
	and a
	jr z, .empty
	cp 8
	jr nc, .beyond_eight
	xor a
	ld [wWhichIndexSet], a
	ld hl, .NonscrollingMenuHeader
	call LoadMenuHeader
	call DoNthMenu
	jr c, .no_action_1
	call DoDecorationAction2

.no_action_1
	call ExitMenu
	ret

.beyond_eight
	ld hl, wNumOwnedDecoCategories
	ld e, [hl]
	dec [hl]
	assert wNumOwnedDecoCategories + 1 == wOwnedDecoCategories
	ld d, 0
	add hl, de
	ld [hl], -1
	call LoadStandardMenuHeader
	ld hl, .ScrollingMenuHeader
	call CopyMenuHeader
	xor a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	xor a
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .no_action_2
	call DoDecorationAction2

.no_action_2
	call ExitMenu
	ret

.empty
	ld hl, .NothingToChooseText
	call MenuTextboxBackup
	ret

.NothingToChooseText:
	text_far _NothingToChooseText
	text_end

.NonscrollingMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .NonscrollingMenuData
	db 1 ; default option

.NonscrollingMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; items
	dw wDecoNameBuffer
	dw DecorationMenuFunction
	dw DecorationAttributes

.ScrollingMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, SCREEN_WIDTH - 2, SCREEN_HEIGHT - 2
	dw .ScrollingMenuData
	db 1 ; default option

.ScrollingMenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 8, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wNumOwnedDecoCategories
	dba DecorationMenuFunction
	dbw 0, NULL
	dbw 0, NULL

GetDecorationData:
	ld hl, DecorationAttributes
	ld bc, DECOATTR_STRUCT_LENGTH
	call AddNTimes
	ret

GetDecorationName:
	push hl
	call GetDecorationData
	call GetDecoName
	pop hl
	call CopyName2
	ret

DecorationMenuFunction:
	ld a, [wMenuSelection]
	push de
	call GetDecorationData
	call GetDecoName
	pop hl
	call PlaceString
	ret

DoDecorationAction2:
	ld a, [wMenuSelection]
	call GetDecorationData
	ld de, DECOATTR_ACTION
	add hl, de
	ld a, [hl]
	ld hl, .DecoActions
	rst JumpTable
	ret

.DecoActions:
	table_width 2, DoDecorationAction2.DecoActions
	dw DecoAction_nothing
	dw DecoAction_setupbed
	dw DecoAction_putawaybed
	dw DecoAction_setupcarpet
	dw DecoAction_putawaycarpet
	dw DecoAction_setupwallpaper
	dw DecoAction_putawaywallpaper
	dw DecoAction_setupplant
	dw DecoAction_putawayplant
	dw DecoAction_setupposter
	dw DecoAction_putawayposter
	dw DecoAction_setupconsole 
	dw DecoAction_putawayconsole
	dw DecoAction_setupbigdoll
	dw DecoAction_putawaybigdoll
	dw DecoAction_setupornament
	dw DecoAction_putawayornament
	; dw DecoAction_setupseasondirt
	; dw DecoAction_putawayseasondirt
	; dw DecoAction_setupseasongrass
	; dw DecoAction_putawayseasongrass
	assert_table_length NUM_DECO_ACTIONS + 1

DoDecorationAction3:

GetDecorationFlag:
	call GetDecorationData
	ld de, DECOATTR_EVENT_FLAG
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

DecorationFlagAction:
	push bc
	call GetDecorationFlag
	pop bc
	call EventFlagAction
	ret

GetDecorationSprite:
	ld a, c
	call GetDecorationData
	ld de, DECOATTR_SPRITE
	add hl, de
	ld a, [hl]
	ld c, a
	ret

INCLUDE "data/decorations/attributes.asm"

INCLUDE "data/decorations/names.asm"

GetDecoName:
	ld a, [hli] ; DECOATTR_TYPE
	ld e, [hl] ; DECOATTR_NAME
	ld bc, wStringBuffer2
	push bc
	ld hl, .NameFunctions
	rst JumpTable
	pop de
	ret

.NameFunctions:
	table_width 2, GetDecoName.NameFunctions
	dw .invalid
	dw .plant
	dw .bed
	dw .carpet
	dw .wallpaper
	dw .poster
	dw .doll
	dw .bigdoll
;	dw .seasondirt
;	dw .seasongrass
	assert_table_length NUM_DECO_TYPES + 1

.invalid:
	ret

.plant:
	ld a, e
	jr .getdeconame

.bed:
	call .plant
	ld a, _BED
	jr .getdeconame

.carpet:
	call .plant
	ld a, _CARPET
	jr .getdeconame
	
.wallpaper:
	call .plant
	ld a, _WALLPAPER
	jr .getdeconame	

.poster:
	ld a, e
	call .getpokename
	ld a, _POSTER
	jr .getdeconame

.doll:
	ld a, e
	call .getpokename
	ld a, _DOLL
	jr .getdeconame

.bigdoll:
	push de
	ld a, BIG_
	call .getdeconame
	pop de
	ld a, e
	jr .getpokename
	
; .seasondirt:
	; call .plant
	; ld a, _DIRT
	; jr .getdeconame	

; .seasongrass:
	; call .plant
	; ld a, _GRASS
	; jr .getdeconame	
	
.unused: ; unreferenced
	push de
	call .getdeconame
	pop de
	ld a, e
	jr .getdeconame

.getpokename:
	push bc
	ld c, a
	ld b, 0
	ld hl, DecorationAttributePokemonNames
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndex], a
	call GetPokemonName
	pop bc
	jr .copy

.getdeconame:
	call ._getdeconame
	jr .copy

._getdeconame:
	push bc
	ld hl, DecorationNames
	call GetNthString
	ld d, h
	ld e, l
	pop bc
	ret

.copy:
	ld h, b
	ld l, c
	call CopyName2
	dec hl
	ld b, h
	ld c, l
	ret

DecoAction_nothing:
	scf
	ret

DecoAction_setupbed:
	ld hl, wDecoBed
	jp DecoAction_TrySetItUp

DecoAction_putawaybed:
	ld hl, wDecoBed
	jp DecoAction_TryPutItAway

DecoAction_setupcarpet:
	ld hl, wDecoCarpet
	jp DecoAction_TrySetItUp

DecoAction_putawaycarpet:
	ld hl, wDecoCarpet
	jp DecoAction_TryPutItAway
	
DecoAction_setupwallpaper:
	ld hl, wDecoWallpaper
	jp DecoAction_TrySetItUp

DecoAction_putawaywallpaper:
	ld hl, wDecoWallpaper
	jp DecoAction_TryPutItAway	

DecoAction_setupplant:
	ld hl, wDecoPlant
	jp DecoAction_TrySetItUp

DecoAction_putawayplant:
	ld hl, wDecoPlant
	jp DecoAction_TryPutItAway

DecoAction_setupposter:
	ld hl, wDecoPoster
	jp DecoAction_TrySetItUp

DecoAction_putawayposter:
	ld hl, wDecoPoster
	jp DecoAction_TryPutItAway

DecoAction_setupconsole:
;	call RestartMapMusic
	ld hl, wDecoConsole
	jp DecoAction_TrySetItUp

DecoAction_putawayconsole:
	ld hl, wDecoConsole
	jp DecoAction_TryPutItAway

DecoAction_setupbigdoll:
	ld hl, wDecoBigDoll
	jp DecoAction_TrySetItUp

DecoAction_putawaybigdoll:
	ld hl, wDecoBigDoll
	jp DecoAction_TryPutItAway
	
; DecoAction_setupseasondirt:
	; ld hl, wDecoSeasonDirt
	; jp DecoAction_TrySetItUp

; DecoAction_putawayseasondirt:
	; ld hl, wDecoSeasonDirt
	; jp DecoAction_TryPutItAway
	
		
; DecoAction_setupseasongrass:
	; ld hl, wDecoSeasonGrass
	; jp DecoAction_TrySetItUp
	
; DecoAction_putawayseasongrass:
	; ld hl, wDecoSeasonGrass
	; jp DecoAction_TryPutItAway


DecoAction_TrySetItUp:
	ld a, [hl]
	ld [wCurDecoration], a
	push hl
	call DecoAction_SetItUp
	jr c, .failed
	ld a, TRUE
	ld [wChangedDecorations], a
	pop hl
	ld a, [wMenuSelection]
	ld [hl], a
	xor a
	ret

.failed
	pop hl
	xor a
	ret

DecoAction_SetItUp:
; See if there's anything of the same type already out
	ld a, [wCurDecoration]
	and a
	jr z, .nothingthere
; See if that item is already out
	ld b, a
	ld a, [wMenuSelection]
	cp b
	jr z, .alreadythere
; Put away the item that's already out, and set up the new one
	ld a, [wMenuSelection]
	ld hl, wStringBuffer4
	call GetDecorationName
	ld a, [wCurDecoration]
	ld hl, wStringBuffer3
	call GetDecorationName
	ld hl, PutAwayAndSetUpText
	call MenuTextboxBackup
	xor a

	;call RestartMapMusic
	ret

.nothingthere
	ld a, [wMenuSelection]
	ld hl, wStringBuffer3
	call GetDecorationName
	ld hl, SetUpTheDecoText
	call MenuTextboxBackup
	xor a
	ret

.alreadythere
	ld hl, AlreadySetUpText
	call MenuTextboxBackup
	scf
	ret

DecoAction_TryPutItAway:
; If there is no item of that type already set, there is nothing to put away.
	ld a, [hl]
	ld [wCurDecoration], a
	xor a
	ld [hl], a
	ld a, [wCurDecoration]
	and a
	jr z, .nothingthere
; Put it away.
	ld a, TRUE
	ld [wChangedDecorations], a
	ld a, [wCurDecoration]
	ld [wMenuSelection], a
	ld hl, wStringBuffer3
	call GetDecorationName
	ld hl, PutAwayTheDecoText
	call MenuTextboxBackup
	xor a
	ret

.nothingthere
	ld hl, NothingToPutAwayText
	call MenuTextboxBackup
	xor a
	ret

DecoAction_setupornament:
	ld hl, WhichSidePutOnText
	call DecoAction_AskWhichSide
	jr c, .cancel
	call DecoAction_SetItUp_Ornament
	jr c, .cancel
	ld a, TRUE
	ld [wChangedDecorations], a
	jr DecoAction_FinishUp_Ornament

.cancel
	xor a
	ret

DecoAction_putawayornament:
	ld hl, WhichSidePutAwayText
	call DecoAction_AskWhichSide
	jr nc, .incave
	xor a
	ret

.incave
	call DecoAction_PutItAway_Ornament

DecoAction_FinishUp_Ornament:
	call QueryWhichSide
	ld a, [wSelectedDecoration]
	ld [hl], a
	ld a, [wOtherDecoration]
	ld [de], a
	xor a
	ret

DecoAction_SetItUp_Ornament:
	ld a, [wSelectedDecoration]
	and a
	jr z, .nothingthere
	ld b, a
	ld a, [wMenuSelection]
	cp b
	jr z, .failed
	ld a, b
	ld hl, wStringBuffer3
	call GetDecorationName
	ld a, [wMenuSelection]
	ld hl, wStringBuffer4
	call GetDecorationName
	ld a, [wMenuSelection]
	ld [wSelectedDecoration], a
	call .getwhichside
	ld hl, PutAwayAndSetUpText
	call MenuTextboxBackup
	xor a
	ret

.nothingthere
	ld a, [wMenuSelection]
	ld [wSelectedDecoration], a
	call .getwhichside
	ld a, [wMenuSelection]
	ld hl, wStringBuffer3
	call GetDecorationName
	ld hl, SetUpTheDecoText
	call MenuTextboxBackup
	xor a
	ret

.failed
	ld hl, AlreadySetUpText
	call MenuTextboxBackup
	scf
	ret

.getwhichside
	ld a, [wMenuSelection]
	ld b, a
	ld a, [wOtherDecoration]
	cp b
	ret nz
	xor a
	ld [wOtherDecoration], a
	ret

WhichSidePutOnText:
	text_far _WhichSidePutOnText
	text_end

DecoAction_PutItAway_Ornament:
	ld a, [wSelectedDecoration]
	and a
	jr z, .nothingthere
	ld hl, wStringBuffer3
	call GetDecorationName
	ld a, TRUE
	ld [wChangedDecorations], a
	xor a
	ld [wSelectedDecoration], a
	ld hl, PutAwayTheDecoText
	call MenuTextboxBackup
	xor a
	ret

.nothingthere
	ld hl, NothingToPutAwayText
	call MenuTextboxBackup
	xor a
	ret

WhichSidePutAwayText:
	text_far _WhichSidePutAwayText
	text_end

DecoAction_AskWhichSide:
	call MenuTextbox
	ld hl, DecoSideMenuHeader
	call GetMenu2
	call ExitMenu
	call CopyMenuData
	jr c, .nope
	ld a, [wMenuCursorY]
	cp 3 ; cancel
	jr z, .nope
	ld [wSelectedDecorationSide], a
	call QueryWhichSide
	ld a, [hl]
	ld [wSelectedDecoration], a
	ld a, [de]
	ld [wOtherDecoration], a
	xor a
	ret

.nope
	scf
	ret

QueryWhichSide:
	ld hl, wDecoRightOrnament
	ld de, wDecoLeftOrnament
	ld a, [wSelectedDecorationSide]
	cp 1 ; right side
	ret z
	; left side, swap hl and de
	push hl
	ld h, d
	ld l, e
	pop de
	ret

DecoSideMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 13, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "LEFT SIDE@"
	db "RIGHT SIDE@"
	db "CANCEL@"

PutAwayTheDecoText:
	text_far _PutAwayTheDecoText
	text_end

NothingToPutAwayText:
	text_far _NothingToPutAwayText
	text_end

SetUpTheDecoText:
	text_far _SetUpTheDecoText
	text_end

PutAwayAndSetUpText:
	text_far _PutAwayAndSetUpText
	text_end

AlreadySetUpText:
	text_far _AlreadySetUpText
	text_end

GetDecorationName_c_de:
	ld a, c
	ld h, d
	ld l, e
	call GetDecorationName
	ret

DecorationFlagAction_c:
	ld a, c
	jp DecorationFlagAction

GetDecorationName_c:
	ld a, c
	call GetDecorationID
	ld hl, wStringBuffer1
	push hl
	call GetDecorationName
	pop de
	ret

SetSpecificDecorationFlag:
	ld a, c
	call GetDecorationID
	ld b, SET_FLAG
	call DecorationFlagAction
	ret

GetDecorationID:
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, DecorationIDs
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

SetAllDecorationFlags: ; unreferenced
	ld hl, DecorationIDs
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push hl
	ld b, SET_FLAG
	call DecorationFlagAction
	pop hl
	jr .loop

.done
	ret

INCLUDE "data/decorations/decorations.asm"

DescribeDecoration::
	ld a, b
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
; entries correspond to DECODESC_* constants
	table_width 2, DescribeDecoration.Jumptable
	dw DecorationDesc_Poster
	dw DecorationDesc_LeftOrnament
	dw DecorationDesc_RightOrnament
	dw DecorationDesc_GiantOrnament
	dw DecorationDesc_Console
	assert_table_length NUM_DECODESCS

DecorationDesc_Poster:
	ld a, [wDecoPoster]
	ld hl, DecorationDesc_PosterPointers
	ld de, 3
	call IsInArray
	jr c, .nope
	ld de, DecorationDesc_NullPoster
	ld b, BANK(DecorationDesc_NullPoster)
	ret

.nope
	ld b, BANK(DecorationDesc_TownMapPoster)
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

DecorationDesc_PosterPointers:
	dbw DECO_TOWN_MAP, DecorationDesc_TownMapPoster
	dbw DECO_PIKACHU_POSTER, DecorationDesc_PikachuPoster
	dbw DECO_CLEFAIRY_POSTER, DecorationDesc_ClefairyPoster
	dbw DECO_JIGGLYPUFF_POSTER, DecorationDesc_JigglypuffPoster
	db -1

 DecorationDesc_TownMapPoster:
	; opentext
	; writetext .LookTownMapText
	; waitbutton
	; special OverworldTownMap
	; closetext
	 end

; .LookTownMapText:
	; text_far _LookTownMapText
	; text_end
	

DecorationDesc_PikachuPoster:
	jumptext .LookPikachuPosterText

.LookPikachuPosterText:
	text_far _LookPikachuPosterText
	text_end

DecorationDesc_ClefairyPoster:
	jumptext .LookClefairyPosterText

.LookClefairyPosterText:
	text_far _LookClefairyPosterText
	text_end

DecorationDesc_JigglypuffPoster:
	jumptext .LookJigglypuffPosterText

.LookJigglypuffPosterText:
	text_far _LookJigglypuffPosterText
	text_end

DecorationDesc_NullPoster:
	end

DecorationDesc_LeftOrnament:
	ld a, [wDecoLeftOrnament]
	jr DecorationDesc_OrnamentOrConsole

DecorationDesc_RightOrnament:
	ld a, [wDecoRightOrnament]
	jr DecorationDesc_OrnamentOrConsole

; DecorationDesc_Console:
	; ld a, [wDecoConsole]
	; jr DecorationDesc_OrnamentOrConsole

DecorationDesc_OrnamentOrConsole:
	ld c, a
	ld de, wStringBuffer3
	call GetDecorationName_c_de
	ld b, BANK(.OrnamentConsoleScript)
	ld de, .OrnamentConsoleScript
	ret

 .OrnamentConsoleScript:
	 jumptext .LookAdorableDecoText

 .LookAdorableDecoText:
	 text_far _LookAdorableDecoText
	 text_end
	
DecorationDesc_Console:
	ld a, [wDecoConsole]
	ld hl, DecorationDesc_ConsolePointers
	ld de, 3
	call IsInArray
	jr c, .nope
	ld de, DecorationDesc_NESConsole
	ld b, BANK(DecorationDesc_NESConsole)
	ret

.nope
	ld b, BANK(DecorationDesc_TownMapPoster)
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

DecorationDesc_ConsolePointers:
;	dbw DECO_TOWN_MAP, DecorationDesc_TownMapConsole
	dbw DECO_FAMICOM, DecorationDesc_NESConsole
	dbw DECO_SNES, DecorationDesc_SNESConsole
	dbw DECO_N64, DecorationDesc_N64Console
	dbw DECO_GAMECUBE, DecorationDesc_GamecubeConsole
	db -1

;DecorationDesc_TownMapConsole:
;	opentext
;	writetext .LookTownMapText
;	waitbutton
;	special OverworldTownMap
;	closetext
;	end

;.LookTownMapText:
;	text_far _LookTownMapText
;	text_end

DecorationDesc_NESConsole: ; Change Channel on Console Usage
    changeblock 3, 1, $1a ; wall plug + screen
;   changeblock 3, 3, $1c ; nes controller
	playmusic MUSIC_MOBILE_ADAPTER
	jumptext .LookNESConsoleText

.LookNESConsoleText:
	text_far _LookNESConsoleText
	text_end

DecorationDesc_SNESConsole:
   changeblock 3, 1, $20 ; wall plug + screen
;  changeblock 3, 3, $1d ; snes controller
;	reloadmappart
	playmusic MUSIC_MOBILE_ADAPTER_MENU
	; special SlotMachine
	; special RestartMapMusic
	jumptext .LookSNESConsoleText

.LookSNESConsoleText:
	text_far _LookSNESConsoleText
	text_end
     
DecorationDesc_N64Console:
;   changeblock 3, 3, $01 ; plain floor ; remove controller
;reloadmappart
   changeblock 3, 1, $1b ; wall plug + screen
;	reloadmappart
	playmusic MUSIC_GS_OPENING
;    special CardFlip
;	special RestartMapMusic
	jumptext .LookN64ConsoleText

.LookN64ConsoleText:
	text_far _LookN64ConsoleText
	text_end
	
DecorationDesc_GamecubeConsole:
;  changeblock 3, 3, $01 ; plain floor ; remove controller
;	reloadmappart
    changeblock 3, 1, $21 ; wall plug + screen
;	reloadmappart
	playmusic MUSIC_GS_OPENING_2
	jumptext .LookGamecubeConsoleText

.LookGamecubeConsoleText:
	text_far _LookGamecubeConsoleText
	text_end	

DecorationDesc_NullConsole:
	end	

DecorationDesc_GiantOrnament:
	ld b, BANK(.BigDollScript)
	ld de, .BigDollScript
	ret

.BigDollScript:
	jumptext .LookGiantDecoText

.LookGiantDecoText:
	text_far _LookGiantDecoText
	text_end

ToggleMaptileDecorations:
	
	; tile coordinates work the same way as for changeblock
	lb de, 0, 4 ; bed coordinates
	ld a, [wDecoBed]
	call SetDecorationTile
	
	lb de, 7, 1 ; plant coordinates
	ld a, [wDecoPlant]
	call SetDecorationTile


	lb de, 5, 0 ; poster coordinates
	ld a, [wDecoPoster]
	call SetDecorationTile
	call SetPosterVisibility
	

	
	; lb de, 0, 0 ; carpet top-left coordinates
	; call PadCoords_de
	; ld a, [wDecoCarpet]
	; and a
	; ret z
	; call _GetDecorationSprite
	; ld [hl], a
	; push af
	; lb de, 0, 2 ; carpet bottom-left coordinates
	; call PadCoords_de
	; pop af
	; inc a
	; ld [hli], a ; carpet bottom-left block
	; inc a
	; ld [hli], a ; carpet bottom-middle block
	; dec a
	; ld [hl], a ; carpet bottom-right block
	; ret

SetPosterVisibility:
	ld b, SET_FLAG
	ld a, [wDecoPoster]
	and a
	jr nz, .ok
	ld b, RESET_FLAG

.ok
	ld de, EVENT_PLAYERS_ROOM_POSTER
	jp EventFlagAction
		

SetDecorationTile:
	push af
	call PadCoords_de
	pop af
	and a
	ret z
	call _GetDecorationSprite
	ld [hl], a
	ret

ToggleDecorationsVisibility:
	ld de, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	ld hl, wVariableSprites + SPRITE_CONSOLE - SPRITE_VARS
	ld a, [wDecoConsole]
	call ToggleDecorationVisibility
	ld de, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	ld hl, wVariableSprites + SPRITE_DOLL_1 - SPRITE_VARS
	ld a, [wDecoLeftOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	ld hl, wVariableSprites + SPRITE_DOLL_2 - SPRITE_VARS
	ld a, [wDecoRightOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	ld hl, wVariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS
	ld a, [wDecoBigDoll]
	call ToggleDecorationVisibility
	
	ld de, EVENT_REDS_HOUSE_2F_CONSOLE
	ld hl, wVariableSprites + SPRITE_CONSOLE - SPRITE_VARS
	ld a, [wDecoConsole]
	call ToggleDecorationVisibility
	ld de, EVENT_REDS_HOUSE_2F_DOLL_1
	ld hl, wVariableSprites + SPRITE_DOLL_1 - SPRITE_VARS
	ld a, [wDecoLeftOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_REDS_HOUSE_2F_DOLL_2
	ld hl, wVariableSprites + SPRITE_DOLL_2 - SPRITE_VARS
	ld a, [wDecoRightOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_REDS_HOUSE_2F_BIG_DOLL
	ld hl, wVariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS
	ld a, [wDecoBigDoll]
	call ToggleDecorationVisibility
	
	ld de, EVENT_BLUES_HOUSE_2F_CONSOLE
	ld hl, wVariableSprites + SPRITE_CONSOLE - SPRITE_VARS
	ld a, [wDecoConsole]
	call ToggleDecorationVisibility
	ld de, EVENT_BLUES_HOUSE_2F_DOLL_1
	ld hl, wVariableSprites + SPRITE_DOLL_1 - SPRITE_VARS
	ld a, [wDecoLeftOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_BLUES_HOUSE_2F_DOLL_2
	ld hl, wVariableSprites + SPRITE_DOLL_2 - SPRITE_VARS
	ld a, [wDecoRightOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_BLUES_HOUSE_2F_BIG_DOLL
	ld hl, wVariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS
	ld a, [wDecoBigDoll]
	call ToggleDecorationVisibility
	ret

ToggleDecorationVisibility:
	and a
	jr z, .hide
	call _GetDecorationSprite
	ld [hl], a
	ld b, RESET_FLAG
	jp EventFlagAction

.hide
	ld b, SET_FLAG
	jp EventFlagAction

_GetDecorationSprite:
	ld c, a
	push de
	push hl
	farcall GetDecorationSprite
	pop hl
	pop de
	ld a, c
	ret

PadCoords_de:
; adjusts coordinates, the same way as Script_changeblock
	ld a, d
	add 4
	ld d, a
	ld a, e
	add 4
	ld e, a
	call GetBlockLocation
	ret




CoverTilesWithCarpet::
; Check if a carpet decoration is being used
	ld a, [wDecoCarpet]
	and a
	ret z

; [wCarpetTile] = the carpet tile ID from DecorationAttributes
	ld c, a
	call GetDecorationSprite
	ld a, c
	ld [wCarpetTile], a

; [wFloorTile] = $01
; This tile will use the palette of [wCarpetTile] instead
	ld a, $01
	ld [wFloorTile], a

; Cover each tile listed in CarpetCoveredTiles 
	ld hl, CarpetCoveredTiles
.loop
; Stop when we reach -1
	ld a, [hli]
	cp -1
	ret z
; [wCoveredTile] = the tile ID to cover with carpet
	ld [wCoveredTile], a
; bc = the mask for which pixels to cover
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
; Copy the carpet pixels over the covered pixels
	push hl
	call CoverCarpetTile
	pop hl
	jr .loop

CoverCarpetTile:
; Copy pixels from tile #[wCarpetTile] to tile #[wCoveredTile]
; based on the bitmask in bc.
; Both tile IDs must be less than $80 (i.e. in bank 0).

	push bc

; de = covered tile in VRAM (destination)
	ld a, [wCoveredTile]
	ld hl, vTiles2
	ld bc, 1 tiles
	call AddNTimes
	ld d, h
	ld e, l

; hl = carpet tile in VRAM (source)
	ld a, [wCarpetTile]
	ld hl, vTiles2
	ld bc, 1 tiles
	call AddNTimes

	pop bc

; bc = one byte before the pixel mask
	dec bc

; Cover all 8 rows of the tile
rept TILE_WIDTH - 1
	call .CoverRow
endr
.CoverRow:
	inc bc ; advance to the next 1bpp mask byte
	call .CoverHalfRow
.CoverHalfRow:
	push hl
; h = carpet byte
	ld a, [hl]
	ld h, a
; l = covered byte
	ld a, [de]
	ld l, a
; h = carpet & mask
	ld a, [bc]
	and h
	ld h, a
; l = covered & ~mask
	ld a, [bc]
	cpl
	and l
	ld l, a
; covered = (carpet & mask) | (covered & ~mask) = if mask then carpet else covered
	or h
	ld [de], a
	pop hl
	inc hl ; advance to the next 2bpp carpet byte
	inc de ; advance to the next 2bpp covered byte
	ret

INCLUDE "data/decorations/carpet_covered_tiles.asm"







CoverTilesWithWallpaper::
; Check if a wallpaper decoration is being used
	ld a, [wDecoWallpaper]
	and a
	ret z

; [wWallpaperTile] = the wallpaper tile ID from DecorationAttributes
	ld c, a
	call GetDecorationSprite
	ld a, c
	ld [wWallpaperTile], a

; [wWallTile] = $02
; This tile will use the palette of [wWallpaperTile] instead
	ld a, $02
	ld [wWallTile], a

; Cover each tile listed in WallpaperCoveredTiles 
	ld hl, WallpaperCoveredTiles
.loop
; Stop when we reach -1
	ld a, [hli]
	cp -1
	ret z
; [wCoveredTile2] = the tile ID to cover with wallpaper
	ld [wCoveredTile2], a
; bc = the mask for which pixels to cover
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
; Copy the wallpaper pixels over the covered pixels
	push hl
	call CoverWallpaperTile
	pop hl
	jr .loop

CoverWallpaperTile:
; Copy pixels from tile #[wWallpaperTile] to tile #[wCoveredTile2]
; based on the bitmask in bc.
; Both tile IDs must be less than $80 (i.e. in bank 0).

	push bc

; de = covered tile in VRAM (destination)
	ld a, [wCoveredTile2]
	ld hl, vTiles2
	ld bc, 1 tiles
	call AddNTimes
	ld d, h
	ld e, l

; hl = wallpaper tile in VRAM (source)
	ld a, [wWallpaperTile]
	ld hl, vTiles2
	ld bc, 1 tiles
	call AddNTimes

	pop bc

; bc = one byte before the pixel mask
	dec bc

; Cover all 8 rows of the tile
rept TILE_WIDTH - 1
	call .CoverRow2
endr
.CoverRow2:
	inc bc ; advance to the next 1bpp mask byte
	call .CoverHalfRow2
.CoverHalfRow2:
	push hl
; h = wallpaper byte
	ld a, [hl]
	ld h, a
; l = covered byte
	ld a, [de]
	ld l, a
; h = wallpaper & mask
	ld a, [bc]
	and h
	ld h, a
; l = covered & ~mask
	ld a, [bc]
	cpl
	and l
	ld l, a
; covered = (wallpaper & mask) | (covered & ~mask) = if mask then wallpaper else covered
	or h
	ld [de], a
	pop hl
	inc hl ; advance to the next 2bpp carpet byte
	inc de ; advance to the next 2bpp covered byte
	ret
INCLUDE "data/decorations/wallpaper_covered_tiles.asm"