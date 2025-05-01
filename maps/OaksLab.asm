	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_OAKS_AIDE
	const OAKSLAB_POKE_BALL1
	const OAKSLAB_POKE_BALL2
	const OAKSLAB_POKE_BALL3
	const OAKSLAB_BULBASAUR
	const OAKSLAB_SQUIRTLE
	const OAKSLAB_CHARMANDER

	const OAKSLAB_RIVAL_GARY
	const OAKSLAB_RIVAL_ASH
	const OAKSLAB_POKEDEX
	const OAKSLAB_POKEDEX2
	
OaksLab_MapScripts:
	def_scene_scripts
;	scene_script OaksLabSetSpawn, SCENE_OAKSLAB_SET_SPAWN
	scene_script OaksLabBranchCheckScene, SCENE_OAKSLAB_BRANCH_CHECK
	scene_script OaksLabMeetRivalScene, SCENE_OAKSLAB_MEET_RIVAL
	scene_script OaksLabMeetOakScene, SCENE_OAKSLAB_MEET_OAK
	scene_script OaksLabNoop1Scene,   SCENE_OAKSLAB_CANT_LEAVE
	scene_script OaksLabNoop2Scene,   SCENE_OAKSLAB_NOOP

	scene_script OaksLabNoop4Scene,   SCENE_OAKSLAB_UNUSED
	scene_script OaksLabNoop5Scene,   SCENE_OAKSLAB_AIDE_GIVES_POTION
	scene_script OaksLabNoop6Scene,   SCENE_OAKSLAB_GET_POKEDEX
	scene_script OaksLabNoop7Scene,   SCENE_OAKSLAB_GOT_POKEDEX
	scene_const SCENE_OAKSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, OaksLabMoveOakCallback

;OaksLabSetSpawn:
 ;   ld a, SPAWN_PALLET_OAK
  ;  ld [wDefaultSpawnpoint], a
 ;   end
 
OaksLabBranchCheckScene:
    callasm StopInput
    checkevent EVENT_OAK_TOGGLE
    iffalse DontMeetOak
    iftrue MeetOak
	end
   
StopInput:
	xor a
;	ldh [hJoyPressed], a ; pressed this frame
;	ldh [hJoyReleased], a ; released this frame
	ldh [hJoyDown], a ; currently pressed
    ret	
 
OaksLabMeetRivalScene:
 ; ;   disappear OAKSLAB_RIVAL_VAR
    ; checkevent EVENT_OAK_TOGGLE
    ; iffalse DontMeetOak
    ; iftrue MeetOak
	 end
	
MeetOak: 
  appear OAKSLAB_POKE_BALL1
    appear OAKSLAB_POKE_BALL2
    appear OAKSLAB_POKE_BALL3
	appear OAKSLAB_OAKS_AIDE
	appear OAKSLAB_OAK

	;appear OAKSLAB_CHARMANDER
	;appear OAKSLAB_SQUIRTLE
	;appear OAKSLAB_BULBASAUR
;	disappear OAKSLAB_RIVAL_GARY
;	disappear OAKSLAB_RIVAL_ASH
	setscene SCENE_OAKSLAB_MEET_OAK
	end

PokedexScene0:
    callasm StopInput
    readmem wPlayerCostume
    ifequal 3, PokedexScene2
	ifequal 0, PokedexScene1
    end

PokedexScene1:
  moveobject OAKSLAB_OAK, 2, 2
  disappear  OAKSLAB_OAK
  moveobject OAKSLAB_RIVAL_GARY, 4, 8

  setscene SCENE_OAKSLAB_GET_POKEDEX
  appear OAKSLAB_POKEDEX
  appear OAKSLAB_POKEDEX2
  
  applymovement PLAYER, OaksLab_WalkUpToOakMovement2
  appear OAKSLAB_OAK
  turnobject OAKSLAB_OAK, UP
  applymovement PLAYER, OaksLab_WalkUpToOakMovement3
  turnobject PLAYER, UP
  
  appear OAKSLAB_RIVAL_GARY
  turnobject PLAYER, UP
  applymovement OAKSLAB_RIVAL_GARY, OaksLab_RivalWalkUpToOakMovement
  turnobject OAKSLAB_RIVAL_GARY, UP
  
  turnobject OAKSLAB_OAK, UP
  playsound SFX_CHOOSE_PC_OPTION
  waitsfx
  pause 10
  applymovement OAKSLAB_OAK, OaksLab_SlowStepRightMovement
  turnobject OAKSLAB_OAK, UP
  playsound SFX_CHOOSE_PC_OPTION
  waitsfx
  pause 10
  
  applymovement OAKSLAB_OAK, OaksLab_SlowStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_SlowStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_SlowStepDownMovement
    readmem wPlayerCostume
  ifequal 3, PokedexScene3
  ifequal 0, PokedexScene4
  end
  
 PokedexScene2:
  moveobject OAKSLAB_OAK, 2, 2
  disappear  OAKSLAB_OAK
  moveobject OAKSLAB_RIVAL_ASH, 4, 8

  setscene SCENE_OAKSLAB_GET_POKEDEX
  appear OAKSLAB_POKEDEX
  appear OAKSLAB_POKEDEX2
  

  applymovement PLAYER, OaksLab_WalkUpToOakMovement2
  appear OAKSLAB_OAK
  turnobject OAKSLAB_OAK, UP
  applymovement PLAYER, OaksLab_WalkUpToOakMovement3
  turnobject PLAYER, UP
  appear OAKSLAB_RIVAL_ASH
  applymovement OAKSLAB_RIVAL_ASH, OaksLab_RivalWalkUpToOakMovement
  turnobject OAKSLAB_RIVAL_ASH, UP
  
  turnobject OAKSLAB_OAK, UP
  playsound SFX_CHOOSE_PC_OPTION
  waitsfx
  pause 10
  applymovement OAKSLAB_OAK, OaksLab_SlowStepRightMovement
  turnobject OAKSLAB_OAK, UP
  playsound SFX_CHOOSE_PC_OPTION
  waitsfx
  pause 10
  
  applymovement OAKSLAB_OAK, OaksLab_SlowStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_SlowStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_SlowStepDownMovement
  readmem wPlayerCostume
  ifequal 3, PokedexScene3
  ifequal 0, PokedexScene4
  end

PokedexScene3:
  opentext  
  writetext PokedexSceneTextGary
  promptbutton
  closetext
  sjump PokedexScene5
  end
  
PokedexScene4:
  opentext  
  writetext PokedexSceneTextAsh
  promptbutton
  closetext 
  sjump PokedexScene5
  end
   
PokedexScene5:
  opentext  
  writetext PokedexSceneTextCont
  promptbutton
  closetext
  
PokedexScene6:
   showemote EMOTE_QUESTION, OAKSLAB_OAK, 15
  opentext  
  writetext PokedexSceneTextCont2
  promptbutton
  closetext
  takeitem OAKS_PARCEL
  opentext  
  writetext DeliveredParcel  
  playsound SFX_ITEM
  waitsfx
  promptbutton
  closetext
  
  turnobject OAKSLAB_OAK, RIGHT
  changeblock  6,  3, $11 ; Desk with Box
  pause 10
  opentext  
  writetext DeliveredParcel2
    turnobject OAKSLAB_OAK, DOWN
  promptbutton
   showemote EMOTE_QUESTION, OAKSLAB_RIVAL_GARY, 15
   showemote EMOTE_QUESTION, OAKSLAB_RIVAL_ASH, 15
   closetext
   readmem wPlayerCostume
   ifequal 3, PokedexScene7
   ifequal 0, PokedexScene8
   end
   
PokedexScene7:
  opentext
  writetext DeliveredParcel3Ash
  promptbutton
  closetext
  sjump PokedexScene9
  end
  
PokedexScene8:
  opentext
  writetext DeliveredParcel3Gary
  promptbutton
  closetext
  ;fallthrough 
 
PokedexScene9: 
  opentext
  writetext DeliveredParcel4
  promptbutton
  writetext DeliveredParcel5
  promptbutton
  closetext
  turnobject OAKSLAB_OAK, LEFT
  opentext  
  writetext DeliveredParcel6
  promptbutton
  closetext
  callasm SetDexState
  readmem wPlayerCostume
  ifequal 3, GaryAshDex
  ifequal 0, AshGaryDex
  end

