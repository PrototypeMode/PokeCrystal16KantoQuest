DEF BLUESHOUSEDAISY2F_CARPET1_COINS      EQU 1
DEF BLUESHOUSEDAISY2F_CARPET2_COINS      EQU 2
DEF BLUESHOUSEDAISY2F_CARPET3_COINS      EQU 3

	object_const_def
	const BLUESHOUSEDAISY2F_CONSOLE
	const BLUESHOUSEDAISY2F_DOLL_1
	const BLUESHOUSEDAISY2F_DOLL_2
	const BLUESHOUSEDAISY2F_BIG_DOLL

BluesHouseDaisy2F_MapScripts:
	def_scene_scripts
	scene_script BluesHouseDaisy2FNoopScene,  SCENE_BLUESHOUSEDAISY2F_NOOP

	def_callbacks
	; callback MAPCALLBACK_NEWMAP, BluesHouseDaisy2FInitializeRoomCallback
	; callback MAPCALLBACK_TILES, BluesHouseDaisy2FSetUpTileDecorationsCallback
    ; callback MAPCALLBACK_CARPETGRAPHICS, BluesHouseDaisy2FRenderCarpetCallback
	; callback MAPCALLBACK_WALLPAPERGRAPHICS, BluesHouseDaisy2FRenderWallpaperCallback
	
BluesHouseDaisy2FNoopScene: ; unreferenced
;    setevent EVENT_USE_NES 
;	 setevent EVENT_USE_SNES 
;	 setevent EVENT_USE_N64
;	 setevent EVENT_USE_VIRTUAL_BOY  
     end
	 
BluesHouseDaisy2FInitializeRoomCallback:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	; setevent EVENT_DECO_CARPET_1
	; setevent EVENT_DECO_CARPET_2
    ; setevent EVENT_DECO_CARPET_3
    ; setevent EVENT_DECO_CARPET_4
	; setevent EVENT_DECO_WALLPAPER_1
	; setevent EVENT_DECO_WALLPAPER_2
    ; setevent EVENT_DECO_WALLPAPER_3
    ; setevent EVENT_DECO_WALLPAPER_4
	; setevent EVENT_DECO_BED_1
	; setevent EVENT_DECO_BED_2
    ; setevent EVENT_DECO_BED_3
    ; setevent EVENT_DECO_BED_4
	; setevent EVENT_DECO_BED_5
