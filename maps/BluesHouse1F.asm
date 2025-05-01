	object_const_def
	const BLUESHOUSE1F_DAISY1
	const BLUESHOUSE1F_DAISY2
	const BLUESHOUSE1F_DAISY3
	const BLUESHOUSE1F_DAISY4
	const BLUESHOUSE1F_POKEFAN_F
	; const BLUESHOUSE1F_TRADER
	; const BLUESHOUSE1F_GYARADOS
BluesHouse1F_MapScripts:
	def_scene_scripts
	scene_script BluesHouse1FNoop1Scene, SCENE_BLUESHOUSE1F_MEET_DAISY
	scene_script BluesHouse1FNoop2Scene, SCENE_BLUESHOUSE1F_NOOP

	def_callbacks

BluesHouse1FNoop1Scene:
	end

BluesHouse1FNoop2Scene:
	end

; BluesHouse_Trader: ; not from Crystal
 ; faceplayer
 ; opentext
 ; special trader
 ; waitbutton
 ; closetext
 ; end

BluesHouse_MeetDaisyLeftScript:
    readmem wPlayerCostume
	ifequal 3, BluesHouse_MeetDaisyLeftScript2
	end

BluesHouse_MeetDaisyRightScript:
    readmem wPlayerCostume
	ifequal 3, BluesHouse_MeetDaisyRightScript2
	end
	
BluesHouse_MeetDaisyLeftScript2:	
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

BluesHouse_MeetDaisyRightScript2:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, BLUESHOUSE1F_DAISY1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement BLUESHOUSE1F_DAISY1, BluesHouse_DaisyTurnsTowardBlueMovement
	sjump BluesHouse_MeetDaisyScript

.OnRight:
	applymovement BLUESHOUSE1F_DAISY1, BluesHouse_DaisyWalksToBlueMovement

BluesHouse_MeetDaisyScript:
	opentext
	writetext BluesHouse_ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, BluesHouse_PokegearName
	scall BluesHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_BLUESHOUSE1F_NOOP
	setevent EVENT_BLUES_HOUSE_DAISY_1
	clearevent EVENT_BLUES_HOUSE_DAISY_2
	writetext BluesHouse_DaisyGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext BluesHouse_IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	
.DayOfWeekDone:
	writetext BluesHouse_ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext BluesHouse_KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext BluesHouse_DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext BluesHouse_InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement BLUESHOUSE1F_DAISY1, BluesHouse_DaisyTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement BLUESHOUSE1F_DAISY1, BluesHouse_DaisyWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject BLUESHOUSE1F_DAISY1, LEFT
	end

BluesHouse_MeetDaisyTalkedScript:
	playmusic MUSIC_MOM
	sjump BluesHouse_MeetDaisyScript

BluesHouse_PokegearName:
	db "#GEAR@"

BluesHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

BluesHouse_DaisyScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse BluesHouse_MeetDaisyTalkedScript ; SCENE_BLUESHOUSE1F_MEET_DAISY
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_DAISY
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_DAISY_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfDaisy
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext BluesHouse_HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext BluesHouse_SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext BluesHouse_ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_DAISY
.BankOfDaisy:
	setevent EVENT_TALKED_TO_DAISY_AFTER_MYSTERY_EGG_QUEST
	special BankOfDaisy
	waitbutton
	closetext
	end

BluesHouse_NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext BluesHouse_NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext BluesHouse_NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext BluesHouse_NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext BluesHouse_NeighborText
	waitbutton
	closetext
	turnobject BLUESHOUSE1F_POKEFAN_F, RIGHT
	end

BluesHouse1FTVScript:
	jumptext BluesHouse1FTVText

BluesHouse1FStoveScript:
	jumptext BluesHouse1FStoveText

BluesHouse1FSinkScript:
	jumptext BluesHouse1FSinkText

BluesHouse1FFridgeScript:
	jumptext BluesHouse1FFridgeText

BluesHouse_DaisyTurnsTowardBlueMovement:
	turn_head RIGHT
	step_end

