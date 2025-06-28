	object_const_def
	const PewterMuseum2F_KANTO_GRAMPS
	const PewterMuseum2F_GRAMPS
	const PewterMuseum2F_YOUNGSTER
	const PewterMuseum2F_BURLY
	const PewterMuseum2F_DAUGHTER
	const PewterMuseum2F_SCIENTIST

PewterMuseum2F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum2F_KantoGrampsScript:
	jumptextfaceplayer PewterMuseum2F_KantoGrampsText

PewterMuseum2F_GrampsScript:
	jumptextfaceplayer PewterMuseum2F_GrampsText

PewterMuseum2F_MoonStoneKidScript:
	jumptextfaceplayer PewterMuseum2F_MoonStoneKidText
	
NPCTradeJulio:

    special SetTradeNPCGenderBoy

    faceplayer 
    opentext
	writetext PewterMuseum2F_BurlyDadText
	promptbutton
    
	trade NPC_TRADE_JULIO
	waitbutton
	closetext
	end


PewterMuseum2F_BurlyDadText:
    text "My daughter really"
    line "wants a PIKACHU!"
    
	para "How am I meant to"
	line "find one in a town"
	cont "built of stone?"
	done

PewterMuseum2F_DaughterScript:
	jumptextfaceplayer PewterMuseum2F_DaughterText
	
PewterMuseum2F_DaughterText:	
	text "I want a PIKACHU!"
	line "It's so cute!"
	
	para "I asked my daddy"
	line "to catch me one!"
	done
	
PewterMuseum2F_KantoGrampsText:
	text "July 20, 1969!"

	para "The first lunar"
	line "landing!"

	para "I bought a colour"
	line "TV, just to watch"
	cont "it!"
	done
	
PewterMuseum2F_GrampsText:
	text "Bah! Everybody"
	line "knows that the"
    cont "MOON LANDING"
	cont "was faked!"
	
	para "They did it to"
	line "scare the locals"
	cont "into stopping the"
	cont "war!"
	done	

PewterMuseum2F_MoonStoneKidText:
	text "If these really"
	line "are rare items"
	cont "from the MOON,"
	cont "how come you"
	cont "can just buy"
	cont "them from the"
	cont "CELADON Dept."
	cont "Store?"
	done

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  7, PEWTER_MUSEUM_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	; object_event  6,  0, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FClerkScript, -1
	; object_event  8,  0, SPRITE_DRAGON, SPRITEMOVEDATA_STILL, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FYoungsterScript, -1
	object_event 14,  2, SPRITE_KANTO_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_KantoGrampsScript, -1
	object_event 16,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_GrampsScript, -1
	object_event  3,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_MoonStoneKidScript, -1
	object_event 18,  5, SPRITE_BURLY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NPCTradeJulio, -1
	object_event 17,  5, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_DaughterScript, -1
	object_event 11,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_DaughterScript, -1
