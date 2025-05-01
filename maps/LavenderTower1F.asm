	object_const_def
	const LAVENDERTOWER1F_RECEPTIONIST
	const LAVENDERTOWER1F_OFFICER
	const LAVENDERTOWER1F_SUPER_NERD1
	const LAVENDERTOWER1F_GENTLEMAN
	const LAVENDERTOWER1F_SUPER_NERD2

LavenderTower1F_MapScripts:
	def_scene_scripts
	scene_script TowerGhostCheckScene, SCENE_LAVENDER_TOWER_1F

	def_callbacks

TowerGhostCheckScene:
   checkevent EVENT_CLEARED_LAVENDER_TOWER
   iftrue .GhostStatusFlag
   iffalse .NoGhostStatusFlag
    end


   
.GhostStatusFlag
      callasm .setflag0
      end

.NoGhostStatusFlag
      callasm .setflag1
      end		
	  
.setflag1:
   ld a, 1
   ld [wAlternateBattleByte], a
   ret

.setflag0:
   ld a, 0
   ld [wAlternateBattleByte], a
   ret

LavenderTower1FReceptionistScript:
	jumptextfaceplayer LavenderTower1FReceptionistText

LavenderTower1FOfficerScript:
	jumptextfaceplayer LavenderTower1FOfficerText

LavenderTower1FSuperNerd1Script:
	jumptextfaceplayer LavenderTower1FSuperNerd1Text

LavenderTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavenderTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "EXPN CARD@"

LavenderTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavenderTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavenderTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavenderTower1FDirectory:
	jumptext LavenderTower1FDirectoryText

LavenderTower1FPokeFluteSign:
	jumptext LavenderTower1FPokeFluteSignText

LavenderTower1FReferenceLibrary: ; unreferenced
	jumptext LavenderTower1FReferenceLibraryText

LavenderTower1FReceptionistText:
	text "Welcome!"
	line "Feel free to look"

	para "around anywhere on"
	line "this floor."
	done

LavenderTower1FOfficerText:
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

LavenderTower1FSuperNerd1Text:
	text "Many people are"
	line "hard at work here"

	para "in the RADIO"
	line "TOWER."

	para "They must be doing"
	line "their best to put"
	cont "on good shows."
	done

LavenderTower1FGentlemanText:
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

LavenderTower1FGentlemanText_ReturnedMachinePart:
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

LavenderTower1FGentlemanText_GotExpnCard:
	text "With that thing,"
	line "you can tune into"

	para "the radio programs"
	line "here in KANTO."

	para "Gahahahaha!"
	done

LavenderTower1FSuperNerd2Text:
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

LavenderTower1FSuperNerd2Text_GotExpnCard:
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

LavenderTower1FDirectoryText:
	text "1F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done

LavenderTower1FPokeFluteSignText:
	text "Perk Up #MON"
	line "with Mellow Sounds"

	para "of the # FLUTE"
	line "on CHANNEL 20"
	done

LavenderTower1FReferenceLibraryText:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done

LavenderTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 17, LAVENDER_TOWN, 7
	warp_event 11, 17, LAVENDER_TOWN, 7
	warp_event 18,  9, LAVENDER_TOWER_2F, 1

	def_coord_events
	coord_event  10,  17, SCENE_LAVENDER_TOWER_1F, TowerGhostCheckScene
	coord_event  11,  17, SCENE_LAVENDER_TOWER_1F, TowerGhostCheckScene

	def_bg_events
	bg_event 17, 13, BGEVENT_READ, LavenderTower1FDirectory
	bg_event 16, 13, BGEVENT_READ, LavenderTower1FPokeFluteSign

	def_object_events
	object_event 13,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTower1FReceptionistScript, -1
	object_event 15, 13, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTower1FOfficerScript, -1
	object_event  8, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTower1FSuperNerd1Script, -1
	object_event  6,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTower1FGentlemanScript, -1
	object_event 17,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTower1FSuperNerd2Script, -1
