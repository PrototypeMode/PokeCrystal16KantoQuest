	object_const_def
	const VIRIDIANFORESTNORTHGATE_OFFICER

ViridianForestNorthGate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestNorthGateOfficerScript:
	jumptextfaceplayer ViridianForestNorthGateOfficerText

ViridianForestNorthGateOfficerText:
	text "VIRIDIAN FOREST is"
	line "like a maze"
	cont "inside."

	para "Be careful. Don't"
	line "get lost in there."
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
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestNorthGateOfficerScript, -1
