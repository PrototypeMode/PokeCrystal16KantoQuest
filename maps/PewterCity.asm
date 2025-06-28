	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_COOLTRAINER_M
	const PEWTERCITY_REPEL_NERD
	const PEWTERCITY_MUSEUMGUY
	const PEWTERCITY_TOWN_BLOCK
	const PEWTERCITY_BROCK_MEET
	; const PEWTERCITY_BUG_CATCHER
	; const PEWTERCITY_GRAMPS
	; const PEWTERCITY_FRUIT_TREE1
	; const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	def_scene_scripts
	scene_script PewterCityRoadblockScene, SCENE_PEWTERCITY_ROADBLOCK
	scene_script PewterCityNoRoadblockScene, SCENE_PEWTERCITY_NOROADBLOCK
	scene_script PewterCityBrockMeetScene, SCENE_PEWTERCITY_BROCKMEET


	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlypointCallback

PewterCityRoadblockScene:
     checkflag ENGINE_BOULDERBADGE
	 iftrue .LetThrough
	 iffalse .end
	 end
	 
.LetThrough
    setscene 1
.end	
     end
	 
PewterCityNoRoadblockScene:
    checkflag ENGINE_BOULDERBADGE
	 iffalse .SwitchScene0
	  iftrue .CheckTeam
     end
	 
.CheckTeam
   readmem wTeamCount
   ifequal 0, .SwitchScene2
   ifgreater 0, .SwitchScene1

.SwitchScene0
   setscene 0	 
	 end
	 
 .SwitchScene1
    setscene 1	 
	 end	 
	 
 .SwitchScene2
    setscene 2	 
	 end
	 
	 
PewterCityBrockMeetScene:
     end
	 
PewterCityFlypointCallback:

    setmapscene PEWTER_MUSEUM_1F, SCENE_PEWTERMUSEUM_1F_CLERK
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
     clearflag ENGINE_BOULDERBADGE
	jumptextfaceplayer PewterCityCooltrainerFText
	
PewterCityCooltrainerMScript:
	jumptextfaceplayer PewterCityCooltrainerMText

PewterCityRepelNerdScript:
	opentext
	writetext PewterCityRepelNerdText
	yesorno
	iftrue .RepelYes
	iffalse .RepelNo

.RepelYes
    writetext PewterCityRepelNerdTextYes
	promptbutton
	closetext
	end
.RepelNo
    writetext PewterCityRepelNerdTextNo
	promptbutton
	closetext
	end
	
PewterCityMuseumGuyScript:
    faceplayer
	opentext
	writetext PewterCityMuseumGuyText
	yesorno
	iftrue .MuseumYes
	iffalse .MuseumNo
	end
	
.MuseumYes
    writetext PewterCityMuseumGuyTextYes
	promptbutton
	closetext
	end
	
.MuseumNo
    writetext PewterCityMuseumGuyTextNo
	promptbutton
	writetext PewterCityMuseumGuyTextFollowMe
	promptbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow PEWTERCITY_MUSEUMGUY, PLAYER
	applymovement PEWTERCITY_MUSEUMGUY, ToMuseumMovement
	stopfollow
	turnobject PEWTERCITY_MUSEUMGUY, UP
	turnobject PLAYER, UP
	opentext
	writetext PewterCityMuseumGuyTextHaveToPay
	promptbutton
	closetext
	applymovement PEWTERCITY_MUSEUMGUY, AwayFromMuseumMovement
	disappear PEWTERCITY_MUSEUMGUY
	moveobject PEWTERCITY_MUSEUMGUY, 27, 17
	appear PEWTERCITY_MUSEUMGUY
	special RestartMapMusic
	end	
	
PewterCityTownBlockScript0:
    faceplayer
	 readmem wPlayerCostume
	ifequal 2, .BeatBrock0
	
    checkevent EVENT_BEAT_BROCK
    iftrue .BeatBrock0
    iffalse .DidntBeatBrock0

