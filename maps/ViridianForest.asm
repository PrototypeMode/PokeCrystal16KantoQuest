	object_const_def
	 const VIRIDIANFOREST_GHOST
	 const VIRIDIANFOREST_YOUNGSTER1
	; const VIRIDIANFOREST_BLACK_BELT
	; const VIRIDIANFOREST_ROCKER
	; const VIRIDIANFOREST_POKE_BALL1
	; const VIRIDIANFOREST_KURT
	; const VIRIDIANFOREST_LASS
	; const VIRIDIANFOREST_YOUNGSTER2
	; const VIRIDIANFOREST_POKE_BALL2
	; const VIRIDIANFOREST_POKE_BALL3
	; const VIRIDIANFOREST_POKE_BALL4

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks








TrainerBugCatcherRick:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRickAfterBattleText
	waitbutton
	closetext
	end

; ViridianForestLassScript:
	; jumptextfaceplayer Text_ViridianForestLass

 ViridianForestRevive:
	 itemball REVIVE

 ViridianForestXAttack:
	 itemball X_ATTACK

 ViridianForestAntidote:
	 itemball ANTIDOTE

 ViridianForestEther:
	 itemball ETHER

; ViridianForestHiddenEther:
	; hiddenitem ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

; ViridianForestHiddenSuperPotion:
	; hiddenitem SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

; ViridianForestHiddenFullHeal:
	; hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL

 ViridianForestSignpost:
	 jumptext IlexForestSignpostText




BugCatcherRickSeenText:
	text "Don't sneak up on"
	line "me like that!"

	para "You frightened a"
	line "#MON away!"
	done

BugCatcherRickBeatenText:
	text "I hadn't seen that"
	line "#MON before…"
	done

BugCatcherRickAfterBattleText:
	text "A #MON I've"
	line "never seen before"

	para "fell out of the"
	line "tree when I used"
	cont "HEADBUTT."

	para "I ought to use"
	line "HEADBUTT in other"
	cont "places too."
	done
	
GhoatMarowak:


	opentext
	writetext SilphGhostCryText1
	pause 15
	cry MAROWAK
	closetext
	loadwildmon MAROWAK, 5
	loadvar VAR_BATTLETYPE, BATTLETYPE_GHOST
	startbattle
	ifequal LOSE, .NotBeaten1
	;disappear VIRIDIANFOREST_GHOST
	
	
.NotBeaten1:
	reloadmapafterbattle
	opentext
	giveitem SILPH_SCOPE
	waitsfx
	writetext ViridianForestGotSilphScopeText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
;	appear LAKEOFRAGE_LANCE
	end	
	
SilphGhostCryText1:
	text "GHOST: Woooo..."
	done


ViridianForestGotSilphScopeText:
	text "<PLAYER> obtained a"
	line "SILPH SCOPE!"
	done	

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 47, VIRIDIAN_FOREST_SOUTH_GATE, 3
	warp_event 17, 47, VIRIDIAN_FOREST_SOUTH_GATE, 4
	warp_event  1,  0, VIRIDIAN_FOREST_NORTH_GATE, 1
	warp_event  2,  0, VIRIDIAN_FOREST_NORTH_GATE, 2
	; warp_event  1,  0, ROUTE_34_ILEX_FOREST_GATE, 3
	; warp_event 16, 47, ILEX_FOREST_AZALEA_GATE, 1
	; warp_event 17, 47, ILEX_FOREST_AZALEA_GATE, 2

	def_coord_events

	def_bg_events
	; bg_event  3, 17, BGEVENT_READ, ViridianForestSignpost
	; bg_event 11,  7, BGEVENT_ITEM, ViridianForestHiddenEther
	; bg_event 22, 14, BGEVENT_ITEM, ViridianForestHiddenSuperPotion
	; bg_event  1, 17, BGEVENT_ITEM, ViridianForestHiddenFullHeal
	; bg_event  8, 22, BGEVENT_UP, ViridianForestShrineScript

	def_object_events


	object_event 16, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GhoatMarowak, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	 object_event 30,  33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherRick, -1
	 
	; object_event  9, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	; object_event 17,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	; object_event 27,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestEther, EVENT_ILEX_FOREST_ETHER
