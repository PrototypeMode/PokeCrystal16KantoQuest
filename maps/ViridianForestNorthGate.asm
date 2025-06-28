	object_const_def
	const VIRIDIANFORESTNORTHGATE_GATEGUY
	const VIRIDIANFORESTNORTHGATE_OLD_GUY
	const VIRIDIANFORESTNORTHGATE_YOUNG_GUY

ViridianForestNorthGate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestNorthGate_OfficerScript:
	jumptextfaceplayer ViridianForestNorthGate_OfficerText	

ViridianForestNorthGate_OldGuyScript:
	jumptextfaceplayer ViridianForestNorthGate_OldGuyText
	
ViridianForestNorthGate_YoungGuyScript:
	jumptextfaceplayer ViridianForestNorthGate_YoungGuyText
	
ViridianForestNorthGate_OfficerText:
	text "This gate connects"
	line "VIRIDIAN FOREST"
	cont "to PEWTER CITY!"
	done

ViridianForestNorthGate_OldGuyText:
	text "Have you noticed"
	line "the bushes on the"
	cont "roadside?"

	para "They can be cut"
	line "down by a special"
	cont "#MON move."
	done
	
ViridianForestNorthGate_YoungGuyText:
	text "Many #MON live"
	line "only in forests"
	cont "and caves."

	para "Other #MON"
	line "prefer cities,"
	cont "rivers, and"
	cont "mountains!"
	
	para "You need to look"
	line "everywhere to get"
	cont "different kinds!"
	done	

ViridianForestNorthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, VIRIDIAN_FOREST, 3
	warp_event  5,  7, VIRIDIAN_FOREST, 4
		
	warp_event  4,  0, ROUTE_2, 6
	warp_event  5,  0, ROUTE_2, 6
	; warp_event  0,  4, ECRUTEAK_CITY, 1
	; warp_event  0,  5, ECRUTEAK_CITY, 2
	; warp_event  9,  4, ROUTE_42, 1
	; warp_event  9,  5, ROUTE_42, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestNorthGate_OfficerScript, -1
	object_event  6,  5, SPRITE_KANTO_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianForestNorthGate_OldGuyScript, -1
	object_event  3,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestNorthGate_YoungGuyScript, -1

