DEF REDSHOUSEMOM2F_CARPET1_COINS      EQU 1
DEF REDSHOUSEMOM2F_CARPET2_COINS      EQU 2
DEF REDSHOUSEMOM2F_CARPET3_COINS      EQU 3

	object_const_def
	const REDSHOUSEMOM2F_CONSOLE
	const REDSHOUSEMOM2F_DOLL_1
	const REDSHOUSEMOM2F_DOLL_2
	const REDSHOUSEMOM2F_BIG_DOLL

RedsHouseMom2F_MapScripts:
	def_scene_scripts
	scene_script RedsHouseMom2FNoopScene,  SCENE_REDSHOUSEMOM2F_NOOP

	def_callbacks
	; callback MAPCALLBACK_NEWMAP, RedsHouseMom2FInitializeRoomCallback
	; callback MAPCALLBACK_TILES, RedsHouseMom2FSetUpTileDecorationsCallback
    ; callback MAPCALLBACK_CARPETGRAPHICS, RedsHouseMom2FRenderCarpetCallback
	; callback MAPCALLBACK_WALLPAPERGRAPHICS, RedsHouseMom2FRenderWallpaperCallback
	
RedsHouseMom2FNoopScene: ; unreferenced

;    setevent EVENT_USE_NES 
;	 setevent EVENT_USE_SNES 
;	 setevent EVENT_USE_N64
;	 setevent EVENT_USE_VIRTUAL_BOY  
     end
	 
RedsHouseMom2FInitializeRoomCallback:
	
	; special ToggleDecorationsVisibility
	; setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8

	endcallback

RedsHouseMom2FSetUpTileDecorationsCallback:
	special ToggleMaptileDecorations
	endcallback

RedsHouseMom2FRenderCarpetCallback:
	special CoverTilesWithCarpet
	endcallback
	
RedsHouseMom2FRenderWallpaperCallback:
	special CoverTilesWithWallpaper
	endcallback

	
			
Text_ChangeTheLook6:
	text "We need to change"
	line "the look here…"
	done


Text_LikeTheLook6:
	text "How does this"
	line "style look to you?"
	done
	
	RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end
	
	RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingDown:
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	turn_head DOWN
	step_end
	
RedsHouseMom2FMovementData_BlueTakesOneStepUp_2:
	step UP
	step_end	

RedsHouseMom2FDoll1Script::
     describedecoration DECODESC_LEFT_DOLL	

RedsHouseMom2FDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

RedsHouseMom2FBigDollScript:
	describedecoration DECODESC_BIG_DOLL
	
RedsHouseMom2FControllerScript:
	;setevent EVENT_USE_NES

RedsHouseMom2FGameConsoleScript:	 
     ;checkevent EVENT_USE_NES
	 ;iftrue .RedsHouseGameConsoleScriptNES
	 
     ;checkevent EVENT_USE_SNES
	 ;iftrue .RedsHouseGameConsoleScriptSNES
	 
	 ;checkevent EVENT_USE_N64
	 ;iftrue .RedsHouseGameConsoleScriptN64
	 
	 ;checkevent EVENT_USE_VIRTUAL_BOY
	 ;iftrue .RedsHouseGameConsoleScriptVirtualBoy
.RedsHouseMom2FGameConsoleScriptN64:	 
     ; refreshscreen
	 ; changeblock 3, 3, $01 ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end	 
	 
.RedsHouseMom2FGameConsoleScriptNES:
     ; refreshscreen
	 ; changeblock 3, 3, $1d ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end
.RedsHouseMom2FGameConsoleScriptSNES:	 
     ; refreshscreen
	 ; changeblock 3, 3, $1e ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end

.RedsHouseMom2FGameConsoleScriptVirtualBoy:	 
     ; refreshscreen
	 ; changeblock 3, 3, $01 ; ladder
	 ; reloadmappart	
	 describedecoration DECODESC_CONSOLE
	 end	 

;    describedecoration DECODESC_CONSOLE


RedsHouseMom2FPosterScript:
	conditional_event EVENT_REDS_ROOM_POSTER, .Script

.Script:

	end

RedsHouseMom2FRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext RedsMomRadioText1
	pause 45
	writetext RedsMomRadioText2
	pause 45
	writetext RedsMomRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext RedsMomRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext RedsMomRadioText4
	pause 45
	closetext
	end

RedsHouseMom2FBookshelfScript:

	jumpstd PictureBookshelfScript


RedsHouseMom2FDecoVendorScript:
	opentext
	writetext RedsHouseMom2FDecoVendorIntroText
	yesorno
	iftrue RedsHouse_Yes2
	iffalse .Cancel

.Cancel
    sjump RedsHouseMom2FDecoVendor_CancelPurchaseScript	
	
;.CheckCoin	
;	checkitem COIN_CASE
;	iffalse RedsHouseMom2FDecoVendor_NoCoinCaseScript

RedsHouse_Yes2:
    closetext
	opentext
	writetext RedsHouseMom2FDecoVendorWhichDecoText