SetDexState:
  ld a, 1
  ld [wLastDexMode], a
  ret
  
AshGaryDex: 
  opentext  
  writetext DeliveredParcel7
  promptbutton 
  closetext
  follow OAKSLAB_OAK, PLAYER	
  applymovement OAKSLAB_OAK, OaksLab_NormalStepUpMovement
  applymovement OAKSLAB_OAK, OaksLab_DexStepLeftMovement
  turnobject OAKSLAB_OAK, RIGHT
  turnobject PLAYER, UP
  stopfollow

  applymovement OAKSLAB_RIVAL_GARY, OaksLab_NormalStepUpMovement
  applymovement OAKSLAB_RIVAL_GARY, OaksLab_NormalStepUpMovement
  applymovement OAKSLAB_RIVAL_GARY, OaksLab_NormalStepLeftMovement
  turnobject OAKSLAB_RIVAL_GARY, UP
  
  disappear OAKSLAB_POKEDEX
   pause 10
  disappear OAKSLAB_POKEDEX2
  
  opentext
  writetext OaksLab_GetDexText
  playsound SFX_ITEM
  waitsfx
  closetext
  setflag ENGINE_POKEDEX
  setevent EVENT_OLD_DUDE_GOT_COFFEE
  turnobject OAKSLAB_OAK, RIGHT
  pause 10
  turnobject OAKSLAB_RIVAL_GARY, DOWN
  follow OAKSLAB_OAK, PLAYER	
  applymovement OAKSLAB_OAK, OaksLab_NormalStepDownMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
   turnobject OAKSLAB_OAK, DOWN
  stopfollow
  
  applymovement PLAYER, OaksLab_NormalStepDownMovement
  applymovement PLAYER, OaksLab_NormalStepRightMovement
   turnobject PLAYER, UP
  
  applymovement OAKSLAB_RIVAL_GARY, OaksLab_NormalStepDownMovement
   applymovement OAKSLAB_RIVAL_GARY, OaksLab_NormalStepRightMovement 
  
  turnobject PLAYER, UP

  opentext
  writetext OaksLab_DreamText
  promptbutton
  closetext
  playmusic MUSIC_RIVAL_AFTER
    opentext
  writetext OaksLab_DreamText2
  promptbutton
  closetext
  applymovement OAKSLAB_RIVAL_GARY, OaksLab_RivalLeavesMovement2
  special FadeOutMusic
  special RestartMapMusic
  
  disappear OAKSLAB_RIVAL_GARY
  moveobject OAKSLAB_OAK, 5, 3
  setscene SCENE_OAKSLAB_GOT_POKEDEX 
  end
  
GaryAshDex:
  opentext  
  writetext DeliveredParcel8
  promptbutton 
  closetext
  follow OAKSLAB_OAK, PLAYER	
  applymovement OAKSLAB_OAK, OaksLab_NormalStepUpMovement
  applymovement OAKSLAB_OAK, OaksLab_DexStepLeftMovement
  turnobject OAKSLAB_OAK, RIGHT
  turnobject PLAYER, UP
  stopfollow

  applymovement OAKSLAB_RIVAL_ASH, OaksLab_NormalStepUpMovement
  applymovement OAKSLAB_RIVAL_ASH, OaksLab_NormalStepUpMovement
  applymovement OAKSLAB_RIVAL_ASH, OaksLab_NormalStepLeftMovement
  turnobject OAKSLAB_RIVAL_ASH, UP
  
  disappear OAKSLAB_POKEDEX
   pause 10
  disappear OAKSLAB_POKEDEX2
  
  opentext
  writetext OaksLab_GetDexText
  playsound SFX_ITEM
  waitsfx
  closetext
  setflag ENGINE_POKEDEX
  setevent EVENT_OLD_DUDE_GOT_COFFEE
  turnobject OAKSLAB_OAK, RIGHT
  pause 10
   turnobject OAKSLAB_RIVAL_ASH, DOWN
  follow OAKSLAB_OAK, PLAYER	
  applymovement OAKSLAB_OAK, OaksLab_NormalStepDownMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
  applymovement OAKSLAB_OAK, OaksLab_NormalStepRightMovement
    turnobject OAKSLAB_OAK, DOWN
  stopfollow
  
  applymovement PLAYER, OaksLab_NormalStepDownMovement
  applymovement PLAYER, OaksLab_NormalStepRightMovement
  turnobject PLAYER, UP
  
  applymovement OAKSLAB_RIVAL_ASH, OaksLab_NormalStepDownMovement
  applymovement OAKSLAB_RIVAL_ASH, OaksLab_NormalStepRightMovement 


  opentext
  writetext OaksLab_DreamText
  promptbutton
  closetext
  playmusic MUSIC_RIVAL_AFTER
  opentext
  writetext OaksLab_DreamText3
  promptbutton
  closetext
  applymovement OAKSLAB_RIVAL_ASH, OaksLab_RivalLeavesMovement2
  special FadeOutMusic
  special RestartMapMusic
 disappear OAKSLAB_RIVAL_ASH
 moveobject OAKSLAB_OAK, 5, 3
 setscene SCENE_OAKSLAB_GOT_POKEDEX
  end
 

DontMeetOak:
	disappear OAKSLAB_OAKS_AIDE
	disappear OAKSLAB_OAK
    disappear OAKSLAB_POKE_BALL1
    disappear OAKSLAB_POKE_BALL2
    disappear OAKSLAB_POKE_BALL3
	disappear OAKSLAB_CHARMANDER
	disappear OAKSLAB_SQUIRTLE
	disappear OAKSLAB_BULBASAUR
	setscene SCENE_OAKSLAB_NOOP
	end

	
OaksLabMeetOakScene:
    
    appear OAKSLAB_POKE_BALL1
    appear OAKSLAB_POKE_BALL2
    appear OAKSLAB_POKE_BALL3
	
	disappear OAKSLAB_CHARMANDER
	disappear OAKSLAB_SQUIRTLE
	disappear OAKSLAB_BULBASAUR
	sdefer OaksLabWalkUpToOakScript
	end

OaksLabNoop1Scene:
	end

OaksLabNoop2Scene:
    checkitem OAKS_PARCEL
    iftrue PokedexScene0
	checkevent EVENT_OAK_TOGGLE
	iffalse .SetScene1
	iftrue .SetScene2

.SetScene1	
	end
	
.SetScene2
    turnobject OAKSLAB_RIVAL_GARY, UP
	disappear OAKSLAB_OAKS_AIDE
	;appear OAKSLAB_OAK	
	sjump MeetOak
	end

OaksLabNoop3Scene:
	end

OaksLabNoop4Scene:
	end

OaksLabNoop5Scene:
	end
	
OaksLabNoop6Scene:
	end	
	
OaksLabNoop7Scene:
	end
	
OaksLabMoveOakCallback:
	checkscene
	ifequal SCENE_OAKSLAB_MEET_OAK, .Skip
;	iftrue .Skip ; not SCENE_OAKSLAB_MEET_OAK
	moveobject OAKSLAB_OAK, 5, 2
.Skip:
	endcallback

OaksLabWalkUpToOakScript:
    readmem wPlayerCostume
    ifequal 3, OaksLabWalkUpToOakScriptGary
	ifequal 2, OaksLabWalkUpToOakScriptAsh
	ifequal 1, OaksLabWalkUpToOakScriptAsh
	ifequal 0, OaksLabWalkUpToOakScriptAsh
    end

OaksLabWalkUpToOakScriptGary:
	turnobject OAKSLAB_RIVAL_ASH, UP
	applymovement PLAYER, OaksLab_WalkUpToOakMovement
	turnobject OAKSLAB_RIVAL_ASH, UP
	opentext
	writetext OakText_IntroGary
    promptbutton	
	turnobject OAKSLAB_RIVAL_ASH, RIGHT
    showemote EMOTE_SHOCK, OAKSLAB_RIVAL_ASH, 15  
	writetext OakText_IntroGary2
	promptbutton
	closetext
	 setscene SCENE_OAKSLAB_CANT_LEAVE
	 end
	 
