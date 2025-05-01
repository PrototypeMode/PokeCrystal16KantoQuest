	object_const_def
	const PEWTERMUSEUM_1F_CLERK
	const PEWTERMUSEUM_1F_AMBER_SCIENTIST
	const PEWTERMUSEUM_1F_OLD_AMBER
	
	const PEWTERMUSEUM_1F_YOUNGSTER
	const PEWTERMUSEUM_1F_FOSSIL_GUY


PewterMuseum1F_MapScripts:
	def_scene_scripts
	scene_script PewterMuseum1F_ClerkScene, SCENE_PEWTERMUSEUM_1F_CLERK
    scene_script PewterMuseum1F_ClerkScene2, SCENE_PEWTERMUSEUM_1F_CLERK2
	def_callbacks


PewterMuseum1F_ClerkScene:
     end
	 
PewterMuseum1F_ClerkScene2:
     end	 

ClerkMuseumEntry1:
    checkscene
	ifequal SCENE_PEWTERMUSEUM_1F_CLERK, .Yes
	ifnotequal SCENE_PEWTERMUSEUM_1F_CLERK, .No
	
	
.Yes	
    applymovement PLAYER, WalkRightMovement
	sjump ClerkMuseumEntry2
.No	
    end

ClerkMuseumEntry2:
    checkscene
	ifequal SCENE_PEWTERMUSEUM_1F_CLERK, .Yes1
	ifnotequal SCENE_PEWTERMUSEUM_1F_CLERK, .No1

.Yes1
    turnobject PEWTERMUSEUM_1F_CLERK, LEFT
    turnobject PLAYER, RIGHT
	opentext
	special PlaceMoneyTopRight
	writetext PewterMuseum1FClerkText
    promptbutton
	writetext PewterMuseum1FClerkText2
    yesorno
	iftrue  PewterMuseum1FClerkScript2
	iffalse PewterMuseum1FClerkScript3
	closetext
	end
	
.No1	
    end

PewterMuseum1FClerkScript:
	readvar VAR_FACING
	ifequal RIGHT, .YouAreFacingRight
	ifnotequal RIGHT, .WrongSide

.YouAreFacingRight
    faceplayer
	opentext
    writetext PewterMuseum1FClerkText5
	promptbutton
	closetext
	end
	
.WrongSide
    faceplayer
	opentext
    writetext PewterMuseum1FClerkTextWrongSide
	yesorno
	iftrue .Yes2
	iffalse .No2
	end	
.Yes2	
	writetext PewterMuseum1FClerkTextAmberYes
	promptbutton
	closetext
	end
.No2	
	writetext PewterMuseum1FClerkTextAmberNo
	promptbutton
	closetext
	end
	
	
	
PewterMuseum1FAmberScientistScript:
	faceplayer
    checkevent EVENT_GOT_OLD_AMBER
    iffalse	.GiveAmber
	iftrue  .GotAmber
	
.GiveAmber	
    opentext 
	writetext PewterMuseum1FAmberScientistText
	promptbutton
	writetext PewterMuseum1FAmberScientistText2
	promptbutton
	turnobject PEWTERMUSEUM_1F_AMBER_SCIENTIST, RIGHT
	pause 15
	disappear PEWTERMUSEUM_1F_OLD_AMBER 
	faceplayer
	pause 15
	verbosegiveitem OLD_AMBER
	closetext
	setevent EVENT_GOT_OLD_AMBER
;	disappear PEWTERMUSEUM_1F_OLD_AMBER 
	end
	
.GotAmber
   opentext
   writetext PewterMuseum1FAmberScientistText3
   promptbutton
   closetext
	end
	
PewterMuseum1FFossilScientistScript:
    jumptextfaceplayer PewterMuseum1FFossilScientistText
    end	
	
PewterMuseum1FYoungsterScript:
	jumptextfaceplayer PewterMuseum1FYoungsterText
    end	

PewterMuseum1FFossilGuyScript:
	jumptextfaceplayer PewterMuseum1FFossilGuyText
    end

PewterMuseum1FClerkScript2:
    setscene SCENE_PEWTERMUSEUM_1F_CLERK2
    writetext PewterMuseum1FClerkText4
    takemoney YOUR_MONEY, 50
	waitsfx
	special PlaceMoneyTopRight
	promptbutton
	closetext
    applymovement PLAYER, WalkLeftMovement
    end