.DidntBeatBrock0
	opentext
	writetext PewterCityTownBlockText
	promptbutton
	closetext
	follow PEWTERCITY_TOWN_BLOCK, PLAYER
	applymovement PEWTERCITY_TOWN_BLOCK, ToGymMovement
    stopfollow
	turnobject PEWTERCITY_TOWN_BLOCK, UP
	turnobject PLAYER, UP
	pause 10
	turnobject PLAYER, RIGHT
	turnobject PEWTERCITY_TOWN_BLOCK, LEFT
	opentext
	writetext PewterCityTownBlockText2
	promptbutton
	closetext
    applymovement PEWTERCITY_TOWN_BLOCK, StepDownMovement
	turnobject PLAYER, DOWN
	applymovement PEWTERCITY_TOWN_BLOCK, StepLeftMovement2
	turnobject PLAYER, LEFT
	applymovement PEWTERCITY_TOWN_BLOCK, AwayFromGymMovement
	disappear PEWTERCITY_TOWN_BLOCK
	moveobject PEWTERCITY_TOWN_BLOCK, 35, 16
	appear PEWTERCITY_TOWN_BLOCK
	end
	
.BeatBrock0
   readmem wPlayerCostume
   ;If Ash beat Brock
   ifequal 0, .PlayerBeatBrock
   
   ;If Misty beat Brock
   ifequal 1, .PlayerBeatBrock
   
   ;If Gary beat Brock
   ifequal 3, .PlayerBeatBrock
   
   ;If you ARE Brock
   ifequal 2, .BrockNoBlock
	end
	
.PlayerBeatBrock
	opentext
	writetext PewterCityPlayerBeatBrockText
	promptbutton
	closetext
	;sjump CheckHumanTeam
  end
  

.BrockNoBlock
	opentext
	writetext PewterCityBrockNoBlockText
	promptbutton
	closetext
	turnobject PEWTERCITY_TOWN_BLOCK, DOWN
	faceplayer
	
  end

.MistyBeatBrock
  end

PewterCityTownBlockScript1:
    faceplayer
	 readmem wPlayerCostume
	ifequal 2, .BeatBrock1
	
    checkevent EVENT_BEAT_BROCK
    iftrue .BeatBrock1
    iffalse .DidntBeatBrock1

.DidntBeatBrock1

	opentext
	writetext PewterCityTownBlockText
	promptbutton
	closetext
	follow PEWTERCITY_TOWN_BLOCK, PLAYER
	applymovement PEWTERCITY_TOWN_BLOCK, StepUpMovement
	applymovement PEWTERCITY_TOWN_BLOCK, ToGymMovement
	stopfollow
	turnobject PEWTERCITY_TOWN_BLOCK, UP
	turnobject PLAYER, UP
    pause 10
	turnobject PLAYER, RIGHT
	turnobject PEWTERCITY_TOWN_BLOCK, LEFT	
	opentext
	writetext PewterCityTownBlockText2
	promptbutton
	closetext
    applymovement PEWTERCITY_TOWN_BLOCK, StepDownMovement
	turnobject PLAYER, DOWN
	applymovement PEWTERCITY_TOWN_BLOCK, StepLeftMovement2
	turnobject PLAYER, LEFT
	applymovement PEWTERCITY_TOWN_BLOCK, AwayFromGymMovement
	disappear PEWTERCITY_TOWN_BLOCK
    moveobject PEWTERCITY_TOWN_BLOCK, 35, 16
	appear PEWTERCITY_TOWN_BLOCK
	end

.BeatBrock1
   readmem wPlayerCostume
   ;If Ash beat Brock
   ifequal 0, .PlayerBeatBrock
   ;If Gary beat Brock
   ifequal 3, .PlayerBeatBrock
   ;If you ARE Brock
   ifequal 2, .BrockNoBlock
   
	end
	
