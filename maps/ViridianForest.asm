	object_const_def
;	 const VIRIDIANFOREST_GHOST
	 const VIRIDIANFOREST_BUG_CATCHER_RICK
	 const VIRIDIANFOREST_BUG_CATCHER_ADAM
	 const VIRIDIANFOREST_BUG_CATCHER_TONY
	 const VIRIDIANFOREST_BUG_CATCHER_LIAM
	 const VIRIDIANFOREST_BUG_CATCHER_SAMMY
	 const VIRIDIANFOREST_LASS_STACEY
	 const VIRIDIANFOREST_YOUNGSTER1
	 const VIRIDIANFOREST_YOUNGSTER2
	; const VIRIDIANFOREST_BLACK_BELT
	; const VIRIDIANFOREST_ROCKER
	; const VIRIDIANFOREST_POKE_BALL1
	; const VIRIDIANFOREST_KURT
	; const VIRIDIANFOREST_LASS
	; const VIRIDIANFOREST_YOUNGSTER2
	; const VIRIDIANFOREST_POKE_BALL2
	; const VIRIDIANFOREST_POKE_BALL3
	; const VIRIDIANFOREST_POKE_BALL4

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks


TrainerBugCatcherRick:
	trainer BUG_CATCHER, RICK, EVENT_BEAT_BUG_CATCHER_RICK, BugCatcherRickSeenText, BugCatcherRickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRickAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBugCatcherAdam:
	trainer BUG_CATCHER, ADAM, EVENT_BEAT_BUG_CATCHER_ADAM, BugCatcherAdamSeenText, BugCatcherAdamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherAdamAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBugCatcherTony:
	trainer BUG_CATCHER, TONY, EVENT_BEAT_BUG_CATCHER_TONY, BugCatcherTonySeenText, BugCatcherTonyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherTonyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherLiam:
	trainer BUG_CATCHER, LIAM, EVENT_BEAT_BUG_CATCHER_LIAM, BugCatcherLiamSeenText, BugCatcherLiamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherLiamAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherSammy:
	trainer BUG_CATCHER, SAMMY, EVENT_BEAT_BUG_CATCHER_SAMMY, BugCatcherSammySeenText, BugCatcherSammyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherSammyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassStacey:
	trainer LASS, STACEY, EVENT_BEAT_LASS_STACEY, LassStaceySeenText, LassStaceyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassStaceyAfterBattleText
	waitbutton
	closetext
	end			
	
ViridianForestPokeball1:
	itemball POKE_BALL

ViridianForestPotion1:
	 itemball POTION
	 
ViridianForestPotion2:
	 itemball POTION

ViridianForestHiddenPotion1:
	 hiddenitem POTION, EVENT_VIRIDIAN_FOREST_HIDDEN_POTION
	 
ViridianForestHiddenPokeball1:
	 hiddenitem POKE_BALL, EVENT_VIRIDIAN_FOREST_HIDDEN_POKE_BALL 

 ; ViridianForestXAttack:
	 ; itemball X_ATTACK

 ; ViridianForestAntidote:
	 ; itemball ANTIDOTE

 ; ViridianForestEther:
	 ; itemball ETHER

; ViridianForestHiddenEther:
	; hiddenitem ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

; ViridianForestHiddenSuperPotion:
	; hiddenitem SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

; ViridianForestHiddenFullHeal:
	; hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL




BugCatcherRickSeenText:
	text "Hey! You have"
	line "#MON!"

	para "Come on!"
	line "Let's battle 'em!"
	done

BugCatcherRickBeatenText:
	text "No! My BUGs"
	line "can't hack it!"
	done

BugCatcherRickAfterBattleText:
	text "Ssh! You'll"
	line "scare all the"
    cont "BUGs away!"
	done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BugCatcherAdamSeenText:
	text "Yo! You can't jam"
	line "out if you're a"
	cont "#MON Trainer!"

	done

BugCatcherAdamBeatenText:
	text "Huh?"
	line "I ran out of"
	cont "#MON!"
	done

BugCatcherAdamAfterBattleText:
	text "Darn! I'm going"
	line "to catch some"
    cont "stronger ones!"
	done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BugCatcherTonySeenText:
	text "I'm gonna be the"
	line "best. You just"
	cont "can't beat me!"
	done

BugCatcherTonyBeatenText:
	text "After all I did..."

	done

BugCatcherTonyAfterBattleText:
	text "A METAPOD is cool"
	line "because its"
    cont "attack is its"
    cont "defense!"
	done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BugCatcherLiamSeenText:
	text "Hey! Wait up!"
	line "What's the hurry?"
	done

BugCatcherLiamBeatenText:
    text "I give!"
	line "You're good"
	cont "at this!"
	done

BugCatcherLiamAfterBattleText:
	text "Sometimes, you"
	line "can find stuff"
	cont "on the ground,"
	cont "even if it's"
	cont "hidden by tall"
	cont "grass!"
	para "I'm looking for"
	line "the stuff I"
	cont "dropped!"
	done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BugCatcherSammySeenText:
	text "Hey! Do you know"
	line "the difference"
    cont "between poison"
    cont "and venom?"
	done

BugCatcherSammyBeatenText:
   text "Aw man!!"
   done
   
BugCatcherSammyAfterBattleText:
	text "If you bite it"
	line "and you die,"
	cont "it's poisonous!"
	
	para "If it bites you"
	line "and you die,"
	cont "it's venomous!"
	done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LassStaceySeenText:
	text "Hi! Do you have"
	line "a PIKACHU?"

	para "I heard they"
	line "live in this"
	cont "forest!"
	done

LassStaceyBeatenText:
	text "Oh no,"
	line "really?"
	done

