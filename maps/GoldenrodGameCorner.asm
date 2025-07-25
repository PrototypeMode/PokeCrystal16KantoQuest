DEF GOLDENRODGAMECORNER_TM25_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_TM14_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_TM38_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_ABRA_COINS      EQU 100
DEF GOLDENRODGAMECORNER_CUBONE_COINS    EQU 800
DEF GOLDENRODGAMECORNER_WOBBUFFET_COINS EQU 1500
DEF GOLDENRODGAMECORNER_CARPET1_COINS      EQU 1
DEF GOLDENRODGAMECORNER_CARPET2_COINS      EQU 2
DEF GOLDENRODGAMECORNER_CARPET3_COINS      EQU 3
DEF GOLDENRODGAMECORNER_CARPET4_COINS      EQU 4
DEF GOLDENRODGAMECORNER_FAMICOM_COINS      EQU 5
DEF GOLDENRODGAMECORNER_SNES_COINS         EQU 6

	object_const_def
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_RECEPTIONIST3
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_MOVETUTOR

GoldenrodGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, GoldenrodGameCornerMoveTutorCallback

GoldenrodGameCornerMoveTutorCallback:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .finish
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .move_tutor_outside
	ifequal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear GOLDENRODGAMECORNER_MOVETUTOR
	endcallback

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear GOLDENRODGAMECORNER_MOVETUTOR
.finish
	endcallback

MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_MOVETUTOR, RIGHT
	end

GoldenrodGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

GoldenrodGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Thunder
	ifequal 2, .Blizzard
	ifequal 3, .FireBlast
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins GOLDENRODGAMECORNER_TM25_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM25_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.Blizzard:
	checkcoins GOLDENRODGAMECORNER_TM14_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM14_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.FireBlast:
	checkcoins GOLDENRODGAMECORNER_TM38_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM38_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

GoldenrodGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "CANCEL@"
	
	
GoldenrodGameCornerDecoVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerDecoVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCornerDecoVendorWhichDecoText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Carpet1
	ifequal 2, .Carpet2
	ifequal 3, .Carpet3
;	ifequal 4, .Carpet4
; ifequal 5, .Famicom
;	ifequal 6, .SNES
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

 .Carpet1:
 	 checkcoins GOLDENRODGAMECORNER_CARPET1_COINS
	 ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	 checkevent EVENT_DECO_CARPET_1
	 iftrue .AlreadyHaveDecoItem
	 setevent EVENT_DECO_CARPET_1
	 takecoins GOLDENRODGAMECORNER_CARPET1_COINS
	  waitsfx
	 playsound SFX_TRANSACTION
	  writetext GoldenrodGameCornerDecoVendorHereYouGoText
	  waitbutton
	  sjump .loop
	  
 .Carpet2:
 	 checkcoins GOLDENRODGAMECORNER_CARPET2_COINS
	 ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	 checkevent EVENT_DECO_CARPET_2
	 iftrue .AlreadyHaveDecoItem
	 setevent EVENT_DECO_CARPET_2
	 takecoins GOLDENRODGAMECORNER_CARPET2_COINS
	  waitsfx
	 playsound SFX_TRANSACTION
	  writetext GoldenrodGameCornerDecoVendorHereYouGoText
	  waitbutton
	  sjump .loop	  

 .Carpet3:
 	 checkcoins GOLDENRODGAMECORNER_CARPET3_COINS
	 ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	 checkevent EVENT_DECO_CARPET_3
	 iftrue .AlreadyHaveDecoItem
	 setevent EVENT_DECO_CARPET_3
	 takecoins GOLDENRODGAMECORNER_CARPET3_COINS
	  waitsfx
	 playsound SFX_TRANSACTION
	  writetext GoldenrodGameCornerDecoVendorHereYouGoText
	  waitbutton
	  sjump .loop
	  
; .Carpet4:
 	 ; checkcoins GOLDENRODGAMECORNER_CARPET4_COINS
	 ; ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_CARPET_4
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_CARPET_4
	 ; takecoins GOLDENRODGAMECORNER_CARPET4_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext GoldenrodGameCornerDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop	  
	  
 ; .Famicom:
 	 ; checkcoins GOLDENRODGAMECORNER_FAMICOM_COINS
	 ; ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_FAMICOM
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_FAMICOM
	 ; takecoins GOLDENRODGAMECORNER_FAMICOM_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext GoldenrodGameCornerDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop

 ; .SNES:
 	 ; checkcoins GOLDENRODGAMECORNER_SNES_COINS
	 ; ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	 ; checkevent EVENT_DECO_SNES
	 ; iftrue .AlreadyHaveDecoItem
	 ; setevent EVENT_DECO_SNES
	 ; takecoins GOLDENRODGAMECORNER_SNES_COINS
	  ; waitsfx
	 ; playsound SFX_TRANSACTION
	  ; writetext GoldenrodGameCornerDecoVendorHereYouGoText
	  ; waitbutton
	  ; sjump .loop	  
	  
; .Carpet1:
	; checkcoins GOLDENRODGAMECORNER_CARPET1_COINS
	; ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	; readvar VAR_PARTYCOUNT
	; ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	; getmonname STRING_BUFFER_3, KANGASKHAN
	; scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	; iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	; waitsfx
	; playsound SFX_TRANSACTION
	; writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	; waitbutton
	; setval KANGASKHAN
	; special GameCornerPrizeMonCheckDex
	; givepoke KANGASKHAN, 5
	; takecoins GOLDENRODGAMECORNER_CARPET1_COINS
	; sjump .loop

