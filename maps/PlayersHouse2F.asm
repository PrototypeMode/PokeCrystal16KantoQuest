DEF PLAYERSHOUSE2F_CARPET1_COINS      EQU 1
DEF PLAYERSHOUSE2F_CARPET2_COINS      EQU 2
DEF PLAYERSHOUSE2F_CARPET3_COINS      EQU 3

	object_const_def
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL

PlayersHouse2F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse2FNoopScene,  SCENE_PLAYERSHOUSE2F_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PlayersHouse2FInitializeRoomCallback
	; callback MAPCALLBACK_TILES, PlayersHouse2FSetUpTileDecorationsCallback
    ; callback MAPCALLBACK_CARPETGRAPHICS, RenderCarpetCallback
	; callback MAPCALLBACK_WALLPAPERGRAPHICS, RenderWallpaperCallback
	
PlayersHouse2FNoopScene: ; unreferenced
;    setevent EVENT_USE_NES 
;	 setevent EVENT_USE_SNES 
;	 setevent EVENT_USE_N64
;	 setevent EVENT_USE_VIRTUAL_BOY  
     end
	 
PlayersHouse2FInitializeRoomCallback:
	special ToggleDecorationsVisibility
	; setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
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

PlayersHouse2FSetUpTileDecorationsCallback:
	special ToggleMaptileDecorations
	endcallback

RenderCarpetCallback:
	special CoverTilesWithCarpet
	endcallback
	
RenderWallpaperCallback:
	special CoverTilesWithWallpaper
	endcallback

	
			
Text_ChangeTheLook2:
	text "We need to change"
	line "the look here…"
	done


Text_LikeTheLook2:
	text "How does this"
	line "style look to you?"
	done
	
	PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end
	
	PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	turn_head DOWN
	step_end
	
PlayersHouse2FMovementData_PlayerTakesOneStepUp_2:
	step UP
	step_end	

PlayersHouseDoll1Script::
     describedecoration DECODESC_LEFT_DOLL	

PlayersHouseDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

PlayersHouseBigDollScript:
	describedecoration DECODESC_BIG_DOLL
	
PlayersHouseControllerScript:
	;setevent EVENT_USE_NES

PlayersHouseGameConsoleScript:	 
     ;checkevent EVENT_USE_NES
	 ;iftrue .PlayersHouseGameConsoleScriptNES
	 
     ;checkevent EVENT_USE_SNES
	 ;iftrue .PlayersHouseGameConsoleScriptSNES
	 
	 ;checkevent EVENT_USE_N64
	 ;iftrue .PlayersHouseGameConsoleScriptN64
	 
	 ;checkevent EVENT_USE_VIRTUAL_BOY
	 ;iftrue .PlayersHouseGameConsoleScriptVirtualBoy
.PlayersHouseGameConsoleScriptN64:	 
     ; refreshscreen
	 ; changeblock 3, 3, $01 ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end	 
	 
.PlayersHouseGameConsoleScriptNES:
     ; refreshscreen
	 ; changeblock 3, 3, $1d ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end
.PlayersHouseGameConsoleScriptSNES:	 
     ; refreshscreen
	 ; changeblock 3, 3, $1e ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end

.PlayersHouseGameConsoleScriptVirtualBoy:	 
     ; refreshscreen
	 ; changeblock 3, 3, $01 ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end	 

;    describedecoration DECODESC_CONSOLE


PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:

	end

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayersRadioText1
	pause 45
	writetext PlayersRadioText2
	pause 45
	writetext PlayersRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayersRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:

	jumpstd PictureBookshelfScript


PlayersHouse2FDecoVendorScript:
	opentext
	writetext PlayersHouse2FDecoVendorIntroText
	yesorno
	iftrue Yes
	iffalse .Cancel

.Cancel
    sjump PlayersHouse2FDecoVendor_CancelPurchaseScript	
	
;.CheckCoin	
;	checkitem COIN_CASE
;	iffalse PlayersHouse2FDecoVendor_NoCoinCaseScript

Yes:
    closetext
	opentext
	writetext PlayersHouse2FDecoVendorWhichDecoText