BluesHouse_DaisyWalksToBlueMovement:
	slow_step RIGHT
	step_end

BluesHouse_DaisyTurnsBackMovement:
	turn_head LEFT
	step_end

BluesHouse_DaisyWalksBackMovement:
	slow_step LEFT
	step_end

BluesHouse_ElmsLookingForYouText:
	text "Oh, <PLAYER>…! Our"
	line "neighbor, PROF."

	para "ELM, was looking"
	line "for you."

	para "He said he wanted"
	line "you to do some-"
	cont "thing for him."

	para "Oh! I almost for-"
	line "got! Your #MON"

	para "GEAR is back from"
	line "the repair shop."

	para "Here you go!"
	done

BluesHouse_DaisyGivesPokegearText:
	text "#MON GEAR, or"
	line "just #GEAR."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

BluesHouse_IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

BluesHouse_ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done

BluesHouse_KnowTheInstructionsText:
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done

BluesHouse_DontKnowTheInstructionsText:
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done

BluesHouse_InstructionsNextText:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done

BluesHouse_HurryUpElmIsWaitingText:
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

BluesHouse_SoWhatWasProfElmsErrandText:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

BluesHouse_ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

BluesHouse_NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

BluesHouse_NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

BluesHouse_NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

BluesHouse_NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

BluesHouse1FStoveText:
	text "Daisy's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

BluesHouse1FSinkText:
	text "The sink is spot-"
	line "less. Daisy likes" 
	cont "it clean."
	done

BluesHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

BluesHouse1FTVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

; RedGyarados2:
	; opentext
	; writetext LakeOfRageGyaradosCryText2
	; pause 15
	; cry GYARADOS
	; closetext
	; loadwildmon GYARADOS, 30
	; loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	; startbattle
	; ifequal LOSE, .NotBeaten1
; ;	disappear BLUESHOUSE1F_GYARADOS
; .NotBeaten1:
	; reloadmapafterbattle
	; opentext
	; giveitem RED_SCALE
	; waitsfx
	; writetext BluesHouse1FGotRedScaleText
	; playsound SFX_ITEM
	; waitsfx
	; itemnotify
	; closetext
	; setscene 0 ; Lake of Rage does not have a scene variable
; ;	appear LAKEOFRAGE_LANCE
	; end
	
	
; LakeOfRageGyaradosCryText2:
	; text "GYARADOS: Gyashaa!"
	; done


; BluesHouse1FGotRedScaleText:
	; text "<PLAYER> obtained a"
	; line "RED SCALE."
	; done

BluesHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, PALLET_TOWN, 2
	warp_event  7,  7, PALLET_TOWN, 2
	warp_event  9,  0, BLUES_HOUSE_2F, 1
	warp_event  7,  0, BLUES_HOUSE_DAISY_2F, 1
	
	def_coord_events
	coord_event  8,  4, SCENE_BLUESHOUSE1F_MEET_DAISY, BluesHouse_MeetDaisyLeftScript
	coord_event  9,  4, SCENE_BLUESHOUSE1F_MEET_DAISY, BluesHouse_MeetDaisyRightScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BluesHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, BluesHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, BluesHouse1FFridgeScript
	bg_event  6,  0, BGEVENT_READ, BluesHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BluesHouse_DaisyScript, EVENT_BLUES_HOUSE_DAISY_1
	object_event  2,  2, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BluesHouse_DaisyScript, EVENT_BLUES_HOUSE_DAISY_2
	object_event  7,  4, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BluesHouse_DaisyScript, EVENT_BLUES_HOUSE_DAISY_2
	object_event  0,  2, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BluesHouse_DaisyScript, EVENT_BLUES_HOUSE_DAISY_2
	object_event  4,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, BluesHouse_NeighborScript, EVENT_BLUES_HOUSE_1F_NEIGHBOR
;    object_event  2,  2, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BluesHouse_Trader, -1
;	object_event 1, 2, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados2, EVENT_LAKE_OF_RAGE_RED_GYARADOS