; ;	setevent EVENT_DECO_PLANT_1
; ;	setevent EVENT_DECO_PLANT_2
; ;   setevent EVENT_DECO_PLANT_3
; ;   setevent EVENT_DECO_POSTER_1
; ;   setevent EVENT_DECO_POSTER_2
; ;	setevent EVENT_DECO_POSTER_3
; ;	setevent EVENT_DECO_POSTER_4
	; setevent EVENT_DECO_FAMICOM
	; setevent EVENT_DECO_SNES
	; setevent EVENT_DECO_N64
	; setevent EVENT_DECO_GAMECUBE
	; ; setevent EVENT_DECO_SPRING_DIRT
	; ; setevent EVENT_DECO_SUMMER_DIRT
    ; ; setevent EVENT_DECO_AUTUMN_DIRT
	; ; setevent EVENT_DECO_WINTER_DIRT
	
	; ; setevent EVENT_DECO_SPRING_GRASS
	; ; setevent EVENT_DECO_SUMMER_GRASS
    ; ; setevent EVENT_DECO_AUTUMN_GRASS
	; ; setevent EVENT_DECO_WINTER_GRASS
	; setevent EVENT_DECO_PIKACHU_DOLL
	; setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	; setevent EVENT_DECO_CLEFAIRY_DOLL
	; setevent EVENT_DECO_JIGGLYPUFF_DOLL
	; setevent EVENT_DECO_BULBASAUR_DOLL
	; setevent EVENT_DECO_CHARMANDER_DOLL
	; setevent EVENT_DECO_SQUIRTLE_DOLL
	; setevent EVENT_DECO_POLIWAG_DOLL
	; setevent EVENT_DECO_DIGLETT_DOLL
	; setevent EVENT_DECO_STARMIE_DOLL
	; setevent EVENT_DECO_MAGIKARP_DOLL
	; setevent EVENT_DECO_ODDISH_DOLL
	; setevent EVENT_DECO_GENGAR_DOLL
	; setevent EVENT_DECO_SHELLDER_DOLL
	; setevent EVENT_DECO_GRIMER_DOLL
	; setevent EVENT_DECO_VOLTORB_DOLL
	; setevent EVENT_DECO_WEEDLE_DOLL
	; setevent EVENT_DECO_UNOWN_DOLL
	; setevent EVENT_DECO_GEODUDE_DOLL
	; setevent EVENT_DECO_MACHOP_DOLL
	; setevent EVENT_DECO_TENTACOOL_DOLL
	
	; setevent EVENT_DECO_GROWLITHE_DOLL
    ; setevent EVENT_DECO_ZUBAT_DOLL            
    ; setevent EVENT_DECO_TOGEPI_DOLL           
    ; setevent EVENT_DECO_BUTTERFREE_DOLL 
    ; setevent EVENT_DECO_JYNX_DOLL         
    ; setevent EVENT_DECO_EKANS_DOLL  
    ; setevent EVENT_DECO_PARAS_DOLL             
    ; setevent EVENT_DECO_TAUROS_DOLL        
    ; setevent EVENT_DECO_LAPRAS_DOLL           
    ; setevent EVENT_DECO_RHYDON_DOLL         
    ; setevent EVENT_DECO_FARFETCHD_DOLL
    ; setevent EVENT_DECO_SNORLAX_DOLL
    ; setevent EVENT_DECO_GYARADOS_DOLL
	; setevent EVENT_DECO_ARTICUNO_DOLL
    ; setevent EVENT_DECO_ZAPDOS_DOLL
    ; setevent EVENT_DECO_MOLTRES_DOLL
    ; setevent EVENT_DECO_LUGIA_DOLL
    ; setevent EVENT_DECO_HO_OH_DOLL
    ; setevent EVENT_DECO_GOLD_TROPHY
    ; setevent EVENT_DECO_SILVER_TROPHY 
	endcallback

BluesHouseDaisy2FSetUpTileDecorationsCallback:
	special ToggleMaptileDecorations
	endcallback

BluesHouseDaisy2FRenderCarpetCallback:
	special CoverTilesWithCarpet
	endcallback
	
BluesHouseDaisy2FRenderWallpaperCallback:
	special CoverTilesWithWallpaper
	endcallback

	
			
Text_ChangeTheLook5:
	text "We need to change"
	line "the look here…"
	done


Text_LikeTheLook5:
	text "How does this"
	line "style look to you?"
	done
	
	BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end
	
	BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingDown:
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	turn_head DOWN
	step_end
	
BluesHouseDaisy2FMovementData_BlueTakesOneStepUp_2:
	step UP
	step_end	

BluesHouseDaisyDoll1Script::
     describedecoration DECODESC_LEFT_DOLL	

BluesHouseDaisyDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BluesHouseDaisyBigDollScript:
	describedecoration DECODESC_BIG_DOLL
	
BluesHouseDaisyControllerScript:
	;setevent EVENT_USE_NES

BluesHouseDaisyGameConsoleScript:	 
     ;checkevent EVENT_USE_NES
	 ;iftrue .BluesHouseGameConsoleScriptNES
	 
     ;checkevent EVENT_USE_SNES
	 ;iftrue .BluesHouseGameConsoleScriptSNES
	 
	 ;checkevent EVENT_USE_N64
	 ;iftrue .BluesHouseGameConsoleScriptN64
	 
	 ;checkevent EVENT_USE_VIRTUAL_BOY
	 ;iftrue .BluesHouseGameConsoleScriptVirtualBoy
.BluesHouseDaisyGameConsoleScriptN64:	 
     ; refreshscreen
	 ; changeblock 3, 3, $01 ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end	 
	 
.BluesHouseDaisyGameConsoleScriptNES:
     ; refreshscreen
	 ; changeblock 3, 3, $1d ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end
.BluesHouseDaisyGameConsoleScriptSNES:	 
     ; refreshscreen
	 ; changeblock 3, 3, $1e ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end

.BluesHouseDaisyGameConsoleScriptVirtualBoy:	 
     ; refreshscreen
	 ; changeblock 3, 3, $01 ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end	 