OaksLabWalkUpToOakScriptAsh:
	turnobject OAKSLAB_RIVAL_GARY, UP
	applymovement PLAYER, OaksLab_WalkUpToOakMovement
	turnobject OAKSLAB_RIVAL_GARY, UP
	opentext
	writetext OakText_IntroAsh
    promptbutton	
	turnobject OAKSLAB_RIVAL_GARY, RIGHT
    showemote EMOTE_SHOCK, OAKSLAB_RIVAL_GARY, 15  
	writetext OakText_IntroAsh2
	promptbutton
	closetext
	 setscene SCENE_OAKSLAB_CANT_LEAVE
	 end	 

 ProfOakScript:
    faceplayer
	checkflag ENGINE_POKEDEX
	iftrue ProfOakPostPokedexScript
	checkitem OAKS_PARCEL
	iftrue ProfOakPokedexScript
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse OaksLab_NoMonScript
	iftrue  OaksLab_GotMonScript1
	end

 ProfOakPokedexScript:
    setscene SCENE_OAKSLAB_GET_POKEDEX
    opentext
    writetext OakText_Go_On
    promptbutton
    closetext
    end

ProfOakPostPokedexScript:
    setscene SCENE_OAKSLAB_GOT_POKEDEX
    opentext
    writetext OakText_Go_On2
    promptbutton
    closetext
    end
	
OaksLab_NoMonScript:
    opentext
    writetext OakText_Go_On
    promptbutton
    closetext	
	end
	
OaksLab_GotMonScript1:   
    opentext
	writetext OakText_PickedMon
    promptbutton
    closetext	
	checkevent EVENT_FIRST_RIVAL_BATTLE
	iftrue OaksLab_GoToViridianScript
	end
	
OaksLab_GotMonScript2:   
    opentext
	writetext OakText_PickedMon
    promptbutton
    closetext	
	end	

OaksLab_GoToViridianScript:
    opentext   
    writetext OakText_GoToViridian1
    promptbutton
    closetext
    checkevent EVENT_MART_BALL
    iftrue OaksLab_GoToViridianScript2
	end

OaksLab_GoToViridianScript2:
	opentext   
    writetext OakText_GoToViridian2
    promptbutton
    closetext
	end


OaksLabTryToLeaveScriptLeft:
    applymovement PLAYER, StepRightMovement1

OaksLabTryToLeaveScriptRight:
    checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse OaksLabTryToLeaveScript1
    iftrue DetermineCharacter1
    end
	

DetermineCharacter1:
    readmem wPlayerCostume
	ifequal 3, AshBattleScript1
	ifequal 0, GaryBattleScript1
    
	end
		
	
OaksLabTryToLeaveScript1:
	turnobject OAKSLAB_OAK, DOWN
	opentext
	writetext OaksLabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OaksLab_CantLeaveMovement
	end
		 	
	
GaryBattleScript1:
	turnobject PLAYER, UP
	opentext
	writetext GaryBattleText
	waitbutton
	closetext

.DetermineMon1
   checkevent EVENT_GOT_BULBASAUR_FROM_OAK
   iftrue GaryBulbasaurMovement
   checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
   iftrue GarySquirtleMovement
   checkevent EVENT_GOT_CHARMANDER_FROM_OAK
   iftrue GaryCharmanderMovement
   end

GaryBulbasaurMovement:
      applymovement OAKSLAB_RIVAL_GARY, OaksLab_GaryBattleMovement1
	  sjump GaryBattle
	  end
GarySquirtleMovement:
      applymovement OAKSLAB_RIVAL_GARY, OaksLab_GaryBattleMovement2
	  sjump GaryBattle
	  end
GaryCharmanderMovement:
      applymovement OAKSLAB_RIVAL_GARY, OaksLab_GaryBattleMovement3
	  sjump GaryBattle
	  end
	  

;;;;;;;;;;;BATTLETEST	  
	  
GaryBattle:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15

	playmusic MUSIC_RIVAL_ENCOUNTER
	; opentext
	; writetext GaryRivalText_Seen
	; waitbutton
	; closetext
	checkevent EVENT_GOT_BULBASAUR_FROM_OAK
	iftrue .Charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .Bulbasaur
	
	
	winlosstext GaryRivalText_Win, GaryRivalLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL_GARY, RIVAL_GARY_1_SQUIRTLE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Charmander:
	winlosstext GaryRivalText_Win, GaryRivalLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL_GARY, RIVAL_GARY_1_CHARMANDER
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Bulbasaur:
	winlosstext GaryRivalText_Win, GaryRivalLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL_GARY, RIVAL_GARY_1_BULBASAUR
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext GaryRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext GaryRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
     turnobject PLAYER, LEFT
     applymovement OAKSLAB_RIVAL_GARY, OaksLab_RivalLeavesMovement
	 playsound SFX_ENTER_DOOR
	 waitsfx
	 disappear OAKSLAB_RIVAL_GARY
	 applymovement PLAYER, RivalLeavesPlayerMovement
     turnobject PLAYER, UP
	 setscene SCENE_OAKSLAB_NOOP
	special HealParty
	playmapmusic
	setevent EVENT_FIRST_RIVAL_BATTLE
	sjump ProfOakScript
	end


;;;;;;;;;;BATTLETEST	  
AshBattleScript1:
	turnobject PLAYER, UP
	opentext
	writetext AshBattleText
	waitbutton
	closetext
;	sjump DetermineMon1
;	end	

.DetermineMon2
   checkevent EVENT_GOT_BULBASAUR_FROM_OAK
   iftrue AshBulbasaurMovement
   checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
   iftrue AshSquirtleMovement
   checkevent EVENT_GOT_CHARMANDER_FROM_OAK
   iftrue AshCharmanderMovement
   end

AshBulbasaurMovement:
      applymovement OAKSLAB_RIVAL_ASH, OaksLab_GaryBattleMovement1
	  sjump AshBattle
	  end
AshSquirtleMovement:
      applymovement OAKSLAB_RIVAL_ASH, OaksLab_GaryBattleMovement2
	  sjump AshBattle
	  end
AshCharmanderMovement:
      applymovement OAKSLAB_RIVAL_ASH, OaksLab_GaryBattleMovement3
	  sjump AshBattle
	  end



;;;;;;;;;;;BATTLETEST	  
	  
AshBattle:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15

	playmusic MUSIC_RIVAL_ENCOUNTER

	checkevent EVENT_GOT_BULBASAUR_FROM_OAK
	iftrue .Charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .Bulbasaur
	
	
	winlosstext AshRivalText_Win, AshRivalLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL_ASH, RIVAL_ASH_1_SQUIRTLE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Charmander:
	winlosstext AshRivalText_Win, AshRivalLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL_ASH, RIVAL_ASH_1_CHARMANDER
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Bulbasaur:
	winlosstext AshRivalText_Win, AshRivalLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL_ASH, RIVAL_ASH_1_BULBASAUR
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AshRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AshRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
     turnobject PLAYER, LEFT
     applymovement OAKSLAB_RIVAL_ASH, OaksLab_RivalLeavesMovement
	 playsound SFX_ENTER_DOOR
	 waitsfx
	 disappear OAKSLAB_RIVAL_ASH
	
	 applymovement PLAYER, RivalLeavesPlayerMovement
	 turnobject PLAYER, UP
	 setscene SCENE_OAKSLAB_NOOP
	special HealParty
	playmapmusic
	setevent EVENT_FIRST_RIVAL_BATTLE
	sjump ProfOakScript
	end

;;;;;;;;;;BATTLETEST	  



	
OakCharmanderPokeBallScript1:

    disappear OAKSLAB_CHARMANDER
	disappear OAKSLAB_SQUIRTLE
	disappear OAKSLAB_BULBASAUR
	
    

OakCharmanderPokeBallScript2:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	appear OAKSLAB_CHARMANDER
	turnobject OAKSLAB_OAK, DOWN
	applymovement PLAYER, Oak_Trainer_Movement
	applymovement OAKSLAB_CHARMANDER, Oak_Charmander_Movement
	refreshscreen
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCharmanderText
	yesorno
	applymovement OAKSLAB_CHARMANDER, Oak_Charmander_Movement2
	disappear OAKSLAB_CHARMANDER
	iffalse DidntChooseKantoStarterScript
