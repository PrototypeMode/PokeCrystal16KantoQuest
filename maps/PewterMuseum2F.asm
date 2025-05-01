	object_const_def
	const PewterMuseum2F_CLERK
	const PewterMuseum2F_YOUNGSTER
	const PewterMuseum2F_SUPER_NERD

PewterMuseum2F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum2FClerkScript:
	end

PewterMuseum2FSuperNerdScript:
	jumptextfaceplayer PewterMuseum2FSuperNerdText

PewterMuseum2FFossilGuyScript:
	jumptextfaceplayer PewterMuseum2FFossilGuyText

PewterMuseum2FSuperNerdText:
	text "Hi! Check out my"
	line "GYARADOS!"

	para "I raised it from a"
	line "MAGIKARP. I can't"

	para "believe how strong"
	line "it has become."
	done

PewterMuseum2FFossilGuyText:
	text "That is one"
	line "magnificent"
	cont "fossil!"

	para "I wonder what"
	line "#MON it is?"

	para "Or rather,"
	line "what #MON" 
	cont "it was..."
	done

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	; object_event  6,  0, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FClerkScript, -1
	; object_event  8,  0, SPRITE_DRAGON, SPRITEMOVEDATA_STILL, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FYoungsterScript, -1
	object_event 11,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FFossilGuyScript, -1
	object_event 11,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FSuperNerdScript, -1
	object_event 11,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FSuperNerdScript, -1