.PlayerBeatBrock
	opentext
	writetext PewterCityPlayerBeatBrockText
	promptbutton
	closetext
	applymovement PEWTERCITY_TOWN_BLOCK, StepUpMovement
  end
  

.BrockNoBlock
	opentext
	writetext PewterCityBrockNoBlockText
	promptbutton
	closetext
	applymovement PEWTERCITY_TOWN_BLOCK, StepUpMovement
	turnobject PEWTERCITY_TOWN_BLOCK, DOWN
	faceplayer
  end

.MistyBeatBrock
  end
	
PewterCityTownBlockScript2:
    faceplayer
	 readmem wPlayerCostume
	ifequal 2, .BeatBrock2

    checkevent EVENT_BEAT_BROCK
    iftrue .BeatBrock2
    iffalse .DidntBeatBrock2

.DidntBeatBrock2
	opentext
	writetext PewterCityTownBlockText
	promptbutton
	closetext
	follow PEWTERCITY_TOWN_BLOCK, PLAYER
	applymovement PEWTERCITY_TOWN_BLOCK, StepUpMovement2
	applymovement PEWTERCITY_TOWN_BLOCK, ToGymMovement
	stopfollow	
	turnobject PEWTERCITY_TOWN_BLOCK, UP
	turnobject PLAYER, UP
	pause 10
	turnobject PLAYER, RIGHT
	turnobject PEWTERCITY_TOWN_BLOCK, LEFT
	opentext
	writetext PewterCityTownBlockText2
	promptbutton
	closetext
    applymovement PEWTERCITY_TOWN_BLOCK, StepDownMovement
	turnobject PLAYER, DOWN
	applymovement PEWTERCITY_TOWN_BLOCK, StepLeftMovement2
	turnobject PLAYER, LEFT
	applymovement PEWTERCITY_TOWN_BLOCK, AwayFromGymMovement
    disappear PEWTERCITY_TOWN_BLOCK	
	moveobject PEWTERCITY_TOWN_BLOCK, 35, 16
	appear PEWTERCITY_TOWN_BLOCK
	end	

.BeatBrock2
   readmem wPlayerCostume
   ;If Ash beat Brock
   ifequal 0, .PlayerBeatBrock
   ;If Gary beat Brock
   ifequal 3, .PlayerBeatBrock
   ;If you ARE Brock
   ifequal 2, .BrockNoBlock
   
	end
	
.PlayerBeatBrock
	opentext
	writetext PewterCityPlayerBeatBrockText
	promptbutton
	closetext
	applymovement PEWTERCITY_TOWN_BLOCK, StepUpMovement
  end
  

.BrockNoBlock
	opentext
	writetext PewterCityBrockNoBlockText
	promptbutton
	closetext
	applymovement PEWTERCITY_TOWN_BLOCK, StepUpMovement
	applymovement PEWTERCITY_TOWN_BLOCK, StepUpMovement
	turnobject PEWTERCITY_TOWN_BLOCK, DOWN
	faceplayer

.MistyBeatBrock
  end

	
RoadblockMoveScript0:
    faceplayer
    turnobject PEWTERCITY_TOWN_BLOCK, DOWN
    showemote EMOTE_SHOCK, PEWTERCITY_TOWN_BLOCK, 15
     turnobject PLAYER, UP 
     turnobject PEWTERCITY_TOWN_BLOCK, DOWN
     sjump	PewterCityTownBlockScript0
     end

RoadblockMoveScript1:
    faceplayer
	turnobject PEWTERCITY_TOWN_BLOCK, DOWN
    showemote EMOTE_SHOCK, PEWTERCITY_TOWN_BLOCK, 15
	turnobject PLAYER, UP 
    applymovement PEWTERCITY_TOWN_BLOCK, StepDownMovement
	turnobject PEWTERCITY_TOWN_BLOCK, DOWN
	sjump PewterCityTownBlockScript1
	end