;	setevent EVENT_GOT_CHARMANDER_FROM_OAK
	setevent EVENT_CHARMANDER_POKEBALL_IN_OAKS_LAB
	; appear OAKSLAB_POKE_BALL1
	; appear OAKSLAB_POKE_BALL2
	disappear OAKSLAB_POKE_BALL3
	disappear OAKSLAB_CHARMANDER
	writetext ChoseKantoStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHARMANDER
	writetext ReceivedKantoStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	
	givepoke CHARMANDER, 5, MASTER_BALL
	closetext
	
	setevent EVENT_GOT_CHARMANDER_FROM_OAK

	
	applymovement OAKSLAB_RIVAL_GARY, PickedCharmanderRivalMovement
	applymovement OAKSLAB_RIVAL_ASH, PickedCharmanderRivalMovement
	; readvar VAR_FACING
	; ifequal RIGHT, OakDirectionsScript
	clearevent EVENT_OAK_TOGGLE
    sjump GotMonDetermineScript
   ;sjump OakDirectionsScript
	end
	
OakSquirtlePokeBallScript1:

    disappear OAKSLAB_SQUIRTLE
	disappear OAKSLAB_CHARMANDER
	disappear OAKSLAB_BULBASAUR
	
	
OakSquirtlePokeBallScript2:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	appear OAKSLAB_SQUIRTLE
	turnobject OAKSLAB_OAK, DOWN
	applymovement PLAYER, Oak_Trainer_Movement
	applymovement OAKSLAB_SQUIRTLE, Oak_Squirtle_Movement
	refreshscreen
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeSquirtleText
	yesorno
	applymovement OAKSLAB_SQUIRTLE, Oak_Squirtle_Movement2
	disappear OAKSLAB_SQUIRTLE

	iffalse DidntChooseKantoStarterScript

	setevent EVENT_SQUIRTLE_POKEBALL_IN_OAKS_LAB

	disappear OAKSLAB_POKE_BALL2
	disappear OAKSLAB_SQUIRTLE
	writetext ChoseKantoStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, SQUIRTLE
	writetext ReceivedKantoStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke SQUIRTLE, 5, MASTER_BALL
	closetext
	
	setevent EVENT_GOT_SQUIRTLE_FROM_OAK

	
	
	applymovement OAKSLAB_RIVAL_GARY, PickedSquirtleRivalMovement
	applymovement OAKSLAB_RIVAL_ASH, PickedSquirtleRivalMovement
	; readvar VAR_FACING
	; ifequal RIGHT, OakDirectionsScript
	clearevent EVENT_OAK_TOGGLE
	sjump GotMonDetermineScript
   ;sjump OakDirectionsScript
   end

OakBulbasaurPokeBallScript1:

    disappear OAKSLAB_BULBASAUR
	disappear OAKSLAB_SQUIRTLE
	disappear OAKSLAB_CHARMANDER


OakBulbasaurPokeBallScript2:  
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	appear OAKSLAB_BULBASAUR
	turnobject OAKSLAB_OAK, DOWN
	applymovement PLAYER, Oak_Trainer_Movement
	applymovement OAKSLAB_BULBASAUR, Oak_Bulbasaur_Movement
	refreshscreen
;	setflag ENGINE_UNOWN_DEX
;	callasm UnownA
	pokepic BULBASAUR
;	trainerpic RIVAL_GARY
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeBulbasaurText
	yesorno
	applymovement OAKSLAB_BULBASAUR, Oak_Bulbasaur_Movement2
	disappear OAKSLAB_BULBASAUR
	iffalse DidntChooseKantoStarterScript
;	setevent EVENT_GOT_BULBASAUR_FROM_OAK
	setevent EVENT_BULBASAUR_POKEBALL_IN_OAKS_LAB
	disappear OAKSLAB_POKE_BALL1
	disappear OAKSLAB_BULBASAUR
	writetext ChoseKantoStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, BULBASAUR
	writetext ReceivedKantoStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke BULBASAUR, 5, MASTER_BALL
	closetext
	
	setevent EVENT_GOT_BULBASAUR_FROM_OAK
	clearevent EVENT_GOT_SQUIRTLE_FROM_OAK
	clearevent EVENT_GOT_CHARMANDER_FROM_OAK
	
	applymovement OAKSLAB_RIVAL_GARY, PickedBulbasaurRivalMovement
	applymovement OAKSLAB_RIVAL_ASH, PickedBulbasaurRivalMovement
	; readvar VAR_FACING
	; ifequal RIGHT, OakDirectionsScript
	clearevent EVENT_OAK_TOGGLE
    sjump GotMonDetermineScript
   ;sjump OakDirectionsScript
   end

UnownA:
    ld a, 1
 	ld [wUnownLetter], a
	ret

DidntChooseKantoStarterScript:
	writetext DidntChooseKantoStarterText
	waitbutton
	closetext
	end

GotMonDetermineScript:
   setevent EVENT_GOT_A_POKEMON_FROM_OAK
   readmem wPlayerCostume
   ifequal 3, GotMonAshScript
   ifequal 0, GotMonGaryScript
   end
 
   
GotMonGaryScript:
    opentext
	writetext GaryPickMonText
	waitbutton
	closetext

   checkevent EVENT_GOT_BULBASAUR_FROM_OAK
   iftrue .RivalGaryGotCharmander
   
   checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
   iftrue .RivalGaryGotBulbasaur
   
   checkevent EVENT_GOT_CHARMANDER_FROM_OAK
   iftrue .RivalGaryGotSquirtle
   end
   
.RivalGaryGotBulbasaur
	disappear OAKSLAB_POKE_BALL1
     getmonname STRING_BUFFER_3, BULBASAUR
	 opentext
     writetext RivalGaryGotPokemonText
	 playsound SFX_CAUGHT_MON
	 waitsfx
	 closetext
	end
	
.RivalGaryGotSquirtle
	disappear OAKSLAB_POKE_BALL2
    getmonname STRING_BUFFER_3, SQUIRTLE
    opentext
	writetext RivalGaryGotPokemonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	end
	
.RivalGaryGotCharmander
	 disappear OAKSLAB_POKE_BALL3 
    getmonname STRING_BUFFER_3, CHARMANDER
    opentext
	writetext RivalGaryGotPokemonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	end	

   
GotMonAshScript:
    opentext
	writetext AshPickMonText
	waitbutton
	closetext  
	
   checkevent EVENT_GOT_BULBASAUR_FROM_OAK
   iftrue .RivalAshGotCharmander
   
   checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
   iftrue .RivalAshGotBulbasaur
   
   checkevent EVENT_GOT_CHARMANDER_FROM_OAK
   iftrue .RivalAshGotSquirtle
   end
   
.RivalAshGotBulbasaur
	disappear OAKSLAB_POKE_BALL1
     getmonname STRING_BUFFER_3, BULBASAUR
	 opentext
     writetext RivalAshGotPokemonText
	 playsound SFX_CAUGHT_MON
	 waitsfx
	 closetext
	end
	
.RivalAshGotSquirtle
	disappear OAKSLAB_POKE_BALL2
     getmonname STRING_BUFFER_3, SQUIRTLE
	 opentext
     writetext RivalAshGotPokemonText
	 playsound SFX_CAUGHT_MON
	 waitsfx
	 closetext
	end
	
.RivalAshGotCharmander 
	disappear OAKSLAB_POKE_BALL3
     getmonname STRING_BUFFER_3, CHARMANDER
	 opentext
     writetext RivalAshGotPokemonText
	 playsound SFX_CAUGHT_MON
	 waitsfx
	 closetext
	end	
   
	
OakDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext OakDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_OAK
	opentext
	writetext GotOaksNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject OAKSLAB_OAK, LEFT
	opentext
	writetext OakDirectionsText2
	waitbutton
	closetext
	turnobject OAKSLAB_OAK, DOWN
	opentext
	writetext OakDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_OAKSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

; OakDescribesMrPokemonScript:
	; writetext OakDescribesMrPokemonText
	; waitbutton
	; closetext
	; end