LassStaceyAfterBattleText:
	text "I looked forever,"
	line "but I never found"
    cont "a PIKACHU here!"
	done


ViridianForestSign1:
	jumptext ViridianForestSign1Text

ViridianForestSign2:
	jumptext ViridianForestSign2Text
	
ViridianForestSign3:
	jumptext ViridianForestSign3Text
	
ViridianForestSign4:
	jumptext ViridianForestSign4Text
	
ViridianForestSign5:
	jumptext ViridianForestSign5Text
	
ViridianForestSign6:
	jumptext ViridianForestSign6Text
	
ViridianForestYoungster1:
    jumptext ViridianForestYoungster1Text
	
ViridianForestYoungster2:
    jumptext ViridianForestYoungster2Text	

ViridianForestYoungster1Text:
    text "I came here with"
	line "some friends!"
	
	para "They're out for"
	line "#MON battles!"
	done

ViridianForestYoungster2Text:
    text "I ran out of #"
	line "BALLs to catch"
	cont "#MON with!"
	
	para "You should carry"
	line "extras!"
	done

ViridianForestSign1Text:
	text "TRAINER TIPS"

	para "Weaken #MON"
	line "before attempting"
	cont "capture!"
	
	para "When healthy,"
	line "they may escape!"
	done
	
ViridianForestSign2Text:
	text "TRAINER TIPS"

	para "If your #MON"
	line "is poisoned,"
    cont "use ANTIDOTE!"
    
	para "Available at"
	line "your nearest"
	cont "#MART!"
	done		

ViridianForestSign3Text:
	text "TRAINER TIPS"

	para "If you want to"
	line "avoid battles,"
	cont "stay away from"
	cont "grassy areas!"
	done

ViridianForestSign4Text:
	text "TRAINER TIPS"

	para "Contact PROF.OAK"
	line "via PC to get"
    cont "your #DEX"
    cont "evaluated!"
	done
	

ViridianForestSign5Text:
	text "TRAINER TIPS"

	para "No stealing of"
	line "#MON from"
	cont "other trainers!"
	
	para "Catch only wild"
	line "#MON!"
	done
	
ViridianForestSign6Text:
	text "LEAVING"
	line "VIRIDIAN FOREST"
	cont "PEWTER CITY AHEAD"
	done

	
GhoatMarowak:


	opentext
	writetext SilphGhostCryText1
	pause 15
	cry MAROWAK
	closetext
	loadwildmon MAROWAK, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_GHOST
	startbattle
	ifequal LOSE, .NotBeaten1
	;disappear VIRIDIANFOREST_GHOST
	
	
.NotBeaten1:
	reloadmapafterbattle
	opentext
	giveitem SILPH_SCOPE
	waitsfx
	writetext ViridianForestGotSilphScopeText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
;	appear LAKEOFRAGE_LANCE
	end	
	
SilphGhostCryText1:
	text "GHOST: Woooo..."
	done


ViridianForestGotSilphScopeText:
	text "<PLAYER> obtained a"
	line "SILPH SCOPE!"
	done	

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 47, VIRIDIAN_FOREST_SOUTH_GATE, 3
	warp_event 17, 47, VIRIDIAN_FOREST_SOUTH_GATE, 4
	warp_event  1,  0, VIRIDIAN_FOREST_NORTH_GATE, 1
	warp_event  2,  0, VIRIDIAN_FOREST_NORTH_GATE, 2
	; warp_event  1,  0, ROUTE_34_ILEX_FOREST_GATE, 3
	; warp_event 16, 47, ILEX_FOREST_AZALEA_GATE, 1
	; warp_event 17, 47, ILEX_FOREST_AZALEA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 18, 45, BGEVENT_READ, ViridianForestSign1
	bg_event 16, 32, BGEVENT_READ, ViridianForestSign2
	bg_event 24, 40, BGEVENT_READ, ViridianForestSign3
	bg_event 26, 17, BGEVENT_READ, ViridianForestSign4
	bg_event  4, 24, BGEVENT_READ, ViridianForestSign5
	bg_event  2,  1, BGEVENT_READ, ViridianForestSign6
	
	bg_event 1, 31, BGEVENT_ITEM, ViridianForestPokeball1
	bg_event 25, 11, BGEVENT_ITEM, ViridianForestPotion1
	bg_event 12, 29, BGEVENT_ITEM, ViridianForestPotion2
	bg_event  1, 18, BGEVENT_ITEM, ViridianForestHiddenPotion1
	bg_event 32, 43, BGEVENT_ITEM, ViridianForestHiddenPokeball1
	; bg_event 22, 14, BGEVENT_ITEM, ViridianForestHiddenSuperPotion
	; bg_event  1, 17, BGEVENT_ITEM, ViridianForestHiddenFullHeal
	; bg_event  8, 22, BGEVENT_UP, ViridianForestShrineScript

	def_object_events


;	object_event 16, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GhoatMarowak, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event 30,  33, SPRITE_BUG_CATCHER_2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherRick, -1
	object_event 30, 19, SPRITE_BUG_CATCHER_2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherAdam, -1
	object_event 13, 15, SPRITE_BUG_CATCHER_2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherTony, -1
	object_event  2, 18, SPRITE_BUG_CATCHER_2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherLiam, -1
	object_event 11, 24, SPRITE_BUG_CATCHER_2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherSammy, -1
	object_event  2, 41, SPRITE_KANTO_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerLassStacey, -1
	object_event 16, 43, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestYoungster1, -1
	object_event 27, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianForestYoungster2, -1
	
	 
	; object_event  9, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	; object_event 17,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	; object_event 27,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestEther, EVENT_ILEX_FOREST_ETHER