RoadblockMoveScript2:
    faceplayer
	turnobject PEWTERCITY_TOWN_BLOCK, DOWN
	showemote EMOTE_SHOCK, PEWTERCITY_TOWN_BLOCK, 15
	turnobject PLAYER, UP 
    applymovement PEWTERCITY_TOWN_BLOCK, StepDownMovement2
	turnobject PEWTERCITY_TOWN_BLOCK, DOWN
	sjump PewterCityTownBlockScript2
	end
	

MeetBrockScript0:
   moveobject PEWTERCITY_BROCK_MEET, 33, 17
   clearflag EVENT_NOT_BEAT_BROCK
   appear PEWTERCITY_BROCK_MEET

   musicfadeout MUSIC_YOUNGSTER_ENCOUNTER, 16
	playsound SFX_READ_TEXT
    waitsfx
   showemote EMOTE_SHOCK, PEWTERCITY_BROCK_MEET, 30
   
  
   
   	opentext
	writetext PewterCityBrockJoinPartyText
	promptbutton
	closetext
	
	turnobject PLAYER, LEFT
   
   applymovement PEWTERCITY_BROCK_MEET, StepRightMovement3
   faceplayer
    opentext
   writetext PewterCityBrockJoinPartyText2
   promptbutton
   closetext
   
   	playsound SFX_READ_TEXT
    waitsfx
   showemote EMOTE_QUESTION, PLAYER, 15
   
   opentext
   writetext PewterCityBrockJoinPartyText3
   promptbutton

   yesorno
   iffalse RejectBrockScript
   closetext
   applymovement PEWTERCITY_BROCK_MEET, StepRightMovement
 	playsound SFX_TRANSACTION
	disappear PEWTERCITY_BROCK_MEET
	
	turnobject PLAYER, DOWN
	showemote EMOTE_HAPPY, PLAYER, 30
	

	
   playsound SFX_FANFARE	
   turnobject PLAYER, LEFT
   turnobject PLAYER, UP
   turnobject PLAYER, RIGHT
   turnobject PLAYER, DOWN  
   opentext
   writetext PewterCityBrockJoinedThePartyText
   waitsfx
   promptbutton
   closetext
   
   musicfadeout MUSIC_VIRIDIAN_CITY, 16
   sjump AcceptBrockScript   
   
   end
	
MeetBrockScript1:
   moveobject PEWTERCITY_BROCK_MEET, 33, 18
   clearflag EVENT_NOT_BEAT_BROCK
   appear PEWTERCITY_BROCK_MEET
   
   	playsound SFX_READ_TEXT
    waitsfx
   showemote EMOTE_SHOCK, PEWTERCITY_BROCK_MEET, 30
   
   	opentext
	writetext PewterCityBrockJoinPartyText
	promptbutton
	closetext
	
	turnobject PLAYER, LEFT
   
   applymovement PEWTERCITY_BROCK_MEET, StepRightMovement3
   faceplayer
   opentext
   writetext PewterCityBrockJoinPartyText2
   promptbutton
   closetext
   
   	playsound SFX_READ_TEXT
    waitsfx
   showemote EMOTE_QUESTION, PLAYER, 15
   
   opentext
   writetext PewterCityBrockJoinPartyText3
   promptbutton

   yesorno
   iffalse RejectBrockScript
   closetext
   applymovement PEWTERCITY_BROCK_MEET, StepRightMovement
 	playsound SFX_TRANSACTION
	disappear PEWTERCITY_BROCK_MEET
	
	turnobject PLAYER, DOWN
	showemote EMOTE_HAPPY, PLAYER, 30
	

	
   playsound SFX_FANFARE	
   turnobject PLAYER, LEFT
   turnobject PLAYER, UP
   turnobject PLAYER, RIGHT
   turnobject PLAYER, DOWN  
   opentext
   writetext PewterCityBrockJoinedThePartyText
   waitsfx
   promptbutton
   closetext
 
   musicfadeout MUSIC_VIRIDIAN_CITY, 16
   sjump AcceptBrockScript   
   end