LookAtOakPokeBallScript:
	opentext
	writetext OakPokeBallText
	waitbutton
	closetext
	end
	
PokedexScript:
	opentext
	writetext PokedexText
	waitbutton
	closetext
	end


OakJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, OakJumpDownScript
	ifequal UP, OakJumpUpScript
	ifequal LEFT, OakJumpLeftScript
	ifequal RIGHT, OakJumpRightScript
	end

OakJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, OakJumpUpScript
	ifequal UP, OakJumpDownScript
	ifequal LEFT, OakJumpRightScript
	ifequal RIGHT, OakJumpLeftScript
	end

OakJumpUpScript:
	applymovement OAKSLAB_OAK, OakJumpUpMovement
	opentext
	end

OakJumpDownScript:
	applymovement OAKSLAB_OAK, OakJumpDownMovement
	opentext
	end

OakJumpLeftScript:
	applymovement OAKSLAB_OAK, OakJumpLeftMovement
	opentext
	end

OakJumpRightScript:
	applymovement OAKSLAB_OAK, OakJumpRightMovement
	opentext
	end



; OaksAideScript_GivePotion:
	; opentext
	; writetext OaksAideText_GiveYouPotion
	; promptbutton
	 ; verbosegiveitem FULL_RESTORE, 99
	 ; verbosegiveitem SQUIRTBOTTLE
	 ; giveitem MAX_REVIVE, 99
	 ; giveitem BICYCLE
	; giveitem POKE_BALL, 99
	; ; giveitem BERRY, 99
	; giveitem MASTER_BALL, 99
	; giveitem ULTRA_BALL, 99
	; giveitem GREAT_BALL, 99
	; giveitem LEVEL_BALL, 99
	; giveitem LOVE_BALL, 99
	; giveitem LURE_BALL, 99
	; giveitem MOON_BALL, 99
	; giveitem FAST_BALL, 99
	; giveitem FRIEND_BALL, 99
	; giveitem HEAVY_BALL, 99
	; giveitem PREMIER_BALL, 99
	; giveitem GS_BALL, 99
	; ; givepoke PICHU, 5, SLOWPOKETAIL
	; ; givepoke KANGASKID, 5, SLOWPOKETAIL
	; ; givepoke SHELLSTER, 5, SLOWPOKETAIL
	; ; givepoke CHANSEY, 5, SLOWPOKETAIL
	; writetext OaksAideText_AlwaysBusy
	; waitbutton
	; closetext
	; setscene SCENE_OAKSLAB_NOOP
	; end



 OaksAideScript:
    opentext
 	writetext OaksAideText_Intro
	waitbutton
	closetext
     end




OaksLabTravelTip1:
	jumptext OaksLabTravelTip1Text

OaksLabTravelTip2:
	jumptext OaksLabTravelTip2Text

OaksLabTravelTip3:
	jumptext OaksLabTravelTip3Text

OaksLabTravelTip4:
	jumptext OaksLabTravelTip4Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OaksLabTrashcan2: ; unreferenced
	jumpstd TrashCanScript

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLab_WalkUpToOakMovement:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
OaksLab_WalkUpToOakMovement2:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OaksLab_WalkUpToOakMovement3:
	step UP
	step UP
	step_end	
	
OaksLab_RivalWalkUpToOakMovement:	
	step UP
	step UP
	step UP
	step UP
	step_end

OaksLab_SlowStepUpMovement:
  slow_step UP
  step_end
	
OaksLab_SlowStepDownMovement:
  slow_step DOWN
  step_end
  
 OaksLab_SlowStepLeftMovement:
  slow_step LEFT
  step_end   
 
 OaksLab_SlowStepRightMovement:
  slow_step RIGHT
  step_end 
  
 OaksLab_NormalStepUpMovement:
  step UP
  step_end
	
OaksLab_NormalStepDownMovement:
  step DOWN
  step_end
  
 OaksLab_NormalStepLeftMovement:
  step LEFT
  step_end   

 OaksLab_DexStepLeftMovement:
  step LEFT
  step LEFT
  step LEFT
  step LEFT
  step_end  
  
 OaksLab_NormalStepRightMovement:
  step RIGHT
  step_end  
	
OaksLab_RivalLookUp:
    turn_head UP
    step_end
	
OaksLab_CantLeaveMovement:
	step UP
	step_end
	
Oak_Trainer_Movement:
	big_step DOWN
	turn_head UP
	step_end
	
Oak_Trainer_Movement1:
    applymovement PLAYER, Trainer_Movement2	
	step_end
Oak_Trainer_Movement2:
	step UP
	step_end
	
Oak_Bulbasaur_Movement:
	big_step DOWN
	step_end
Oak_Bulbasaur_Movement2:
	big_step UP
	step_end
Oak_Bulbasaur_Movement3:
	big_step UP
	step_end
	
	
Oak_Squirtle_Movement:
	big_step DOWN
	step_end
Oak_Squirtle_Movement2:
	big_step UP
	step_end

Oak_Charmander_Movement:
	big_step DOWN
	step_end
Oak_Charmander_Movement2:
	big_step UP
	step_end		

OaksAideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

OaksAideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

OaksAideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

OaksAideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

OakJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

OakJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

OakJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

OakJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

OaksLab_OakToDefaultPositionMovement1:
;	step UP
	step_end

OaksLab_OakToDefaultPositionMovement2:
;	step RIGHT
;	step RIGHT
;	step UP
;	turn_head DOWN
	step_end

AfterCharmanderMovement:
;	step LEFT
;	step UP
;	turn_head UP
	step_end

AfterSquirtleMovement:
;	step LEFT
;	step LEFT
;	step UP
;	turn_head UP
	step_end

AfterBulbasaurMovement:
;	step LEFT
;	step LEFT
;	step LEFT
;	step UP
;	turn_head UP
	step_end
	
PickedBulbasaurRivalMovement:	
   step RIGHT
   step RIGHT
   step RIGHT
   step RIGHT
   turn_head UP
   step_end
   
PickedSquirtleRivalMovement:
	 step RIGHT
	 step RIGHT
	 turn_head UP
	 step_end
	 
PickedCharmanderRivalMovement:	
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end
	
OaksLab_GaryBattleMovement1:
    step LEFT
    step LEFT
    step LEFT
	step DOWN
    step_end
	
OaksLab_GaryBattleMovement2:
   step LEFT
   step DOWN
    step_end

OaksLab_GaryBattleMovement3:
    step LEFT
    step LEFT
	step DOWN
    step_end
	
StepRightMovement1:
    step RIGHT
    step_end	

StepLeftMovement1:
    step LEFT
    step_end
	
OaksLab_RivalLeavesMovement:
   step LEFT
   step DOWN   
   step DOWN   
   step DOWN   
   step DOWN   
   step DOWN
   step DOWN
   step_end

OaksLab_RivalLeavesMovement2:
   step DOWN   
   step DOWN   
   step DOWN   
   step DOWN   
   step DOWN
   step DOWN
   step_end

RivalLeavesPlayerMovement:   
	step UP
	step UP
	step UP
	step_end
	
RivalGaryScript:
    checkevent EVENT_GOT_A_POKEMON_FROM_OAK
    iftrue RivalGaryScript3
	iffalse RivalGaryScript0
	
RivalGaryScript0:	
    checkevent EVENT_OAK_TOGGLE
	iffalse RivalGaryScript1
	iftrue RivalGaryScript2
	end
	
RivalGaryScript1:	
	faceplayer
	opentext
	writetext RivalGaryText_1
	waitbutton
	closetext
	end
	
RivalGaryScript2:	
	faceplayer
	opentext
	writetext RivalGaryText_2
	waitbutton
	closetext
	end
	
RivalGaryScript3:	
	faceplayer
	opentext
	writetext RivalGaryText_3
	waitbutton
	closetext
	end

RivalAshScript:
    checkevent EVENT_GOT_A_POKEMON_FROM_OAK
    iftrue RivalAshScript3
	iffalse RivalAshScript0	

RivalAshScript0:
    checkevent EVENT_OAK_TOGGLE
	iffalse RivalAshScript1
	iftrue RivalAshScript2
	end

RivalAshScript1:
	faceplayer
	opentext
	writetext RivalAshText_1
	waitbutton
	closetext
	end		

