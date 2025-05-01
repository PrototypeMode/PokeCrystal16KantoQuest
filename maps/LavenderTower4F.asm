	object_const_def
	const LAVENDERTOWER4F_RECEPTIONIST
	const LAVENDERTOWER4F_OFFICER
	const LAVENDERTOWER4F_SUPER_NERD1
	const LAVENDERTOWER4F_GENTLEMAN
	const LAVENDERTOWER4F_SUPER_NERD2

LavenderTower4F_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderTower4FReceptionistScript:
	jumptextfaceplayer LavenderTower4FReceptionistText

LavenderTower4FOfficerScript:
	jumptextfaceplayer LavenderTower4FOfficerText

LavenderTower4FSuperNerd1Script:
	jumptextfaceplayer LavenderTower4FSuperNerd1Text

LavenderTower4FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderTower4FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderTower4FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavenderTower4FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "EXPN CARD@"

LavenderTower4FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavenderTower4FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavenderTower4FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavenderTower4FDirectory:
	jumptext LavenderTower4FDirectoryText

LavenderTower4FPokeFluteSign:
	jumptext LavenderTower4FPokeFluteSignText

LavenderTower4FReferenceLibrary: ; unreferenced
	jumptext LavenderTower4FReferenceLibraryText

LavenderTower4FReceptionistText:
	text "Welcome!"
	line "Feel free to look"

	para "around anywhere on"
	line "this floor."
	done

LavenderTower4FOfficerText:
	text "Sorry, but you can"
	line "only tour the"
	cont "ground floor."

	para "Ever since JOHTO's"
	line "RADIO TOWER was"

	para "taken over by a"
	line "criminal gang, we"

	para "have had to step"
	line "up our security."
	done

LavenderTower4FSuperNerd1Text:
	text "Many people are"
	line "hard at work here"

	para "in the RADIO"
	line "TOWER."

	para "They must be doing"
	line "their best to put"
	cont "on good shows."
	done

LavenderTower4FGentlemanText:
	text "Oh, no, no, no!"

	para "We've been off the"
	line "air ever since the"

	para "POWER PLANT shut"
	line "down."

	para "All my efforts to"
	line "start this station"

	para "would be wasted if"
	line "I can't broadcast."

	para "I'll be ruined!"
	done

LavenderTower4FGentlemanText_ReturnedMachinePart:
	text "Ah! So you're the"
	line "<PLAY_G> who solved"

	para "the POWER PLANT's"
	line "problem?"

	para "Thanks to you, I"
	line "never lost my job."

	para "I tell you, you're"
	line "a real lifesaver!"

	para "Please take this"
	line "as my thanks."
	done

LavenderTower4FGentlemanText_GotExpnCard:
	text "With that thing,"
	line "you can tune into"

	para "the radio programs"
	line "here in KANTO."

	para "Gahahahaha!"
	done

LavenderTower4FSuperNerd2Text:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "Huh? Your #GEAR"
	line "can't tune into my"

	para "music programs."
	line "How unfortunate!"

	para "If you get an EXPN"
	line "CARD upgrade, you"

	para "can tune in. You'd"
	line "better get one!"
	done

LavenderTower4FSuperNerd2Text_GotExpnCard:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "I'm responsible"
	line "for the gorgeous"

	para "melodies that go"
	line "out over the air."

	para "Don't be square."
	line "Grab your music"
	cont "off the air!"
	done

LavenderTower4FDirectoryText:
	text "4F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done

LavenderTower4FPokeFluteSignText:
	text "Perk Up #MON"
	line "with Mellow Sounds"

	para "of the # FLUTE"
	line "on CHANNEL 20"
	done

LavenderTower4FReferenceLibraryText:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done

LavenderTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  9, LAVENDER_TOWER_3F, 2
	warp_event  3,  9, LAVENDER_TOWER_5F, 1

	def_coord_events

	def_bg_events
	bg_event 17, 13, BGEVENT_READ, LavenderTower4FDirectory
	bg_event 16, 13, BGEVENT_READ, LavenderTower4FPokeFluteSign

	def_object_events
	object_event 13,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTower4FReceptionistScript, -1
	object_event 15, 13, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTower4FOfficerScript, -1
	object_event  8, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTower4FSuperNerd1Script, -1
	object_event  6,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTower4FGentlemanScript, -1
	object_event 17,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTower4FSuperNerd2Script, -1
