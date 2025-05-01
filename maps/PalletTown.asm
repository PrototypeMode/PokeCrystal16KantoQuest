	object_const_def
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER
	const PALLETTOWN_OAK

PalletTown_MapScripts:
	def_scene_scripts
	scene_script PalletExitScene, SCENE_PALLET_EXIT
	scene_script PalletExitScene2, SCENE_PALLET_EXIT2
	scene_script PalletExitScene3, SCENE_PALLETTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlypointCallback

PalletTownFlypointCallback:
	setflag ENGINE_FLYPOINT_PALLET
	;special RefreshSprites
	endcallback

PalletExitScene:
    readmem wPlayerCostume
    ifequal 3, .Gary
    clearevent EVENT_RIVAL_GARY_IN_OAKS_LAB
	setevent EVENT_RIVAL_ASH_IN_OAKS_LAB
    end

.Gary
    clearevent EVENT_RIVAL_ASH_IN_OAKS_LAB
	setevent   EVENT_RIVAL_GARY_IN_OAKS_LAB
    end

	
PalletExitScene2:
    end
	
PalletExitScene3:
    end


	
LeaveTownOakScript:
     callasm SkipName
   ; clearflag ENGINE_UNLOCKED_UNOWNS_UNUSED_4 ; This Flag enables/disables Givepoke Nicknaming.
    appear PALLETTOWN_OAK
	playsound SFX_READ_TEXT
    waitsfx
	showemote EMOTE_SHOCK, PALLETTOWN_OAK, 20
	playmusic MUSIC_PROF_OAK
    applymovement PALLETTOWN_OAK, OakWalksToPlayerMovement1
	turnobject PLAYER, DOWN
	opentext
	writetext OakGreetingText
	waitbutton
	closetext
	applymovement PALLETTOWN_OAK, OakTurnMovementRight
	stopfollow
	givepoke CELEBI, 25
	loadwildmon PIKACHU, 5
	catchtutorial BATTLETYPE_TUTORIAL
	callasm DontSkipName
    special DeleteDex
	opentext
	writetext OakPostBattleText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
    sjump FollowOakScript1
	callasm DontSkipName
	end


	
LeaveTownOakScript2:
    callasm SkipName
    ;clearflag ENGINE_UNLOCKED_UNOWNS_UNUSED_4 ; This Flag enables/disables Givepoke Nicknaming.
    appear PALLETTOWN_OAK
	playsound SFX_READ_TEXT
    waitsfx
	showemote EMOTE_SHOCK, PALLETTOWN_OAK, 20
	playmusic MUSIC_SHOW_ME_AROUND
    applymovement PALLETTOWN_OAK, OakWalksToPlayerMovement2
	turnobject PLAYER, DOWN
	opentext
	writetext OakGreetingText
	waitbutton
	closetext
	applymovement PALLETTOWN_OAK, OakTurnMovementLeft
	stopfollow
	givepoke PIKACHU, 25
	loadwildmon MEOWTH, 5
	catchtutorial BATTLETYPE_TUTORIAL
	callasm DontSkipName
	special DeleteDex
	opentext
	writetext OakPostBattleText
	waitbutton
	closetext
    sjump FollowOakScript2
	
	end	

SkipName:
   ld a, 1
   ld [wSkipName], a
   ret

DontSkipName:
   ld a, 0
   ld [wSkipName], a
   ret
	
FollowOakScript1:
    special DeleteParty
    setevent EVENT_OAK_TOGGLE
	follow PALLETTOWN_OAK, PLAYER
	applymovement PALLETTOWN_OAK, OakWalksToLabMovement1
	stopfollow
	special RestartMapMusic
	playsound SFX_ENTER_DOOR
	disappear PALLETTOWN_OAK
    setscene SCENE_PALLETTOWN_NOOP
	applymovement PLAYER, StepUpMovement1
	playsound SFX_ENTER_DOOR
    special FadeOutToWhite
	pause 15
    warpfacing UP, OAKS_LAB, 4, 11
 ;   setflag	ENGINE_UNLOCKED_UNOWNS_UNUSED_4 ; This Flag enables/disables Givepoke Nicknaming.
	end

	
FollowOakScript2:
    special DeleteParty
    setevent EVENT_OAK_TOGGLE
	follow PALLETTOWN_OAK, PLAYER
	applymovement PALLETTOWN_OAK, OakWalksToLabMovement2
	stopfollow
	special RestartMapMusic
	playsound SFX_ENTER_DOOR
	disappear PALLETTOWN_OAK
    setscene SCENE_PALLETTOWN_NOOP
	applymovement PLAYER, StepUpMovement1
	playsound SFX_ENTER_DOOR
    special FadeOutToWhite
	pause 15
    warpfacing UP, OAKS_LAB, 4, 11
;	setflag	ENGINE_UNLOCKED_UNOWNS_UNUSED_4 ; This Flag enables/disables Givepoke Nicknaming.
    end
	

	
PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

OakTurnMovementLeft:
	turn_head LEFT
	step_end
	
OakTurnMovementRight:
	turn_head RIGHT
	step_end	
	
OakWalksToPlayerMovement1:
    slow_step UP
    slow_step UP
    slow_step UP
    slow_step UP
	step_end

OakWalksToPlayerMovement2:
    slow_step UP
    slow_step UP
    slow_step RIGHT
    slow_step UP
    slow_step UP
	step_end	


OakWalksToLabMovement1:
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step UP
    step_end
OakWalksToLabMovement2:
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
	step RIGHT
    step RIGHT
	step RIGHT
	step UP
    step_end
	
StepUpMovement1:	
    step UP
	step_end
; Text_FollowOak:
	; text "Is that so? Then"
	; line "study shall you!"
	; cont "Follow me!"
	; done	

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "When they get"
	line "strong, they"
	cont "can protect me!"
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "RED'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "BLUE'S HOUSE"
	done
	
OakGreetingText:
	text "OAK: Hey! Wait!"
	line "Don't go out!"

	para "That was close!"

	para "Wild #MON live"
	line "in tall grass!"
	done

OakPostBattleText:
		text "OAK: Whew..."
		para "A #MON can"
		line "appear at anytime"
		cont "in tall grass!"
		
		para "You need your own"
		line "#MON for your"
		cont "protection!"
		
		para "I know!"
		line "Here, come with"
		cont "me!"
		done
		

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE_1F, 1
	warp_event 12, 11, OAKS_LAB, 1

	def_coord_events
	coord_event  8,  0, SCENE_PALLET_EXIT, LeaveTownOakScript
	coord_event  9,  0, SCENE_PALLET_EXIT, LeaveTownOakScript2

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  3,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	object_event 8, 5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, EVENT_EXIT_PALLET