MeetBrockScript2:
   moveobject PEWTERCITY_BROCK_MEET, 33, 18
   clearflag EVENT_NOT_BEAT_BROCK
   appear PEWTERCITY_BROCK_MEET

	playsound SFX_READ_TEXT
    waitsfx
   showemote EMOTE_SHOCK, PEWTERCITY_BROCK_MEET, 30
   
    opentext
	writetext PewterCityBrockJoinPartyText
	promptbutton
	closetext
	
	turnobject PLAYER, UP
   
   applymovement PEWTERCITY_BROCK_MEET, StepRightMovement3
   applymovement PEWTERCITY_BROCK_MEET, StepRightMovement
   faceplayer
    opentext
   writetext PewterCityBrockJoinPartyText2
   promptbutton
   closetext
   
   	playsound SFX_READ_TEXT
    waitsfx
   showemote EMOTE_QUESTION, PLAYER, 15
   
   opentext
   writetext PewterCityBrockJoinPartyText3
   promptbutton
   
   yesorno
   iffalse RejectBrockScript
   closetext
   applymovement PEWTERCITY_BROCK_MEET, StepDownMovement
 	playsound SFX_TRANSACTION
	disappear PEWTERCITY_BROCK_MEET
	
	turnobject PLAYER, DOWN
	showemote EMOTE_HAPPY, PLAYER, 30
	

	
   playsound SFX_FANFARE	
   turnobject PLAYER, LEFT
   turnobject PLAYER, UP
   turnobject PLAYER, RIGHT
   turnobject PLAYER, DOWN  
   opentext
   writetext PewterCityBrockJoinedThePartyText
   waitsfx
   promptbutton
   closetext
   
   musicfadeout MUSIC_VIRIDIAN_CITY, 16
   sjump AcceptBrockScript
   end

AcceptBrockScript:
    setscene 1
	readmem wTeamCount
	setval 1
	writemem wTeamCount
	setevent EVENT_GOT_BROCK_FIRST
	
	readmem wPokecenterChar1
	setval 3
	writemem wPokecenterChar1
	
	; readmem wPokecenterChar2
	; setval 2
	; writemem wPokecenterChar2

RejectBrockScript:
    closetext   
	end
	
	
StepDownMovement:
   step DOWN
   step_end   
StepDownMovement2:
   step DOWN
   step DOWN
   step_end
   
 StepUpMovement:
   step UP
   step_end   
StepUpMovement2:
   step UP
   step UP
   step_end 
   
StepLeftMovement:
   step LEFT
   step_end   
StepLeftMovement2:
   step LEFT
   step LEFT
   step_end  
  
 StepRightMovement:
   step RIGHT
   step_end   
StepRightMovement2:
   step RIGHT
   step RIGHT
   step_end
StepRightMovement3:
   step RIGHT
   step RIGHT
   step RIGHT
   step_end 
   
  
 ToGymMovement:
   step LEFT 
   step LEFT 
   step LEFT 
   step UP 
   step UP 
   step UP 
   step UP 
   step UP 
   step UP 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step DOWN 
   step DOWN 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
   step LEFT 
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
   step RIGHT
   step RIGHT
   step_end
   
AwayFromGymMovement:
   step LEFT 
   step LEFT 
   step LEFT 
   step_end

ToMuseumMovement:  
   step UP 
   step UP 
   step UP 
   step UP
   step UP
   step UP
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step UP
   step UP
   step UP
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step LEFT
   step_end  
   
AwayFromMuseumMovement:
   step DOWN
   step DOWN
   step DOWN
   step DOWN
   step DOWN
   step_end 
; PewterCityBugCatcherScript:
	; jumptextfaceplayer PewterCityBugCatcherText

