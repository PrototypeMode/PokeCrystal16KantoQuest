	object_const_def
	const LAVENDERTOWER7F_RECEPTIONIST
	const LAVENDERTOWER7F_OFFICER
	const LAVENDERTOWER7F_SUPER_NERD1
	const LAVENDERTOWER7F_GENTLEMAN
	const LAVENDERTOWER7F_SUPER_NERD2

LavenderTower7F_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderTower7FReceptionistScript:
	jumptextfaceplayer LavenderTower7FReceptionistText

LavenderTower7FOfficerScript:
	jumptextfaceplayer LavenderTower7FOfficerText

LavenderTower7FSuperNerd1Script:
	jumptextfaceplayer LavenderTower7FSuperNerd1Text

LavenderTower7FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderTower7FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderTower7FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavenderTower7FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "EXPN CARD@"

LavenderTower7FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavenderTower7FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavenderTower7FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavenderTower7FDirectory:
	jumptext LavenderTower7FDirectoryText

LavenderTower7FPokeFluteSign:
	jumptext LavenderTower7FPokeFluteSignText

LavenderTower7FReferenceLibrary: ; unreferenced
	jumptext LavenderTower7FReferenceLibraryText

LavenderTower7FReceptionistText:
	text "Welcome!"
	line "Feel free to look"

	para "around anywhere on"
	line "this floor."
	done

LavenderTower7FOfficerText:
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

LavenderTower7FSuperNerd1Text:
	text "Many people are"
	line "hard at work here"

	para "in the RADIO"
	line "TOWER."

	para "They must be doing"
	line "their best to put"
	cont "on good shows."
	done

LavenderTower7FGentlemanText:
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

LavenderTower7FGentlemanText_ReturnedMachinePart:
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

LavenderTower7FGentlemanText_GotExpnCard:
	text "With that thing,"
	line "you can tune into"

	para "the radio programs"
	line "here in KANTO."

	para "Gahahahaha!"
	done

LavenderTower7FSuperNerd2Text:
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

LavenderTower7FSuperNerd2Text_GotExpnCard:
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

LavenderTower7FDirectoryText:
	text "7F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done

LavenderTower7FPokeFluteSignText:
	text "Perk Up #MON"
	line "with Mellow Sounds"

	para "of the # FLUTE"
	line "on CHANNEL 20"
	done

LavenderTower7FReferenceLibraryText:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done

LavenderTower7F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 16, LAVENDER_TOWER_6F, 2
	warp_event 11,  1, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event 17, 13, BGEVENT_READ, LavenderTower7FDirectory
	bg_event 16, 13, BGEVENT_READ, LavenderTower7FPokeFluteSign

	def_object_events
	object_event 13,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTower7FReceptionistScript, -1
	object_event 15, 13, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTower7FOfficerScript, -1
	object_event  8, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTower7FSuperNerd1Script, -1
	object_event  6,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTower7FGentlemanScript, -1
	object_event 17,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTower7FSuperNerd2Script, -1