; .Carpet2:
	; checkcoins GOLDENRODGAMECORNER_CARPET2_COINS
	; ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	; readvar VAR_PARTYCOUNT
	; ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	; getmonname STRING_BUFFER_3, CUBONE
	; scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	; iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	; waitsfx
	; playsound SFX_TRANSACTION
	; writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	; waitbutton
	; setval CUBONE
	; special GameCornerPrizeMonCheckDex
	; givepoke CUBONE, 15
	; takecoins GOLDENRODGAMECORNER_CARPET2_COINS
	; sjump .loop

; .Carpet3:
	; checkcoins GOLDENRODGAMECORNER_CARPET3_COINS
	; ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	; readvar VAR_PARTYCOUNT
	; ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	; getmonname STRING_BUFFER_3, WOBBUFFET
	; scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	; iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	; waitsfx
	; playsound SFX_TRANSACTION
	; writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	; waitbutton
	; setval WOBBUFFET
	; special GameCornerPrizeMonCheckDex
	; givepoke WOBBUFFET, 15
	; takecoins GOLDENRODGAMECORNER_CARPET3_COINS
	; sjump .loop
	

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "CARPET1   1@"
	db "CARPET2   2@"
	db "CARPET3   3@"
;	db "CARPET4   4@"
;	db "NES       5@"
;	db "Super NES 6@"
	db "CANCEL@"


.AlreadyHaveDecoItem
	writetext GoldenrodGameCornerDecoVendor_AlreadyHaveDecoText
	waitbutton
	 sjump .loop
	 end
	 
	GoldenrodGameCornerDecoVendor_AlreadyHaveDecoText:
	text "You already have"
	line "this decoration!"
	done

GoldenrodGameCornerDecoVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "cool decorations!"
	done

GoldenrodGameCornerDecoVendorWhichDecoText:
	text "Which decoration"
	line "would you like?"
	done

; GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	; text_ram wStringBuffer3
	; text "."
	; line "Is that right?"
	; done

GoldenrodGameCornerDecoVendorHereYouGoText:
	text "Enjoy!"
	done

GoldenrodGameCornerDecoVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerDecoVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCornerDecoVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerDecoVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done
	





GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Abra
	ifequal 2, .Cubone
	ifequal 3, .Wobbuffet
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Abra:
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, KANGASKHAN
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval KANGASKHAN
	special GameCornerPrizeMonCheckDex
	givepoke KANGASKHAN, 5
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .loop

.Cubone:
	checkcoins GOLDENRODGAMECORNER_CARPET2_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, KANGASKHAN
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval KANGASKHAN
	special GameCornerPrizeMonCheckDex
	givepoke KANGASKHAN, 20
	takecoins GOLDENRODGAMECORNER_CARPET2_COINS
	sjump .loop

.Wobbuffet:
	checkcoins GOLDENRODGAMECORNER_WOBBUFFET_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, WOBBUFFET
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval WOBBUFFET
	special GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15
	takecoins GOLDENRODGAMECORNER_WOBBUFFET_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "KANGASKHAN   100@"
	db "CUBONE      800@"
	db "WOBBUFFET  1500@"
	db "CANCEL@"


GoldenrodGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanFText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

GoldenrodGameCornerCooltrainerFScript:
	jumptextfaceplayer GoldenrodGameCornerCooltrainerFText

GoldenrodGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerGentlemanText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerPokefanM2Text

GoldenrodGameCornerLeftTheirDrinkScript:
	jumptext GoldenrodGameCornerLeftTheirDrinkText

GoldenrodGameCornerSlotsMachineScript:
	random 6
	ifequal 0, GoldenrodGameCornerLuckySlotsMachineScript
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerLuckySlotsMachineScript:
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end

GoldenrodGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GoldenrodGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GoldenrodGameCornerPharmacistText:
if DEF(_CRYSTAL_AU)
	text "This machine looks"
	line "the same as the"
	cont "others."
	done
else
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done
endc

GoldenrodGameCornerPokefanM1Text:
if DEF(_CRYSTAL_AU)
	text "These machines"
	line "seem different"

	para "from the ones at"
	line "CELADON CITY!"
	done
else
	text "I just love this"
	line "new slot machine."

	para "It's more of a"
	line "challenge than the"
	cont "ones in CELADON."
	done
endc

GoldenrodGameCornerCooltrainerMText:
if DEF(_CRYSTAL_AU)
	text "Nothing is certain"
	line "in this area."
	done
else
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done
endc

GoldenrodGameCornerPokefanFText:
	text "Card flip…"

if DEF(_CRYSTAL_AU)
	para "Different from the"
	line "other machines."
	done
else
	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done
endc

GoldenrodGameCornerCooltrainerFText:
	text "I won't quit until"
	line "I win!"
	done

GoldenrodGameCornerGentlemanText:
	text "I taught BLIZZARD"
	line "to my #MON."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

GoldenrodGameCornerPokefanM2Text:
if DEF(_CRYSTAL_AU)
	text "COIN CASE? I threw"
	line "it away in the"
	cont "UNDERGROUND."
	done
else
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I got so furious,"
	line "I tossed out my"

	para "COIN CASE in the"
	line "UNDERGROUND."
	done
endc

MoveTutorInsideText:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

GoldenrodGameCornerLeftTheirDrinkText:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

GoldenrodGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, GOLDENROD_CITY, 10
	warp_event  3, 13, GOLDENROD_CITY, 10

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, GoldenrodGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 12,  1, BGEVENT_LEFT, GoldenrodGameCornerLeftTheirDrinkScript

	def_object_events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCoinVendorScript, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerTMVendorScript, -1
	object_event 17,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	object_event 18,  2, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerDecoVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM2Script, -1
	object_event 17, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
