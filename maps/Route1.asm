	object_const_def
;	const ROUTE1_YOUNGSTER
;	const ROUTE1_COOLTRAINER_F
	const ROUTE1_FRUIT_TREE
	const ROUTE1_MARTGUY
	const ROUTE1_LEDGESGUY

Route1_MapScripts:
	def_scene_scripts

	def_callbacks

; TrainerSchoolboyDanny:
	; trainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, .Script

; .Script:
	; endifjustbattled
	; opentext
	; writetext SchoolboyDannyAfterBattleText
	; waitbutton
	; closetext
	; end

; TrainerCooltrainerfQuinn:
	; trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

; .Script:
	; endifjustbattled
	; opentext
	; writetext CooltrainerfQuinnAfterBattleText
	; waitbutton
	; closetext
	; end

PokemartGuy0:
    faceplayer
    opentext	
	checkevent EVENT_MART_GUY
	iffalse PokemartGuy1
	iftrue PokemartGuy2
	end
	
PokemartGuy1:
	writetext PokemartGuyText
	waitbutton
	closetext
	opentext
	verbosegiveitem POTION
	closetext
	setevent EVENT_MART_GUY
	end
	
PokemartGuy2:
	writetext PokemartGuy2Text
    waitbutton
	closetext
	end
	
LedgesGuy:
   opentext	
	writetext LedgesGuyText
    waitbutton
	closetext
	end
	
Route1Sign:
	jumptext Route1SignText

Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1

PokemartGuyText:
    text "Hi! I work at"
	line "the VIRIDIAN"
	cont "#MART!"
	
	para "It's a convenient"
    line "shop for all"
	cont "#MON Trainers!"
	cont "so please come"
	cont "visit us in"
	cont "VIRIDIAN CITY."
	
	para "I know, I'll give"
	line "you a sample!"
	cont "Here you go!"
	done

PokemartGuy2Text:
    text "We also carry"
	line "# BALLs for"
	cont "catching #MON!"
	done
	
LedgesGuyText:	
	text "See those ledges"
	line "along the road?"
	
	para "It's a bit scary,"
	line "but you can jump"
	cont "over them."
	
	para "You can get back"
	line "to PALLET TOWN"
	cont "quicker that way."
	done
	
; SchoolboyDannySeenText:
	; text "If trainers meet,"
	; line "the first thing to"
	; cont "do is battle."
	; done

; SchoolboyDannyBeatenText:
	; text "Awww… I've got a"
	; line "losing record…"
	; done

; SchoolboyDannyAfterBattleText:
	; text "For trainers, it's"
	; line "a given that we'll"

	; para "battle whenever we"
	; line "meet."
	; done

; CooltrainerfQuinnSeenText:
	; text "You there!"
	; line "Want to battle?"
	; done

; CooltrainerfQuinnBeatenText:
	; text "Down and out…"
	; done

; CooltrainerfQuinnAfterBattleText:
	; text "You're strong."

	; para "You obviously must"
	; line "have trained hard."
	; done

Route1SignText:
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  7, 27, BGEVENT_READ, Route1Sign

	def_object_events

;	object_event  3,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
;	object_event 12,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event  3,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
	object_event  13, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, LedgesGuy, -1
	object_event  3, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PokemartGuy0, -1