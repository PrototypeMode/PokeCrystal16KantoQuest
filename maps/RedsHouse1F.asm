	object_const_def
	const REDSHOUSE1F_MOM1
	const REDSHOUSE1F_MOM2
	const REDSHOUSE1F_MOM3
	const REDSHOUSE1F_MOM4
	const REDSHOUSE1F_POKEFAN_F
	; const REDSHOUSE1F_TRADER
	; const REDSHOUSE1F_GYARADOS
RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script RedsHouse1FNoop1Scene, SCENE_REDSHOUSE1F_MEET_MOM
	scene_script RedsHouse1FNoop2Scene, SCENE_REDSHOUSE1F_NOOP

	def_callbacks

RedsHouse1FNoop1Scene:
	end

RedsHouse1FNoop2Scene:
	end

; RedsHouse_Trader: ; not from Crystal
 ; faceplayer
 ; opentext
 ; special trader
 ; waitbutton
 ; closetext
 ; end

RedsHouse_MeetMomLeftScript:
    readmem wPlayerCostume
	ifequal 0, RedsHouse_MeetMomLeftScript2
	end

RedsHouse_MeetMomRightScript:
    readmem wPlayerCostume
	ifequal 0, RedsHouse_MeetMomRightScript2
	end
	
RedsHouse_MeetMomLeftScript2:	
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

RedsHouse_MeetMomRightScript2:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, REDSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement REDSHOUSE1F_MOM1, RedsHouse_MomTurnsTowardBlueMovement
	sjump RedsHouse_MeetMomScript

.OnRight:
	applymovement REDSHOUSE1F_MOM1, RedsHouse_MomWalksToBlueMovement

RedsHouse_MeetMomScript:
	opentext
	writetext RedsHouse_ElmsLookingForYouText
	promptbutton
;	getstring STRING_BUFFER_4, RedsHouse_PokegearName
;	scall RedsHouse1FReceiveItemStd
	; setflag ENGINE_POKEGEAR
	; setflag ENGINE_PHONE_CARD
	; addcellnum PHONE_MOM
	setscene SCENE_REDSHOUSE1F_NOOP
	setevent EVENT_REDS_HOUSE_MOM_1
	clearevent EVENT_REDS_HOUSE_MOM_2
;	writetext RedsHouse_MomGivesPokegearText
;	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext RedsHouse_IsItDSTText
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
	writetext RedsHouse_ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext RedsHouse_KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext RedsHouse_DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext RedsHouse_InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement REDSHOUSE1F_MOM1, RedsHouse_MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement REDSHOUSE1F_MOM1, RedsHouse_MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject REDSHOUSE1F_MOM1, LEFT
	end

RedsHouse_MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump RedsHouse_MeetMomScript

RedsHouse_PokegearName:
	db "#GEAR@"

RedsHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

RedsHouse_MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse RedsHouse_MeetMomTalkedScript ; SCENE_REDSHOUSE1F_MEET_MOM
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext RedsHouse_HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext RedsHouse_SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext RedsHouse_ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

RedsHouse_NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext RedsHouse_NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext RedsHouse_NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext RedsHouse_NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext RedsHouse_NeighborText
	waitbutton
	closetext
	turnobject REDSHOUSE1F_POKEFAN_F, RIGHT
	end

RedsHouse1FTVScript:
	jumptext RedsHouse1FTVText

RedsHouse1FStoveScript:
	jumptext RedsHouse1FStoveText

RedsHouse1FSinkScript:
	jumptext RedsHouse1FSinkText

RedsHouse1FFridgeScript:
	jumptext RedsHouse1FFridgeText

RedsHouse_MomTurnsTowardBlueMovement:
	turn_head RIGHT
	step_end

RedsHouse_MomWalksToBlueMovement:
	slow_step RIGHT
	step_end

RedsHouse_MomTurnsBackMovement:
	turn_head LEFT
	step_end

RedsHouse_MomWalksBackMovement:
	slow_step LEFT
	step_end

RedsHouse_ElmsLookingForYouText:
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

RedsHouse_MomGivesPokegearText:
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

RedsHouse_IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

RedsHouse_ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done

RedsHouse_KnowTheInstructionsText:
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done

RedsHouse_DontKnowTheInstructionsText:
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done

RedsHouse_InstructionsNextText:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done

RedsHouse_HurryUpElmIsWaitingText:
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

RedsHouse_SoWhatWasProfElmsErrandText:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

RedsHouse_ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

RedsHouse_NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

RedsHouse_NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

RedsHouse_NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

RedsHouse_NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

RedsHouse1FStoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

RedsHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mom likes" 
	cont "it clean."
	done

RedsHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

RedsHouse1FTVText:
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
; ;	disappear REDSHOUSE1F_GYARADOS
; .NotBeaten1:
	; reloadmapafterbattle
	; opentext
	; giveitem RED_SCALE
	; waitsfx
	; writetext RedsHouse1FGotRedScaleText
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


; RedsHouse1FGotRedScaleText:
	; text "<PLAYER> obtained a"
	; line "RED SCALE."
	; done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, PALLET_TOWN, 1
	warp_event  7,  7, PALLET_TOWN, 1
	warp_event  9,  0, REDS_HOUSE_2F, 1
	warp_event  7,  0, REDS_HOUSE_MOM_2F, 1
	
	def_coord_events
	coord_event  8,  4, SCENE_REDSHOUSE1F_MEET_MOM, RedsHouse_MeetMomLeftScript
	coord_event  9,  4, SCENE_REDSHOUSE1F_MEET_MOM, RedsHouse_MeetMomRightScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FFridgeScript
	bg_event  6,  0, BGEVENT_READ, RedsHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedsHouse_MomScript, EVENT_REDS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedsHouse_MomScript, EVENT_REDS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedsHouse_MomScript, EVENT_REDS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedsHouse_MomScript, EVENT_REDS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedsHouse_NeighborScript, EVENT_REDS_HOUSE_1F_NEIGHBOR
;    object_event  2,  2, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouse_Trader, -1
;	object_event 1, 2, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados2, EVENT_LAKE_OF_RAGE_RED_GYARADOS