PewterMuseum1FClerkScript3:
	writetext PewterMuseum1FClerkText3
	promptbutton
	closetext
    applymovement PLAYER, WalkDownMovement	
    end
	
PewterMuseum1FAmberItemScript:
    jumptextfaceplayer PewterMuseum1FAmberItemText
    end	
	
PewterMuseum1FClerkText:
    text "It's ¥50 for a"
	line "child's ticket."
	done

PewterMuseum1FClerkText2:
    text "Would you like to"
    line "come in?"   
	done
	
PewterMuseum1FClerkText3:
    text "Come again!" 
	done	

PewterMuseum1FClerkText4:
    text "Right, ¥50!"
    line "Thank you!"	
	done
	
PewterMuseum1FClerkText5:
    text "Take plenty of"
    line "time to look"
    cont "around!"	
	done

PewterMuseum1FClerkTextWrongSide:
    text "You can't sneak"
    line "in the back way!"
    cont "Oh, whatever!"
	cont "Do you know what"
	cont "AMBER is?"
	done			
	
PewterMuseum1FClerkTextAmberYes:
    text "There's a lab"
    line "somewhere trying"
    cont "to resurrect"
	cont "ancient #MON"
	cont "from AMBER."
	done			
	
PewterMuseum1FClerkTextAmberNo:
    text "AMBER is fossil-"
    line "ized tree sap."
	done		
	
	
PewterMuseum1FAmberScientistText:
    text "Psst! Hey, kid!"
    line "I think that this"
	cont "chunk of AMBER"
	cont "contains #MON"
	cont "DNA!"
	
	para "It would be great"
	line "if a #MON could"
	cont "be resurrected"
	cont "from it!"
	
	para "But my colleagues"
	line "just ignore me!"
	
	para "We've all heard"
	line "the rumors of"
	cont "a lab that's"
	cont "working on such"
	cont "technology, but"
    cont "our exhibits"	
	cont "bring in too"
	cont "much money for"
	cont "PEWTER CITY for"
	cont "them to consider"
	cont "it!"
	done

PewterMuseum1FAmberScientistText2:
   text "So I have a favor"
   line "to ask!"
   
   para "Take this to a"
   line "#MON LAB and"
   cont "get it examined!"
   done
   
PewterMuseum1FAmberScientistText3:
   text "Ssh!"
   
   para "Go get the"
   line "OLD AMBER"
   cont "checked!"
   
   para "I know there's"
   line "a lab working"
   cont "on it..."
   
   para "But which lab?"
   done


PewterMuseum1FFossilScientistText:	
	text "We are proud of 2"
	line "fossils of very"
	cont "rare, prehistoric"
	cont "#MON!"
	
	para "We found them in"
	line "MT. MOON!"
	done
	
	
	
PewterMuseum1FAmberItemText:	
	text "The AMBER is"
	line "clear and gold!"
	done
	
	
PewterMuseum1FFossilGuyText:
	text "That is one"
	line "magnificent"
	cont "fossil!"

	para "I wonder what"
	line "#MON it is?"

	para "Or rather,"
	line "what #MON" 
	cont "it was..."
	done
	
PewterMuseum1FYoungsterText:
   text "Hmm..."
   para "Looking for"
   line "FOSSILs, or"
   cont "collecting BUGs..."
   
   para "I can't decide"
   line "which is more fun!"
   
   para "What do you think?"
   done
	
WalkUpMovement:
   step UP
   step_end
    
 WalkDownMovement:
   step DOWN
   step_end 
	
WalkRightMovement:
   step RIGHT
   step_end
   
WalkLeftMovement:
   step LEFT
   step_end      

PewterMuseum1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 6
	warp_event  7,  7, PEWTER_MUSEUM_2F, 1
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7

	def_coord_events
	coord_event  9,  4, SCENE_PEWTERMUSEUM_1F_CLERK, ClerkMuseumEntry1
	coord_event  10,  4, SCENE_PEWTERMUSEUM_1F_CLERK, ClerkMuseumEntry2

	def_bg_events


	def_object_events
	object_event 12,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FClerkScript, -1
	object_event 15,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FAmberScientistScript, -1
	object_event 16,  2, SPRITE_OLD_AMBER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_ROCK, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FAmberItemScript, EVENT_GOT_OLD_AMBER
	object_event 15,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FFossilScientistScript, -1
	
	object_event  9,  2, SPRITE_GAMBLER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FYoungsterScript, -1
	object_event  0,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FFossilGuyScript, -1