; PewterCityGrampsScript:
	; faceplayer
	; opentext
	; checkevent EVENT_GOT_SILVER_WING
	; iftrue .GotSilverWing
	; writetext PewterCityGrampsText
	; promptbutton
	; verbosegiveitem SILVER_WING
	; setevent EVENT_GOT_SILVER_WING
	; closetext
	; end

; .GotSilverWing:
	; writetext PewterCityGrampsText_GotSilverWing
	; waitbutton
	; closetext
	; end

PewterCityGardenSign:
	jumptext PewterCityGardenSignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "Have you visited"
	line "PEWTER GYM?"

	para "The LEADER uses"
	line "rock-type #MON."
	done
	
PewterCityCooltrainerMText:
	text "There aren't many"
	line "serious #MON"
	cont "trainers here!"

	para "They're all like"
	line "BUG CATCHERs,"
	cont "but PEWTER GYM's"
	cont "<BROCK> is" 
	cont "totally into it!" 
	done
	
PewterCityRepelNerdText:
	text "Psssst!"

	para "Do you know what"
	line "I'm doing?"
	done

PewterCityRepelNerdTextYes:
	text "That's right!"
	line "It's hard work!"
	done		
	
PewterCityRepelNerdTextNo:
	text "I'm spraying REPEL"
    line "to keep #MON"
    cont "out of my garden!"
	done

PewterCityMuseumGuyText:
   text "Hey, guy!"
   line "Did you check out"
   cont "the MUSEUM?"   
   done
PewterCityMuseumGuyTextYes:
   text "Weren't those"
   line "fossils from MT."
   cont "MOON amazing?"
   done
PewterCityMuseumGuyTextNo:
   text "Really?"
   line "You absolutely"
   cont "have to check"      
   cont "it out!"
     done
PewterCityMuseumGuyTextFollowMe:
   text "Here, follow me!"
     done

PewterCityMuseumGuyTextHaveToPay:
   text "It's right here!"
   line "You have to pay"
   cont "to get in, but"
   cont "it's worth it!"
   para "See you around!"
     done	 	 
	 
PewterCityTownBlockText: 
    text "Hey! You're a"
    line "#MON Trainer,"
    cont "right?"
	
	para "<BROCK>'s looking"
	line "for new GYM"
	cont "challengers!"
	
	para "Who's <BROCK>,"
	line "you say?"
	
	para "Only the toughest"
	line "GYM LEADER, ever!"
	
	para "Here, follow me!"
	done
	
PewterCityTownBlockText2:
   text "There it is."
   line "The PEWTER GYM!"
   
   para "If you have the"
   line "right stuff, go"   
   cont "take on <BROCK>!"
   
   para "If you can't beat"
   line "BROCK, you've got"
   cont "no hope surviving"
   cont "MT.MOON!"
   done   
   
PewterCityPlayerBeatBrockText: 
    text "Hey! You're a-"
    line "..."
  	
	para "Wait, what?" 
	line "You beat <BROCK>?"
	
	para "Oh, man!"
	line "You must be tough!"
	
	para "Go on ahead to"
	line "MT. MOON!"
	done 
   
   
PewterCityBrockNoBlockText: 
    text "Hey! <BROCK>!"
	line "Going ahead to"
	cont "MT. MOON?"
	done  
; PewterCityBugCatcherText:
	; text "At night, CLEFAIRY"
	; line "come out to play"
	; cont "at MT.MOON."

	; para "But not every"
	; line "night."
	; done

; PewterCityGrampsText:
	; text "Ah, you came all"
	; line "the way out here"
	; cont "from JOHTO?"

	; para "That brings back"
	; line "memories. When I"

	; para "was young, I went"
	; line "to JOHTO to train."

	; para "You remind me so"
	; line "much of what I was"

	; para "like as a young"
	; line "man."

	; para "Here. I want you"
	; line "to have this item"
	; cont "I found in JOHTO."
	; done

; PewterCityGrampsText_GotSilverWing:
	; text "Going to new, un-"
	; line "known places and"
	; cont "seeing new people…"

	; para "Those are the joys"
	; line "of travel."
	; done