RivalAshScript2:
	faceplayer
	opentext
	writetext RivalAshText_2
	waitbutton
	closetext
	end

RivalAshScript3:
	faceplayer
	opentext
	writetext RivalAshText_3
	waitbutton
	closetext
	end			



OakText_IntroAsh:
	text "<GARY>: Gramps!"
	line "I'm fed up with"
    cont "waiting!"


	para "OAK: Hmm? <GARY>?"
	line "Why are you here"
	cont "already?"

	para "I said for you to"
	line "come by later..."

	para "Ah, whatever!"
	line "Just wait there."

	para "Look, <PLAYER>!"
	line "Do you see these"
    cont "balls on the"
    cont "table?"

	para "These are a few"
    line "of my prized"
	cont "# BALLs!"
	
	para "They contain rare"
    line "#MON inside!"

	para "You may choose"
	line "one of them as"
    cont "your partner!"
    done
	
OakText_IntroAsh2:
	text "<GARY>: Hey!"
	line "Gramps! What"
    cont "about me?"

	para "OAK: Be patient,"
	line "<GARY>, I'll give"
    cont "you one in a"
	cont "moment!"
	done


OakText_IntroGary:
	text "<ASH>: <PLAYER>!"
	line "Isn't this"
    cont "exciting!?"


	para "OAK: Hmm? <ASH>?"
	line "Why are you here"
	cont "already?"

	para "I said for you to"
	line "come by later..."

	para "Ah, whatever!"
	line "Just wait there."

	para "Look, <PLAYER>!"
	line "Do you see these"
    cont "balls on the"
    cont "table?"

	para "These are a few"
    line "of my prized"
	cont "# BALLs!"
	
	para "They contain rare"
    line "#MON inside!"

	para "You may choose"
	line "one of them as"
    cont "your partner!"
    done
	
OakText_IntroGary2:
	text "<ASH>: Hey!"
	line "Professor!"
    cont "What about me?"

	para "OAK: Be patient,"
	line "<ASH>, I'll give"
    cont "you one in a"
	cont "moment!"
	done


OakText_Accepted:
	text "Thanks, <PLAY_G>!"

	para "You're a great"
	line "help!"
	done

OakText_Refused:
	text "But… Please, I"
	line "need your help!"
	done

OakText_ResearchAmbitions:
	text "When I announce my"
	line "findings, I'm sure"

	para "we'll delve a bit"
	line "deeper into the"

	para "many mysteries of"
	line "#MON."

	para "You can count on"
	line "it!"
	done

OakText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Okay…"
	done

OakText_MissionFromMrPokemon:
	text "Hey, listen."

	para "I have an acquain-"
	line "tance called MR."
	cont "#MON."

	para "He keeps finding"
	line "weird things and"

	para "raving about his"
	line "discoveries."

	para "Anyway, I just got"
	line "an e-mail from him"

	para "saying that this"
	line "time it's real."

	para "It is intriguing,"
	line "but we're busy"

	para "with our #MON"
	line "research…"

	para "Wait!"

	para "I know!"

	para "<PLAY_G>, can you"
	line "go in our place?"
	done

OakText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

OakText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

OaksLabWhereGoingText:
	text "OAK: Wait! Where"
	line "are you going?"
	done

TakeCharmanderText:
	text "OAK: You'll take"
	line "CHARMANDER, the"
	cont "fire #MON?"
	done

TakeSquirtleText:
	text "OAK: Do you want"
	line "SQUIRTLE, the"
	cont "water #MON?"
	done

TakeBulbasaurText:
	text "OAK: So, you like"
	line "BULBASAUR, the"
	cont "grass #MON?"
	done

DidntChooseKantoStarterText:
	text "OAK: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseKantoStarterText:
	text "OAK: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedKantoStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

RivalAshGotPokemonText:
	text "<ASH> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done
	
RivalGaryGotPokemonText:
	text "<GARY> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

GaryBattleText:
    text "<GARY>: Wait,"
	line "<PLAYER>!"
	
	para "Let's check out"
	line "our #MON!"
	
	para "Come on, I'll take"
    line "you on!"
	done	

AshBattleText:
    text "<ASH>: Wait,"
	line "<PLAYER>!"
	
	para "Let's check out"
	line "our #MON!"
	done

OakDirectionsText1:
	text "MR.#MON lives a"
	line "little bit beyond"

	para "CHERRYGROVE, the"
	line "next city over."

	para "It's almost a"
	line "direct route"

	para "there, so you"
	line "can't miss it."

	para "But just in case,"
	line "here's my phone"

	para "number. Call me if"
	line "anything comes up!"
	done

OakDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

OakDirectionsText3:
	text "<PLAY_G>, I'm"
	line "counting on you!"
	done

GotOaksNumberText:
	text "<PLAYER> got OAK's"
	line "phone number."
	done

OakDescribesMrPokemonText:
	text "MR.#MON goes"
	line "everywhere and"
	cont "finds rarities."

	para "Too bad they're"
	line "just rare and"
	cont "not very useful…"
	done

OakPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.OAK."
	done

PokedexText:
	text "It's a high-tech"
	line "encyclopedia, all"
	cont "about #MON!"
	
	para "...but it doesn't"
	line "seem to have any"
	cont "data!"
	done

GaryPickMonText:
    text "<GARY>: I'll take"
    line "this one, then!"	
    
	para "<GARY>: You know"
	line "about type"
	cont "advantages, right?"
	done

AshPickMonText:
    text "<ASH>: I'll take"
    line "this one, then!"	
    
	para "<ASH>: I know"
	line "all about"
	cont "type advantages!"
    done
	

; OaksLabHealingMachineText1:
	; text "I wonder what this"
	; line "does?"
	; done

; OaksLabHealingMachineText2:
	; text "Would you like to"
	; line "heal your #MON?"
	; done

; OakAfterTheftText1:
	; text "OAK: <PLAY_G>, this"
	; line "is terrible…"

	; para "Oh, yes, what was"
	; line "MR.#MON's big"
	; cont "discovery?"
	; done

; OakAfterTheftText2:
	; text "<PLAYER> handed"
	; line "the MYSTERY EGG to"
	; cont "PROF.OAK."
	; done

; OakAfterTheftText3:
	; text "OAK: This?"
	; done

; OakAfterTheftText4:
	; text "But… Is it a"
	; line "#MON EGG?"

	; para "If it is, it is a"
	; line "great discovery!"
	; done

; OakAfterTheftText5:
	; text "OAK: What?!?"

	; para "PROF.OAK gave you"
	; line "a #DEX?"

	; para "<PLAY_G>, is that"
	; line "true? Th-that's"
	; cont "incredible!"

	; para "He is superb at"
	; line "seeing the poten-"
	; cont "tial of people as"
	; cont "trainers."

	; para "Wow, <PLAY_G>. You"
	; line "may have what it"

	; para "takes to become"
	; line "the CHAMPION."

	; para "You seem to be"
	; line "getting on great"
	; cont "with #MON too."

	; para "You should take"
	; line "the #MON GYM"
	; cont "challenge."

	; para "The closest GYM"
	; line "would be the one"
	; cont "in VIOLET CITY."
	; done

; OakAfterTheftText6:
	; text "…<PLAY_G>. The"
	; line "road to the"

	; para "championship will"
	; line "be a long one."

	; para "Before you leave,"
	; line "make sure that you"
	; cont "talk to your mom."
	; done

; OakStudyingEggText:
	; text "OAK: Don't give"
	; line "up! I'll call if"

	; para "I learn anything"
	; line "about that EGG!"
	; done

; OaksAideHasEggText:
	; text "OAK: <PLAY_G>?"
	; line "Didn't you meet my"
	; cont "assistant?"

	; para "He should have met"
	; line "you with the EGG"

	; para "at VIOLET CITY's"
	; line "#MON CENTER."

	; para "You must have just"
	; line "missed him. Try to"
	; cont "catch him there."
	; done

; OakWaitingEggHatchText:
	; text "OAK: Hey, has that"
	; line "EGG changed any?"
	; done

; OakThoughtEggHatchedText:
	; text "<PLAY_G>? I thought"
	; line "the EGG hatched."

	; para "Where is the"
	; line "#MON?"
	; done

; ShowOakTogepiText1:
	; text "OAK: <PLAY_G>, you"
	; line "look great!"
	; done

; ShowOakTogepiText2:
	; text "What?"
	; line "That #MON!?!"
	; done

; ShowOakTogepiText3:
	; text "The EGG hatched!"
	; line "So, #MON are"
	; cont "born from EGGS…"

	; para "No, perhaps not"
	; line "all #MON are."

	; para "Wow, there's still"
	; line "a lot of research"
	; cont "to be done."
	; done

; OakGiveEverstoneText1:
	; text "Thanks, <PLAY_G>!"
	; line "You're helping"

	; para "unravel #MON"
	; line "mysteries for us!"

	; para "I want you to have"
	; line "this as a token of"
	; cont "our appreciation."
	; done

; OakGiveEverstoneText2:
	; text "That's an"
	; line "EVERSTONE."

	; para "Some species of"
	; line "#MON evolve"

	; para "when they grow to"
	; line "certain levels."

	; para "A #MON holding"
	; line "the EVERSTONE"
	; cont "won't evolve."

	; para "Give it to a #-"
	; line "MON you don't want"
	; cont "to evolve."
	; done

; OakText_CallYou:
	; text "OAK: <PLAY_G>, I'll"
	; line "call you if any-"
	; cont "thing comes up."
	; done

; OaksAideText_AfterTheft:
	; text "…sigh… That"
	; line "stolen #MON."

	; para "I wonder how it's"
	; line "doing."

	; para "They say a #MON"
	; line "raised by a bad"

	; para "person turns bad"
	; line "itself."
	; done

; OakGiveMasterBallText1:
	; text "OAK: Hi, <PLAY_G>!"
	; line "Thanks to you, my"

	; para "research is going"
	; line "great!"

	; para "Take this as a"
	; line "token of my"
	; cont "appreciation."
	; done

; OakGiveMasterBallText2:
	; text "The MASTER BALL is"
	; line "the best!"

	; para "It's the ultimate"
	; line "BALL! It'll catch"

	; para "any #MON with-"
	; line "out fail."

	; para "It's given only to"
	; line "recognized #MON"
	; cont "researchers."

	; para "I think you can"
	; line "make much better"

	; para "use of it than I"
	; line "can, <PLAY_G>!"
	; done

; OakGiveTicketText1:
	; text "OAK: <PLAY_G>!"
	; line "There you are!"

	; para "I called because I"
	; line "have something for"
	; cont "you."

	; para "See? It's an"
	; line "S.S.TICKET."

	; para "Now you can catch"
	; line "#MON in KANTO."
	; done

; OakGiveTicketText2:
	; text "The ship departs"
	; line "from OLIVINE CITY."

	; para "But you knew that"
	; line "already, <PLAY_G>."

	; para "After all, you've"
	; line "traveled all over"
	; cont "with your #MON."

	; para "Give my regards to"
	; line "PROF.OAK in KANTO!"
	; done

; OaksLabMonEggText: ; unreferenced
	; text "It's the #MON"
	; line "EGG being studied"
	; cont "by PROF.OAK."
	; done

; OaksAideText_GiveYouPotion:
	; text "<PLAY_G>, I want"
	; line "you to have this"
	; cont "for your errand."
	; done

OaksAideText_Intro:
	text "I work as"
	line "PROF. OAK's"
	cont "AIDE!"
	done
	
OaksAideText_AlwaysBusy:
	text "There are only two"
	line "of us, so we're"
	cont "always busy."
	done
	
RivalGaryText_1:
	text "<GARY>: Yo"
	line "<PLAYER>! Gramps"
	cont "isn't around!"
	
	para "I ran here 'cos"
	line "he said he had a"
	cont "#MON for me!"
	done
	
RivalGaryText_2:
	text "<GARY>: Humph!"
	line "I'll get a better"
	cont "#MON than you!"
	done

RivalGaryText_3:
	text "<GARY>: My"
	line "#MON looks a"
	cont "lot stronger!"
	done		

RivalAshText_1:
	text "<ASH>: Hey"
	line "<PLAYER>! Today's"
	cont "the big day!"
	
	para "We're gonna get"
	line "our very own"
	cont "#MON!"
	
	para "But where's"
	line "Prof. OAK?"
	done

RivalAshText_2:
	text "<ASH>: I can't"
	line "wait to have my"
	cont "first real"
	cont "#MON battle!"
	done

RivalAshText_3:
	text "<ASH>: I wonder"
	line "whose #MON"
	cont "is stronger?"
	done		

OaksAideText_TheftTestimony:
	text "There was a loud"
	line "noise outside…"

	para "When we went to"
	line "look, someone"
	cont "stole a #MON."

	para "It's unbelievable"
	line "that anyone would"
	cont "do that!"

	para "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"

	para "person turns bad"
	line "itself."
	done

OaksAideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Use these on your"
	line "#DEX quest!"
	done

OaksAideText_ExplainBalls:
	text "To add to your"
	line "#DEX, you have"
	cont "to catch #MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
	done

OaksLabOfficerText1:
	text "I heard a #MON"
	line "was stolen here…"

	para "I was just getting"
	line "some information"
	cont "from PROF.OAK."

	para "Apparently, it was"
	line "a young male with"
	cont "long, red hair…"

	para "What?"

	para "You battled a"
	line "trainer like that?"

	para "Did you happen to"
	line "get his name?"
	done

OaksLabOfficerText2:
	text "OK! So <GARY>"
	line "was his name."

	para "Thanks for helping"
	line "my investigation!"
	done

OaksLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

OaksLabWindowText2:
	text "He broke in"
	line "through here!"
	done

OaksLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

OaksLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

OaksLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

OaksLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

OaksLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.OAK"
	cont "ate is in there…"
	done

OaksLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done
	
	
; GaryRivalText_Seen:
	; text "<……> <……> <……>"

	; para "You got a #MON"
	; line "at the LAB."

	; para "What a waste."
	; line "A wimp like you."

	; para "<……> <……> <……>"

	; para "Don't you get what"
	; line "I'm saying?"

	; para "Well, I too, have"
	; line "a good #MON."

	; para "I'll show you"
	; line "what I mean!"
	; done

GaryRivalText_Win:
	text "<GARY>: WHAT?"
	line "Unbelievable!"
	cont "I picked the"
	cont "wrong #MON!"	
	done

GaryRivalText_YouWon:
	text "<GARY>: Heh!"
    line "You should make"
	cont "your #MON fight"
	cont "to toughen it up!"
  
	para "<PLAYER>! Gramps!"
	line "Smell ya later!"
	done

GaryRivalLossText:
	text "<GARY>: Yeah! Am"
	line "I great or what?"
	done

GaryRivalText_YouLost:
	text "<GARY>: Okay!"
    line "I'll make my"
	cont "#MON fight to"
	cont "toughen it up!"
	
	para "<PLAYER>! Gramps!"
	line "Smell ya later!"
	done	
;;;;;	
	
AshRivalText_Win:
	text "<ASH>: No!"
	line "I lost the battle!"
	done

AshRivalText_YouWon:
	text "<ASH>: Let's"
    line "keep getting" 
	cont "stronger together!"
	
	; para "<PLAYER>! I'll beat"
	; line "you next time!"
	
	para "Thanks again for"
	line "the #MON,"
    cont "Professor!"
	
	para "I won't let you"
	line "down!"
	done

AshRivalLossText:
	text "<ASH>: Yeah! I won"
	line "my very first"
	cont "#MON battle!"
	done

AshRivalText_YouLost:
	text "<ASH>: Okay!"
    line "I'll train my"
	cont "#MON to toughen"
	cont "it up!"
	
	para "<PLAYER>! I'll beat"
	line "you next time!"
	
	para "Thanks again for"
	line "the #MON,"
	cont "Professor!"
	
	para "I won't let you"
	line "down!"
	done

OakText_Go_On:	
	text "OAK: Go on!"
	line "Pick one!"
    done
	
OakText_PickedMon:	
	text "OAK: <PLAYER>,"
	line "#MON thrive on"
	cont "using their power!"
	
	para "You can raise your"
	line "young #MON"
	cont "by partaking in"
	cont "#MON battles!"
	
	para "If you're interest-"
	line "ed in taking the"
	cont "GYM challenge, you"
	cont "can go on to the" 
	cont "next town!"
	done
	
OakText_GoToViridian1:	
	text "Oh!"

	para "I've been so caught"
	line "up in my #MON"
	cont "research!"

   	para "I can't even remem-"
	line "ber who the new"
	cont "VIRIDIAN GYM"
    cont "Leader is!"
	
	; para "It used to be a"
	; line "boy about your age"
	; cont "named YUJIROU!"		
    done	
	
OakText_GoToViridian2:	
	text "But, if you're"
	line "planning on going"
	cont "on ahead to"
    cont "VIRIDIAN CITY,"
    cont "could I get you"
	cont "to pick something"
    cont "up for me?"

    para "I have a package"
    line "due for delivery"
    cont "at the #MART!"

    para "I'll tell you what,"
	line "<PLAYER>. When"
    cont "you get back,"
    cont "I'll have something"
    cont "special for you!"	
    done	

PokedexSceneTextAsh:
   text "OAK: Ah! <PLAYER>!"
   line "<GARY>!"
   done
   
PokedexSceneTextGary:
   text "OAK: Ah! <PLAYER>!"	
   line "<ASH>!"
   done
   
PokedexSceneTextCont:
   text "There you both"
   line "are!"
   
   para "How are my old"
   line "#MON doing?"
   
   cont "Well, they seem"
   cont "to like you both."
   
   para "Perhaps you two"
   line "have what it"
   cont "takes to be"
   cont "#MON Trainers,"
   cont "after all!"
   
   para "But be sure not"
   line "to push them too"
   cont "hard!"

   para "#MON are living"
   line "creatures, after"
   cont "all!"   
   done
   
PokedexSceneTextCont2:
   text "What?"
   
   para "Oh, that's right!"
   line "I sent you to"
   cont "pick up my"
   cont "special delivery"
   cont "from VIRIDIAN"
   cont "#MART!"
   done
   
DeliveredParcel:
   text "<PLAYER> delivered"
   line "OAK's PARCEL!"
   done

DeliveredParcel2:
   text "Ah! These are the"
   line "custom # BALLs"
   cont "I ordered!"
   
   para "Thank you!"
   done
   
DeliveredParcel3Gary:
   text "<GARY>: Huh?"
   line "Custom # BALLs?"
   cont "What are you"
   cont "working on,"
   cont "Gramps?"
   done
   
 DeliveredParcel3Ash:
   text "<ASH>: Huh?"
   line "Custom # BALLs?"
   cont "What are you"
   cont "working on,"
   cont "Professor?"
   done  

DeliveredParcel4:
   text "OAK: I can't"
   line "tell you just"
   cont "yet!"
   
   para "The research"
   line "is only in it's"
   cont "early stages!"
   done

DeliveredParcel5:
   text "OAK: However!"
   line "That's not all"
   cont "I've been working"
   cont "on!"
   
   para "I have a request"
   line "of you two."
   done

DeliveredParcel6:   
   text "On the desk there"
   line "is my greatest"
   cont "invention so far!"
   
   para "The #DEX!"
   line "It automatically"
   cont "records data on"
   cont "#MON you've"
   cont "seen or caught!"
   
   para "It's a high-tech"
   line "encyclopedia!"
   done      

DeliveredParcel7:
   text "OAK: <PLAYER>"
   line "and <GARY>! Take"
   cont "these with you!"
   done
   
DeliveredParcel8:
   text "OAK: <PLAYER>"
   line "and <ASH>! Take"
   cont "these with you!"
   done

OaksLab_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

OaksLab_DreamText:
   text "Throughout my"
   line "life, I have"
   cont "definitively"
   cont "documented"
   cont "about 150 kinds"
   cont "of #MON!"
   
   para "To make a complete"
   line "guide on all the"
   cont "#MON in the"
   cont "world..."
   cont "That was my dream!"
   
   para "But, I'm too old!"
   line "I can't do it!"
   
   para "So, I want you two"
   line "to fulfill my"
   cont "dream for me!"
   
   para "Get moving, you"
   line "two!"
   cont "This is a great"
   cont "undertaking in"
   cont "#MON history!"
   done
   
OaksLab_DreamText2:
   text "<GARY>: Alright,"
   line "Gramps! Leave it"
   cont "to me!"
   
   para "<PLAYER>, I hate to"
   line "say it, but I"
   cont "don't need you!"
   
   para "I've already got"
   line "my #GEAR!"
   cont "I've already got"
   cont "all the EXPANSION"
   cont "CARDs!"
   
   para "Maybe you can"
   line "borrow an old"
   cont "TOWN MAP from"
   cont "someone!"
   cont "Heh heh!"
   done
 
OaksLab_DreamText3:
   text "<ASH>: Alright,"
   line "Professor! Leave"
   cont "it to me!"
   
   para "<PLAYER>, I'm"
   line "gonna be the"
   cont "very best, like"
   cont "no-one ever was!"
     
   para "I better go"
   line "get a TOWN MAP"
   cont "from home!"
   done 
   
 OakText_Go_On2:	
	text "OAK: #MON"
	line "around the world"
	cont "wait for you,"
	cont "<PLAYER>!"
    done
   
OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events
	coord_event  4,  6, SCENE_OAKSLAB_CANT_LEAVE, OaksLabTryToLeaveScriptLeft
	coord_event  5,  6, SCENE_OAKSLAB_CANT_LEAVE, OaksLabTryToLeaveScriptRight


	; coord_event  4,  8, SCENE_OAKSLAB_AIDE_GIVES_POTION, OaksAideScript_WalkPotion1
	; coord_event  5,  8, SCENE_OAKSLAB_AIDE_GIVES_POTION, OaksAideScript_WalkPotion2
	; coord_event  4,  8, SCENE_OAKSLAB_AIDE_GIVES_POKE_BALLS, OaksAideScript_WalkBalls1
	; coord_event  5,  8, SCENE_OAKSLAB_AIDE_GIVES_POKE_BALLS, OaksAideScript_WalkBalls2

	def_bg_events
;	bg_event  0,  1, BGEVENT_READ, OaksLabHealingMachine
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  8, BGEVENT_READ, OaksLabTravelTip1
	bg_event  1,  8, BGEVENT_READ, OaksLabTravelTip2
	bg_event  2,  8, BGEVENT_READ, OaksLabTravelTip3
	bg_event  3,  8, BGEVENT_READ, OaksLabTravelTip4
	bg_event  6,  8, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  8, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  8, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  8, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
;	bg_event  0,  7, BGEVENT_READ, OaksLabWindow
	bg_event  0,  0, BGEVENT_DOWN, OaksLabPC

	def_object_events
	object_event  5,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, EVENT_OAK_IN_OAKS_LAB
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAideScript, EVENT_OAKS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1,  PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OakBulbasaurPokeBallScript1, EVENT_BULBASAUR_POKEBALL_IN_OAKS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1,  PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakSquirtlePokeBallScript1, EVENT_SQUIRTLE_POKEBALL_IN_OAKS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1,  PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakCharmanderPokeBallScript1, EVENT_CHARMANDER_POKEBALL_IN_OAKS_LAB
	object_event  6,  3, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1,  PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OakBulbasaurPokeBallScript2, EVENT_BULBASAUR_POKEBALL_IN_OAKS_LAB
	object_event  7,  3, SPRITE_SQUIRTLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1,  PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakSquirtlePokeBallScript2, EVENT_SQUIRTLE_POKEBALL_IN_OAKS_LAB
	object_event  8,  3, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1,  PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakCharmanderPokeBallScript2, EVENT_CHARMANDER_POKEBALL_IN_OAKS_LAB

	object_event  4,  4, SPRITE_GARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RivalGaryScript, EVENT_RIVAL_GARY_IN_OAKS_LAB
	object_event  4,  4, SPRITE_ASH, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RivalAshScript, EVENT_RIVAL_ASH_IN_OAKS_LAB
	object_event  2,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1,  PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokedexScript, EVENT_MART_BALL
	object_event  3,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1,  PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokedexScript, EVENT_MART_BALL
