	object_const_def
	const BILLSOLDERSISTERSHOUSE_POKEFAN_F
	const BILLSOLDERSISTERSHOUSE_YOUNGSTER

BillsOlderSistersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsOlderSisterScript:
	jumptextfaceplayer BillsOlderSisterText

BillsOlderSistersHouseYoungsterScript:
	jumptextfaceplayer BillsOlderSistersHouseYoungsterText

BillsOlderSisterText:
	text "My grandpa is at "
	line "my brother BILL's"
	cont "on CERULEAN CAPE."
	done

BillsOlderSistersHouseYoungsterText:
	text "I saw these weird,"
	line "slow #MON on"
	cont "CYCLING ROAD."
	done

BillsOlderSistersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 4
	warp_event  3,  7, FUCHSIA_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BillsOlderSisterScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsOlderSistersHouseYoungsterScript, -1