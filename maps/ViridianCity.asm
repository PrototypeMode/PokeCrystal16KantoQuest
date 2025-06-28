	object_const_def
	const VIRIDIANCITY_GAMBLER_ASLEEP
	const VIRIDIANCITY_GAMBLER
	const VIRIDIANCITY_LASS
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER
	const VIRIDIANCITY_BUG_GUY
	const VIRIDIANCITY_BALL_GUY

ViridianCity_MapScripts:

	def_scene_scripts
	scene_script ViridianCityZeroScene, SCENE_VIRIDIAN_CITY
	scene_script ViridianCityOneScene, SCENE_VIRIDIAN_CITY_1

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlypointCallback

ViridianCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityZeroScene:
     checkflag ENGINE_POKEDEX
	      iffalse .Disappear
	      iftrue .Disappear2
	
	end
		  
.Disappear
   disappear VIRIDIANCITY_GAMBLER
	 end
.Disappear2
    setscene 1
    end

ViridianCityOneScene:
   disappear VIRIDIANCITY_GAMBLER_ASLEEP	  
	end
	

ViridianCityNoCoffeeGramps:
     faceplayer
     checkflag ENGINE_POKEDEX
     iffalse .OldDudeNoCoffee
     iftrue ViridianCityCoffeeGramps
	 end
	 
.OldDudeNoCoffee	 
	 opentext
	writetext ViridianCityOldDudeText
	 waitbutton
	 closetext
	 applymovement PLAYER, AwayFromOldDude_Movement
	 end
	 
ViridianCityCoffeeGramps:
    faceplayer
    ; checkevent EVENT_OLD_DUDE_GOT_COFFEE
	; iffalse .AskQuestion
	; iftrue .CatchTutorial

.AskQuestion	
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsIntroText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	
.CatchTutorial
    loadwildmon WEEDLE, 5
	catchtutorial BATTLETYPE_TUTORIAL
    end
.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end
	
ViridianCityCoffeeLass:	
	checkevent EVENT_OLD_DUDE_GOT_COFFEE
	iftrue ViridianCityCoffeeLass2
	faceplayer
	opentext
	writetext ViridianCityCoffeeLassText
	waitbutton
	closetext
	end

ViridianCityCoffeeLass2:	
	faceplayer
	opentext
	writetext ViridianCityCoffeeLassText2
	waitbutton
	closetext	
	end
	
ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText
	
ViridianCityBugGuyScript:
	faceplayer
	opentext
	writetext ViridianCityBugGuyText
    promptbutton
	yesorno
	iftrue .BugDesc
	iffalse .NoBugDesc
	end
	
.BugDesc	
	writetext ViridianCityBugGuyText2
	promptbutton
	closetext
	end
	
.NoBugDesc	
	writetext ViridianCityBugGuyText3
	promptbutton
	closetext
	end	
	
ViridianCityBallGuy0Script:
	readmem wPartyCount
	ifequal 1, ViridianCity1BallGuyScript
	ifgreater 1, ViridianCity2BallGuyScript	
	end
	
ViridianCity1BallGuyScript:
	jumptextfaceplayer ViridianCity1BallGuyText
	jumptextfaceplayer ViridianCityBallGuyEndText
	
ViridianCity2BallGuyScript:
	jumptextfaceplayer ViridianCity2BallGuyText	
    jumptextfaceplayer ViridianCityBallGuyEndText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityPPSign:
	jumptext ViridianCityPPSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityMartSign:
	jumpstd MartSignScript

ViridianCityCoffeeGrampsIntroText:
	text "Ahh, I've had my"
	line "coffee now, and"
	cont "I feel great!"
	
	para "Sure, kid! You can"
	line "go through!"

	para "Y'know, kid..."
	line "I might not look"
	cont "like it, but"
	cont "I'm an expert at"
	cont "catching #MON."

	para "Do you believe me?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "That's right!"
	line "Why, I'll give you"
    cont "a demonstration!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "What? You little"
	line "whelp!"

	para "If I were just a"
	line "bit younger, I'd"

	para "show you a thing"
	line "or two. Humph!"
	done
	
ViridianCityOldDudeText:	
	text "You can't go"
	line "through here!"
	
	para "This is private"
	line "property!"
	done
	
ViridianCityCoffeeLassText:
    text "Oh, Grandpa! Don't"
    line "be so mean!"	
    cont "He hasn't had his"
    cont "coffee yet."
	done
	 
ViridianCityCoffeeLassText2:
    text "Grandpa can be"
    line "so moody without"	
    cont "his coffee, but"
    cont "he really was an"	
    cont "ACE TRAINER back"	
    cont "in the day!"	
    done
	
ViridianCityGrampsNearGymText:
	text "This GYM didn't"
	line "have a LEADER"
	cont "until recently."

	para "A young man from"
	line "PALLET became the"

	para "LEADER, but he's"
	line "often away."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Are you going to"
	line "battle the LEADER?"

	para "Good luck to you."
	line "You'll need it."
	done

ViridianCityDreamEaterFisherText:
	text "Yawn!"

	para "I must have dozed"
	line "off in the sun."

	para "…I had this dream"
	line "about a DROWZEE"

	para "eating my dream."
	line "Weird, huh?"

	para "Huh?"
	line "What's this?"

	para "Where did this TM"
	line "come from?"

	para "This is spooky!"
	line "Here, you can have"
	cont "this TM."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 contains"
	line "DREAM EATER…"

	para "…Zzzzz…"
	done

ViridianCityYoungsterText:
	text "I heard that there"
	line "are many items on"

	para "the ground in"
	line "VIRIDIAN FOREST."
	done
	
ViridianCityBugGuyText:
	text "You want to know"
	line "about some of the"
    cont "BUG-Type #MON"
	cont "you can find in"
	cont "VIRIDIAN FOREST?"
	done

ViridianCityBugGuyText2:
	text "CATERPIE has no"
	line "poison, but"
    cont "WEEDLE does."
    
	para "Watch out for its"
	line "POISON STING!"
	done

ViridianCityBugGuyText3:
	text "Oh, OK then!"
	
    para "Some people just"
    line "can't appreciate"
    cont "good BUG trivia!"

	done

ViridianCity1BallGuyText:
	text "That # BALL"
	line "at your waist!"
	
	para "You have your"
	line "very own #MON!"
    done
ViridianCity2BallGuyText:
	text "Those # BALLs"
	line "at your waist!"
	
	para "You have #MON!"
	done
	
ViridianCityBallGuyEndText:
	para "It's great that"
	line "you can carry and"
	cont "use #MON any"
	cont "time, anywhere!"
	done	

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "The Eternally"
	line "Green Paradise"
	done
	
ViridianCityPPSignText:
	text "TRAINER TIPS"

	para "The battle moves"
	line "of #MON are"
	cont "limited by their"
	cont "POWER POINTs, PP."
	
	para "To replenish PP,"
	line "rest your tired"
	cont "#MON at a"
	cont "#MON Center!"	
	done	

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	cont "LEADER: …"

	para "The rest of the"
	line "text is illegible…"
	done

ViridianCityWelcomeSignText:
	text "WELCOME TO"
	line "VIRIDIAN CITY,"

	para "THE GATEWAY TO"
	line "INDIGO PLATEAU"
	done

TrainerHouseSignText:
	text "TRAINER HOUSE"

	para "The Club for Top"
	line "Trainer Battles"
	done
	
AwayFromOldDude_Movement:
   turn_head DOWN 
   step DOWN
   step_end

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1
	
	;warp_event 23, 25, LAVENDER_TOWER_1F, 1

	def_coord_events
    coord_event 19, 9, SCENE_VIRIDIAN_CITY, ViridianCityNoCoffeeGramps
	
	def_bg_events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign
	bg_event 29, 29, BGEVENT_READ, ViridianCityPPSign

	def_object_events
	object_event 18,  9, SPRITE_GAMBLER_ASLEEP, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityNoCoffeeGramps, EVENT_OLD_DUDE_GOT_COFFEE
	object_event 18,  9, SPRITE_GAMBLER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 17,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeLass, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
	object_event 31, 25, SPRITE_BUG_CATCHER_2, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityBugGuyScript, -1
	object_event 13, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityBallGuy0Script, -1