;    describedecoration DECODESC_CONSOLE


BluesHouseDaisyPosterScript:
	conditional_event EVENT_BLUES_ROOM_POSTER, .Script

.Script:

	end

BluesHouseDaisyRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext DaisyRadioText1
	pause 45
	writetext DaisyRadioText2
	pause 45
	writetext DaisyRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext DaisyRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext DaisyRadioText4
	pause 45
	closetext
	end

BluesHouseDaisyBookshelfScript:

	jumpstd PictureBookshelfScript


BluesHouseDaisy2FDecoVendorScript:
	opentext
	writetext BluesHouseDaisy2FDecoVendorIntroText
	yesorno
	iftrue BluesHouse_Yes2
	iffalse .Cancel

.Cancel
    sjump BluesHouseDaisy2FDecoVendor_CancelPurchaseScript	
	
;.CheckCoin	
;	checkitem COIN_CASE
;	iffalse BluesHouse2FDecoVendor_NoCoinCaseScript

BluesHouse_Yes2:
    closetext
	opentext
	writetext BluesHouseDaisy2FDecoVendorWhichDecoText

.loop
	;writetext BluesHouse2FDecoVendorWhichDecoText
;	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
		verticalmenu
	closewindow
	ifequal 1, .Page1
	ifequal 2, .Page2
	ifequal 3, .Page3
	ifequal 4, .Page4
    ifequal 5, .Page5
	; ifequal 1, .ChrisCostume
	; ifequal 2, .KrisCostume
	; ifequal 3, .RedCostume
	; ifequal 4, .BlueCostume
    ; ifequal 5, .PikachuCostume
	sjump BluesHouseDaisy2FDecoVendor_CancelPurchaseScript
	
	
.Page1
	loadmenu .MenuHeader2
	verticalmenu
	;closewindow
	ifequal 1, .AshCostume
	ifequal 2, .MistyCostume
	ifequal 3, .BrockCostume
	ifequal 4, .GaryCostume
    ifequal 5, .PikachuCostume
    sjump BluesHouse_Yes2
.Page2
  end
.Page3
  end
.Page4
  end
.Page5
  end
  
.AshCostume:
	opentext
	writetext Text_ChangeTheLook5
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	callasm .PickAsh
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	
	opentext
	writetext Text_LikeTheLook5
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	end

 .PickAsh
    xor a
	ld [wPlayerCostume], a
	ld [wPlayerGender], a
	
	
	ld hl, wAshsName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
; .Ash:
	; db "<ASH>@"	
	; ret
	
.MistyCostume:
	opentext
	writetext Text_ChangeTheLook5
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_PINK << 4)
	special SetPlayerPalette
	callasm .PickMisty
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook5
	waitbutton
	closetext
	end	

.PickMisty
    ld a, 1
	ld [wPlayerCostume], a
	ld [wPlayerGender], a
	;ret 
	
	ld hl, wMistysName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
; .Misty:
	; db "<MISTY>@"
    ; ret	
 
.BrockCostume:
	opentext
	writetext Text_ChangeTheLook5
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_GREEN << 4)
	special SetPlayerPalette
	callasm .PickBrock
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook5
	waitbutton
	closetext
	end

.PickBrock
    ld a, 0
	ld [wPlayerGender], a
    ld a, 2
	ld [wPlayerCostume], a
	
	ld hl, wBrocksName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
; .Brock:
	; db "<BROCK>@"
	; ret
 
.GaryCostume:
	opentext
	writetext Text_ChangeTheLook5
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	callasm .PickGary
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook5
	waitbutton
	closetext
	end
 
.PickGary
    ld a, 0
	ld [wPlayerGender], a
    ld a, 3
	ld [wPlayerCostume], a
	
	ld hl, wGarysName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret		

.PikachuCostume:
	opentext
	writetext Text_ChangeTheLook5
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	callasm .PickPikachu
	applymovement PLAYER, BluesHouseDaisy2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook5
	waitbutton
	closetext
	end
 
.PickPikachu
    ld a, 4
	ld [wPlayerCostume], a
	
	ld hl, .PikachuName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	 ret
	 
 .PikachuName:
	 db "Pika!@"
	


