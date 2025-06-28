	object_const_def
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianPokecenter1F_NurseScript:

	jumpstd PokecenterNurseScript

ViridianPokecenter1F_CooltrainerMScript:
    setflag ENGINE_BRUNO_J
    setflag ENGINE_ZEPHYRBADGE
	faceplayer
	opentext

	writetext ViridianPokecenter1F_CooltrainerMText
	waitbutton
	closetext
	end


ViridianPokecenter1F_GentlemanScript:

	jumptextfaceplayer ViridianPokecenter1F_GentlemanText

ViridianPokecenter1F_BugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1F_BugCatcherText

ViridianPokecenter1F_CooltrainerMText:
	text "#MON CENTERs"
	line "heal your tired,"
	cont "hurt, or fainted"
	cont "#MON!"
	
	para "There's a #MON"
	line "CENTER in every"
	cont "town ahead!"

	para "They'll heal your"
	line "whole party for"
	cont "just ¥200!"
	done

; ViridianPokecenter1FCooltrainerMText_BlueReturned:
	; text "There are no GYM"
	; line "TRAINERS at the"
	; cont "VIRIDIAN GYM."

	; para "The LEADER claims"
	; line "his policy is to"

	; para "win without having"
	; line "any underlings."
	; done

ViridianPokecenter1F_GentlemanText:
	text "You can use that"
	line "PC in the corner."

	para "NURSE JOY told"
	line "me! So kind!"
	done

ViridianPokecenter1F_BugCatcherText:
	text "My dream is to be-"
	line "come a GYM LEADER."
	done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIRIDIAN_CITY, 5
	warp_event  4,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1F_NurseScript, -1
	object_event  5,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1F_CooltrainerMScript, -1
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1F_GentlemanScript, -1
	object_event  0,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1F_BugCatcherScript, -1
