	object_const_def
	const VIRIDIANFORESTSOUTHGATE_OFFICER

ViridianForestSouthGate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestSouthGate_OfficerScript:
	jumptextfaceplayer ViridianForestSouthGate_OfficerText

ViridianForestSouthGate_OfficerText:
	text "VIRIDIAN FOREST is"
	line "like a maze"
	cont "inside."

	para "Be careful. Don't"
	line "get lost in there."
	done
	
ViridianForestSouthGate_BugCatcherScript:
	jumptextfaceplayer ViridianForestSouthGate_BugCatcherText	

ViridianForestSouthGate_BugCatcherText:
	text "You have to roam"
	line "far to get new"
	cont "kinds of #MON."

	para "Look for other"
	line "types outside of"
	cont "VIRIDIAN FOREST."
	done

ViridianForestSouthGate_LassScript:
	jumptextfaceplayer ViridianForestSouthGate_LassText	

ViridianForestSouthGate_LassText:
	text "VIRIDIAN FOREST is"
	line "scary at night!"

	para "But I hear that"
	line "different kinds"
	cont "of #MON come"
	cont "out at night!"
	done

ViridianForestSouthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_2, 7
	warp_event  5,  7, ROUTE_2, 7
		
	warp_event  4,  0, VIRIDIAN_FOREST, 1
	warp_event  5,  0, VIRIDIAN_FOREST, 2
	; warp_event  5,  7, ROUTE_2, 6
	; warp_event  4,  7, ROUTE_2, 6
	; warp_event  5,  0, ROUTE_2, 7

	; warp_event  0,  4, ECRUTEAK_CITY, 1
	; warp_event  0,  5, ECRUTEAK_CITY, 2
	; warp_event  9,  4, ROUTE_42, 1
	; warp_event  9,  5, ROUTE_42, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestSouthGate_OfficerScript, -1
	object_event  3,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianForestSouthGate_BugCatcherScript, -1
	object_event  7,  3, SPRITE_KANTO_LASS_2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ViridianForestSouthGate_LassScript, -1