;.Carpet1:
 	 ; checkcoins BLUESHOUSE2F_CARPET1_COINS
	 ; ifequal HAVE_LESS, BluesHouse2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_1
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_1
	 ; takecoins BLUESHOUSE2F_CARPET1_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext BluesHouse2FDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop
	  
 ; .Carpet2:
 	 ; checkcoins BLUESHOUSE2F_CARPET2_COINS
	 ; ifequal HAVE_LESS, BluesHouse2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_2
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_2
	 ; takecoins BLUESHOUSE2F_CARPET2_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext BluesHouse2FDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop	  

 ; .Carpet3:
 	 ; checkcoins BLUESHOUSE2F_CARPET3_COINS
	 ; ifequal HAVE_LESS, BluesHouse2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_3
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_3
	 ; takecoins BLUESHOUSE2F_CARPET3_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext BluesHouse2FDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop
	  
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 1 ; items
	db "CLOTHING@"
	; db "UNIFORMS@"
	; db "COSTUMES@"
	; db "DISGUISES@"
	; db "POKéMON@"

.MenuHeader2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, TEXTBOX_Y - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "<ASH>@"
	db "<MISTY>@"
	db "<BROCK>@"
	db "<GARY>@"
	db "PIKACHU@"
	end

.AlreadyHaveDecoItem
	writetext BluesHouse2FDecoVendor_AlreadyHaveDecoText
	waitbutton
	 sjump .loop
	 end
	 
BluesHouseDaisy2FDecoVendor_AlreadyHaveDecoText:
	text "You already have"
	line "this decoration!"
	done

BluesHouseDaisy2FDecoVendorIntroText:
	text "Change your"
    line "outfit?"
    done	
	; para "We exchange your"
	; line "game coins for"
	; cont "cool decorations!"
	;done

BluesHouseDaisy2FDecoVendorWhichDecoText:
	text "What will"
	line "you wear today?"
	done

; BluesHouse2FPrizeVendorConfirmPrizeText:
	; text_ram wStringBuffer3
	; text "."
	; line "Is that right?"
	; done

BluesHouseDaisy2FDecoVendorHereYouGoText:
	text "Enjoy!"
	done

BluesHouseDaisy2FDecoVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

BluesHouseDaisy2FDecoVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

BluesHouseDaisy2FDecoVendorQuitText:
	text "Hmm... I can't"
	line "decide what"
	cont "to wear!"
	done

BluesHouseDaisy2FDecoVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done
	  

BluesHouseDaisyPCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

DaisyRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

DaisyRadioText2:
	text "#MON CHANNEL!"
	done

DaisyRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

DaisyRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

BluesHouseDaisy2FDecoVendor_NotEnoughCoinsScript:
	writetext BluesHouse2FDecoVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

; BluesHouseDaisy2FDecoMonVendor_NoRoomForPrizeScript:
	; writetext BluesHouse2FDecoVendorNoMoreRoomText
	; waitbutton
	; closetext
	; end

BluesHouseDaisy2FDecoVendor_CancelPurchaseScript:
	writetext BluesHouse2FDecoVendorQuitText
	waitbutton
	closetext
	end

BluesHouseDaisy2FDecoVendor_NoCoinCaseScript:
	writetext BluesHouse2FDecoVendorNoCoinCaseText
	waitbutton
	closetext
	end

BluesHouseDaisy2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, BLUES_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_UP, BluesHouseDaisyPCScript
	bg_event  2,  1, BGEVENT_READ, BluesHouseDaisyRadioScript
	bg_event  6,  1, BGEVENT_READ, BluesHouseDaisy2FDecoVendorScript
	bg_event  5,  0, BGEVENT_IFSET, BluesHouseDaisyPosterScript

	def_object_events
	object_event  3,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BluesHouseDaisyGameConsoleScript, EVENT_BLUES_HOUSE_2F_CONSOLE
	object_event  7,  5, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BluesHouseDaisyDoll1Script, EVENT_BLUES_HOUSE_2F_DOLL_1
	object_event  6,  5, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BluesHouseDaisyDoll2Script, EVENT_BLUES_HOUSE_2F_DOLL_2
	object_event 10,  5, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BluesHouseDaisyBigDollScript, EVENT_BLUES_HOUSE_2F_BIG_DOLL
