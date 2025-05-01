	object_const_def
	const VIRIDIANMART_CLERK
	const VIRIDIANMART_LASS
	const VIRIDIANMART_COOLTRAINER_M

ViridianMart_MapScripts:
	def_scene_scripts
	scene_script ViridianMartNoop1Scene,  SCENE_VIRIDIAN_MART_NOOP1
	scene_script ViridianMartNoop2Scene, SCENE_VIRIDIAN_MART_NOOP2
	
	def_callbacks

ViridianMartNoop1Scene:
    callasm StopInput1
    checkflag ENGINE_POKEDEX
	iffalse ViridianMartOaksParcel
    end

ViridianMartNoop2Scene:
	end

StopInput1:
	xor a
;	ldh [hJoyPressed], a ; pressed this frame
;	ldh [hJoyReleased], a ; released this frame
	ldh [hJoyDown], a ; currently pressed
    ret	
	
ViridianMartOaksParcel:
 	setscene SCENE_VIRIDIAN_MART_NOOP2
    showemote EMOTE_SHOCK, VIRIDIANMART_CLERK, 15
    opentext
	writetext ClerkParcelText1
	promptbutton
	closetext
	applymovement PLAYER, PlayerMovement
	opentext
	writetext ClerkParcelText2
	promptbutton
	closetext
	opentext
	verbosegiveitem OAKS_PARCEL
	closetext
	clearevent EVENT_MART_BALL
	end
	
; .SetRivalOaksLab	
    ; readmem wPlayerCostume
    ; ifequal 3, .Gary
    ; clearevent EVENT_RIVAL_GARY_IN_OAKS_LAB
	; setevent EVENT_RIVAL_ASH_IN_OAKS_LAB
    ; end

; .Gary
    ; clearevent EVENT_RIVAL_ASH_IN_OAKS_LAB
	; setevent   EVENT_RIVAL_GARY_IN_OAKS_LAB
    ; end	
	
ViridianMartClerkScript:	
	checkflag ENGINE_POKEDEX
	iffalse ViridianMartClerkHiScript
    iftrue ViridianMartClerkShopScript 
    end
	
ViridianMartClerkShopScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIRIDIAN
	closetext
	end
	
ViridianMartClerkHiScript:
	opentext
	writetext ClerkParcelText3
	promptbutton
	closetext
	end	

ViridianMartLassScript:
	jumptextfaceplayer ViridianMartLassText

ViridianMartCooltrainerMScript:
	jumptextfaceplayer ViridianMartCooltrainerMText

ViridianMartLassText:
	text "The GYM LEADER"
	line "here is totally"
	cont "cool."
	done

ViridianMartCooltrainerMText:
	text "Have you been to"
	line "CINNABAR?"

	para "It's an island way"
	line "south of here."
	done
	
ClerkParcelText1:
	text "Hey! You came from"
	line "PALLET TOWN?"
	done

ClerkParcelText2:	
	text "PROF.OAK called"
	line "called ahead!"
	
	para "You're here to"
	line "pick up his"
	cont "PARCEL, right?"
	done
	
ClerkParcelText3:
	text "Okay! Say hi to"
	line "PROF.OAK for me!"
	done	

PlayerMovement:
    step UP	
    step UP	
    step UP	
    step UP
    turn_head LEFT	
    step_end	

ViridianMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 4
	warp_event  3,  7, VIRIDIAN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartClerkScript, -1
	object_event  7,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartLassScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartCooltrainerMScript, -1