.loop
	;writetext RedsHouseMom2FDecoVendorWhichDecoText
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
	sjump RedsHouseMom2FDecoVendor_CancelPurchaseScript
	
	
.Page1
	loadmenu .MenuHeader2
	verticalmenu
	;closewindow
	ifequal 1, .AshCostume
	ifequal 2, .MistyCostume
	ifequal 3, .BrockCostume
	ifequal 4, .GaryCostume
    ifequal 5, .PikachuCostume
    sjump RedsHouse_Yes2
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
	writetext Text_ChangeTheLook6
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	callasm .PickAsh
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	
	opentext
	writetext Text_LikeTheLook6
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
	writetext Text_ChangeTheLook6
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_PINK << 4)
	special SetPlayerPalette
	callasm .PickMisty
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook6
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
	writetext Text_ChangeTheLook6
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_GREEN << 4)
	special SetPlayerPalette
	callasm .PickBrock
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook6
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
	writetext Text_ChangeTheLook6
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	callasm .PickGary
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook6
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
	writetext Text_ChangeTheLook6
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingRight

	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	callasm .PickPikachu
	applymovement PLAYER, RedsHouseMom2FMovementData_BlueSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_LikeTheLook6
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
 	 ; checkcoins REDSHOUSEMOM2F_CARPET1_COINS
	 ; ifequal HAVE_LESS, RedsHouseMom2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_1
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_1
	 ; takecoins REDSHOUSEMOM2F_CARPET1_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext RedsHouseMom2FDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop
	  
 ; .Carpet2:
 	 ; checkcoins REDSHOUSEMOM2F_CARPET2_COINS
	 ; ifequal HAVE_LESS, RedsHouseMom2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_2
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_2
	 ; takecoins REDSHOUSEMOM2F_CARPET2_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext RedsHouseMom2FDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop	  

 ; .Carpet3:
 	 ; checkcoins REDSHOUSEMOM2F_CARPET3_COINS
	 ; ifequal HAVE_LESS, RedsHouseMom2FDecoVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_3
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_3
	 ; takecoins REDSHOUSEMOM2F_CARPET3_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext RedsHouseMom2FDecoVendorHereYouGoText
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
	writetext RedsHouseMom2FDecoVendor_AlreadyHaveDecoText
	waitbutton
	 sjump .loop
	 end
	 
RedsHouseMom2FDecoVendor_AlreadyHaveDecoText:
	text "You already have"
	line "this decoration!"
	done

RedsHouseMom2FDecoVendorIntroText:
	text "Change your"
    line "outfit?"
    done	
	; para "We exchange your"
	; line "game coins for"
	; cont "cool decorations!"
	;done

RedsHouseMom2FDecoVendorWhichDecoText:
	text "What will"
	line "you wear today?"
	done

; RedsHouseMom2FPrizeVendorConfirmPrizeText:
	; text_ram wStringBuffer3
	; text "."
	; line "Is that right?"
	; done

RedsHouseMom2FDecoVendorHereYouGoText:
	text "Enjoy!"
	done

RedsHouseMom2FDecoVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

RedsHouseMom2FDecoVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

RedsHouseMom2FDecoVendorQuitText:
	text "Hmm... I can't"
	line "decide what"
	cont "to wear!"
	done

RedsHouseMom2FDecoVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done
	  

RedsHouseMom2FPCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

RedsMomRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

RedsMomRadioText2:
	text "#MON CHANNEL!"
	done

RedsMomRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

RedsMomRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

RedsHouseMom2FDecoVendor_NotEnoughCoinsScript:
	writetext RedsHouseMom2FDecoVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

; RedsHouseMom2FDecoMonVendor_NoRoomForPrizeScript:
	; writetext RedsHouseMom2FDecoVendorNoMoreRoomText
	; waitbutton
	; closetext
	; end

RedsHouseMom2FDecoVendor_CancelPurchaseScript:
	writetext RedsHouseMom2FDecoVendorQuitText
	waitbutton
	closetext
	end

RedsHouseMom2FDecoVendor_NoCoinCaseScript:
	writetext RedsHouseMom2FDecoVendorNoCoinCaseText
	waitbutton
	closetext
	end

RedsHouseMom2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, REDS_HOUSE_1F, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_UP, RedsHouseMom2FPCScript
	bg_event  2,  1, BGEVENT_READ, RedsHouseMom2FRadioScript
	bg_event  6,  1, BGEVENT_READ, RedsHouseMom2FDecoVendorScript
	bg_event  5,  0, BGEVENT_IFSET, RedsHouseMom2FPosterScript

	def_object_events
	object_event  3,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouseGameConsoleScript, EVENT_REDS_HOUSE_2F_CONSOLE
	object_event  7,  5, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouseDoll1Script, EVENT_REDS_HOUSE_2F_DOLL_1
	object_event  6,  5, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouseDoll2Script, EVENT_REDS_HOUSE_2F_DOLL_2
	object_event 10,  5, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouseBigDollScript, EVENT_REDS_HOUSE_2F_BIG_DOLL