.loop
	;writetext PlayersHouse2FDecoVendorWhichDecoText
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
	sjump PlayersHouse2FDecoVendor_CancelPurchaseScript
	
	
.Page1
	loadmenu .MenuHeader2
	verticalmenu
	;closewindow
	ifequal 1, .AshCostume
	ifequal 2, .MistyCostume
	ifequal 3, .BrockCostume
	ifequal 4, .GaryCostume
    ifequal 5, .PikachuCostume
    sjump Yes
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
	writetext Text_ChangeTheLook2
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	callasm .PickAsh
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	
	opentext
	writetext Text_LikeTheLook2
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
	writetext Text_ChangeTheLook2
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_PINK << 4)
	special SetPlayerPalette
	callasm .PickMisty
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook2
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
	writetext Text_ChangeTheLook2
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_GREEN << 4)
	special SetPlayerPalette
	callasm .PickBrock
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook2
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
	writetext Text_ChangeTheLook2
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	callasm .PickGary
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook2
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
	writetext Text_ChangeTheLook2
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	callasm .PickPikachu
	applymovement PLAYER, PlayersHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook2
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
 	 ; checkcoins PLAYERSHOUSE2F_CARPET1_COINS
	 ; ifequal HAVE_LESS, PlayersHouse2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_1
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_1
	 ; takecoins PLAYERSHOUSE2F_CARPET1_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext PlayersHouse2FDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop
	  
 ; .Carpet2:
 	 ; checkcoins PLAYERSHOUSE2F_CARPET2_COINS
	 ; ifequal HAVE_LESS, PlayersHouse2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_2
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_2
	 ; takecoins PLAYERSHOUSE2F_CARPET2_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext PlayersHouse2FDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop	  

 ; .Carpet3:
 	 ; checkcoins PLAYERSHOUSE2F_CARPET3_COINS
	 ; ifequal HAVE_LESS, PlayersHouse2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_3
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_3
	 ; takecoins PLAYERSHOUSE2F_CARPET3_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext PlayersHouse2FDecoVendorHereYouGoText
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
	writetext PlayersHouse2FDecoVendor_AlreadyHaveDecoText
	waitbutton
	 sjump .loop
	 end
	 
PlayersHouse2FDecoVendor_AlreadyHaveDecoText:
	text "You already have"
	line "this decoration!"
	done

PlayersHouse2FDecoVendorIntroText:
	text "Change your"
    line "outfit?"
    done	
	; para "We exchange your"
	; line "game coins for"
	; cont "cool decorations!"
	;done

PlayersHouse2FDecoVendorWhichDecoText:
	text "What will"
	line "you wear today?"
	done

; PlayersHouse2FPrizeVendorConfirmPrizeText:
	; text_ram wStringBuffer3
	; text "."
	; line "Is that right?"
	; done

PlayersHouse2FDecoVendorHereYouGoText:
	text "Enjoy!"
	done

PlayersHouse2FDecoVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

PlayersHouse2FDecoVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

PlayersHouse2FDecoVendorQuitText:
	text "Hmm... I can't"
	line "decide what"
	cont "to wear!"
	done

PlayersHouse2FDecoVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done
	  

PlayersHousePCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

PlayersRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayersRadioText2:
	text "#MON CHANNEL!"
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersHouse2FDecoVendor_NotEnoughCoinsScript:
	writetext PlayersHouse2FDecoVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

; PlayersHouse2FDecoMonVendor_NoRoomForPrizeScript:
	; writetext PlayersHouse2FDecoVendorNoMoreRoomText
	; waitbutton
	; closetext
	; end

PlayersHouse2FDecoVendor_CancelPurchaseScript:
	writetext PlayersHouse2FDecoVendorQuitText
	waitbutton
	closetext
	end

PlayersHouse2FDecoVendor_NoCoinCaseScript:
	writetext PlayersHouse2FDecoVendorNoCoinCaseText
	waitbutton
	closetext
	end

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  6,  1, BGEVENT_READ, PlayersHouse2FDecoVendorScript
	bg_event  5,  0, BGEVENT_IFSET, PlayersHousePosterScript

	def_object_events
	object_event  3,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseGameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  7,  5, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  6,  5, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event 10,  5, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseBigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