PewterCityGardenSignText:
	text "TRAINER TIPS"
	para "Buy REPEL to"
	line "keep wild #MON"
	cont "away!"
	done

PewterGymSignText:
	text "PEWTER CITY"
	line "#MON GYM"
	cont "LEADER: BROCK"

	para "The Rock Solid"
	line "#MON Trainer"
	done

PewterMuseumSignText:
	text "There's a notice"
	line "here…"

	para "PEWTER MUSEUM OF"
	line "SCIENCE is closed"
	cont "for renovations…"
	done

PewterCityMtMoonGiftShopSignText:
	text "There's a notice"
	line "here…"

	para "MT.MOON GIFT SHOP"
	line "NOW OPEN!"
	done

PewterCityWelcomeSignText:
	text "   PEWTER CITY"
	line "    “A Stone"
	cont "    Gray City”"
	done
;	text_asm		
	; ldcoord_a 16, 13 ; Top Left
	; inc a
	; ldcoord_a 16, 14  ; Bottom Left
	; inc a
	; ldcoord_a 17, 13 ; Top Right
	; inc a
	; ldcoord_a 17, 14 ; Bottom Right
	
	
	; hlcoord 18, 17
	; ld [hl], "▼"
	; ld hl, TestText
	
; rept 4
	; inc bc ; space
; endr
	;ret

TestText:
	 text "This is Test"
	 line "Text"
	 done
	 

	 
PewterCityBrockJoinPartyText:
	text "Hey!!"

	para "<PLAYER>!"
	line "Wait up!"
	done	
	
PewterCityBrockJoinPartyText2:
	text "Are you heading"
    line "up to MT. MOON?"
	
	para "Mind if I tag"
	line "along with you?"
	done

PewterCityBrockJoinPartyText3:
	text "Why?"
	
    para "Well, our battle"
	line "got me thinking."

	para "You've only just"
	line "started your"
	cont "#MON journey,"
	cont "and my beautiful"
	cont "GEODUDE and ONIX"
	cont "didn't stand a"
	cont "chance against"
	cont "you!"
	
	para "MT. MOON is a"
	line "great place for"
	cont "training #MON!"
	
	para "What do you say?"
	done		
	
PewterCityBrockJoinedThePartyText:	
   text "<BROCK> joined"
   line "<PLAYER>'s TEAM!"
   done
   
   
PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
;	warp_event 13, 25, ROUTE_2_NUGGET_HOUSE, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event 14, 7, PEWTER_MUSEUM_1F, 1
	warp_event 19, 5, PEWTER_MUSEUM_1F, 4
	
	def_coord_events
	coord_event 35, 17, SCENE_PEWTERCITY_ROADBLOCK, RoadblockMoveScript0
	coord_event 35, 18, SCENE_PEWTERCITY_ROADBLOCK, RoadblockMoveScript1
	coord_event 35, 19, SCENE_PEWTERCITY_ROADBLOCK, RoadblockMoveScript2
	
	coord_event 37, 17, SCENE_PEWTERCITY_BROCKMEET, MeetBrockScript0
	coord_event 37, 18, SCENE_PEWTERCITY_BROCKMEET, MeetBrockScript1
	coord_event 37, 19, SCENE_PEWTERCITY_BROCKMEET, MeetBrockScript2
	
	def_bg_events
	bg_event 25, 23, BGEVENT_READ, PewterCityGardenSign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event  8, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 17, 25, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerMScript, -1
	object_event 26, 25, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityRepelNerdScript, -1
	object_event 27, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityMuseumGuyScript, -1
	object_event 35, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityTownBlockScript0, -1 ;EVENT_BEAT_BROCK
	object_event 32, 17, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MeetBrockScript0, EVENT_NOT_BEAT_BROCK
	; object_event 16, 25, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	; object_event 26, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	; object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	; object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
