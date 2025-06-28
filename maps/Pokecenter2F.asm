	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_OFFICER
	
	const POKECENTER2F_NPC_ASH
	const POKECENTER2F_NPC_BROCK
	const POKECENTER2F_NPC_MISTY
	 const POKECENTER2F_NPC_GARY
	 const POKECENTER2F_NPC_PIKACHU
;	 const POKECENTER2F_NPC_CHRIS

Pokecenter2F_MapScripts:
	def_scene_scripts
	scene_script Pokecenter2FNoopScene, SCENE_POKECENTER2F_NOOP
	scene_script Pokecenter2FCheckMysteryGiftScene,      SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	scene_script Pokecenter2FLeaveTradeCenterScene,      SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script Pokecenter2FLeaveColosseumScene,        SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	scene_script Pokecenter2FLeaveTimeCapsuleScene,      SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE
	scene_script Pokecenter2FLeaveMobileTradeRoomScene,  SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM
	scene_script Pokecenter2FLeaveMobileBattleRoomScene, SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Pokecenter2FCallback
	
Pokecenter2FNoopScene:
end

Pokecenter2FCallback:
   setevent EVENT_POKECENTER_ASH   
   setevent EVENT_POKECENTER_MISTY   
   setevent EVENT_POKECENTER_BROCK   
   setevent EVENT_POKECENTER_GARY   
   setevent EVENT_POKECENTER_PIKACHU
   readmem wTeamCount
   ifequal 0, .DeleteTeamNPC
   ifgreater 0, .GenerateNPC1
    endcallback	
	
.DeleteTeamNPC
   setevent EVENT_POKECENTER_ASH   
   setevent EVENT_POKECENTER_MISTY   
   setevent EVENT_POKECENTER_BROCK   
   setevent EVENT_POKECENTER_GARY   
   setevent EVENT_POKECENTER_PIKACHU
   endcallback	
	
.GenerateNPC1
   readmem wPokecenterChar1
   ifequal 1, .JustAsh
   ifequal 2, .JustMisty
   ifequal 3, .JustBrock
   ifequal 4, .JustGary
   ifequal 5, .JustPikachu
    endcallback

.JustAsh
   setevent EVENT_POKECENTER_MISTY
   setevent EVENT_POKECENTER_BROCK
   setevent EVENT_POKECENTER_GARY
   setevent EVENT_POKECENTER_PIKACHU
   clearevent EVENT_POKECENTER_ASH
   readmem wPokecenterChar2
   ifgreater 0, .GenerateNPC2
   endcallback   
   
.JustBrock
   setevent EVENT_POKECENTER_ASH
   setevent EVENT_POKECENTER_MISTY
   setevent EVENT_POKECENTER_GARY
   setevent EVENT_POKECENTER_PIKACHU
   clearevent EVENT_POKECENTER_BROCK
   readmem wPokecenterChar2
   ifgreater 0, .GenerateNPC2   
   endcallback
   
.JustMisty
   setevent EVENT_POKECENTER_ASH
   setevent EVENT_POKECENTER_BROCK
   setevent EVENT_POKECENTER_GARY
   setevent EVENT_POKECENTER_PIKACHU
   clearevent EVENT_POKECENTER_MISTY
   readmem wPokecenterChar2
   ifgreater 0, .GenerateNPC2
 ;  moveobject POKECENTER2F_NPC_MISTY, 6, 6   
   endcallback
   
.JustGary
   setevent EVENT_POKECENTER_ASH
   setevent EVENT_POKECENTER_BROCK
   setevent EVENT_POKECENTER_MISTY
   setevent EVENT_POKECENTER_PIKACHU
   clearevent EVENT_POKECENTER_GARY
   readmem wPokecenterChar2
    ifgreater 0, .GenerateNPC2
   endcallback

.JustPikachu
   setevent EVENT_POKECENTER_ASH
   setevent EVENT_POKECENTER_BROCK
   setevent EVENT_POKECENTER_MISTY
   setevent EVENT_POKECENTER_GARY
   clearevent EVENT_POKECENTER_PIKACHU
   readmem wPokecenterChar2
    ifgreater 0, .GenerateNPC2
   endcallback      

.GenerateNPC2
   readmem wPokecenterChar2
   ifequal 1, .JustAsh2
   ifequal 2, .JustMisty2
   ifequal 3, .JustBrock2
   ifequal 4, .JustGary2
   ifequal 5, .JustPikachu2 
   ; clearevent EVENT_POKECENTER_BROCK
   ; clearevent EVENT_POKECENTER_MISTY    
   endcallback
   
.JustAsh2
   ; setevent EVENT_POKECENTER_MISTY
   ; setevent EVENT_POKECENTER_BROCK
   ; setevent EVENT_POKECENTER_GARY
   ; setevent EVENT_POKECENTER_PIKACHU
   clearevent EVENT_POKECENTER_ASH
   moveobject POKECENTER2F_NPC_ASH, 7, 6
   appear POKECENTER2F_NPC_ASH
   endcallback

.JustMisty2
   ; setevent EVENT_POKECENTER_BROCK
   ; setevent EVENT_POKECENTER_GARY
   ; setevent EVENT_POKECENTER_PIKACHU
   ; setevent EVENT_POKECENTER_ASH
   clearevent EVENT_POKECENTER_MISTY
   moveobject POKECENTER2F_NPC_MISTY, 7, 6
    appear POKECENTER2F_NPC_MISTY
   endcallback

.JustBrock2
   ; setevent EVENT_POKECENTER_GARY
   ; setevent EVENT_POKECENTER_PIKACHU
   ; setevent EVENT_POKECENTER_ASH
   ; setevent EVENT_POKECENTER_MISTY
   clearevent EVENT_POKECENTER_BROCK
   moveobject POKECENTER2F_NPC_BROCK, 7, 6
    appear POKECENTER2F_NPC_BROCK
   endcallback
   
.JustGary2
   ; setevent EVENT_POKECENTER_PIKACHU
   ; setevent EVENT_POKECENTER_ASH
   ; setevent EVENT_POKECENTER_MISTY
   ; setevent EVENT_POKECENTER_BROCK
   clearevent EVENT_POKECENTER_GARY
   moveobject POKECENTER2F_NPC_GARY, 7, 6
    appear POKECENTER2F_NPC_GARY
   endcallback

.JustPikachu2
   
   ; setevent EVENT_POKECENTER_ASH
   ; setevent EVENT_POKECENTER_MISTY
   ; setevent EVENT_POKECENTER_BROCK
   ; setevent EVENT_POKECENTER_GARY
   clearevent EVENT_POKECENTER_PIKACHU
   moveobject POKECENTER2F_NPC_PIKACHU, 7, 6
    appear POKECENTER2F_NPC_PIKACHU
   endcallback

NPC_Ash_Script:
  faceplayer
  random 3
  ifequal 0, .AshText0
  ifequal 1, .AshText1
  ifequal 2, .AshText2
 end
 
.AshText0 
  opentext
  farwritetext NPC_Ash_Text0
  promptbutton
  closetext
  sjump .AshText3
  end
 
.AshText1
  opentext
  farwritetext NPC_Ash_Text1
  promptbutton
  closetext
  sjump .AshText3
  end
  
.AshText2
  opentext
  farwritetext NPC_Ash_Text2
  promptbutton
  closetext
  sjump .AshText3
  end
 
.AshText3
  opentext
  farwritetext NPC_Ash_Text3
  promptbutton
  yesorno
  iftrue .AshText4
  iffalse .AshText5
  end

.AshText4
  opentext
  farwritetext NPC_Ash_Text4
  promptbutton
  closetext
  sjump SwitchAshWithPlayer
 
  end
  
.AshText5 
  opentext
  farwritetext NPC_Ash_Text5
  promptbutton
  closetext
  end   

NPC_Misty_Script:
  faceplayer
  random 3
  ifequal 0, .MistyText0
  ifequal 1, .MistyText1
  ifequal 2, .MistyText2
 end
 
.MistyText0 
  opentext
  farwritetext NPC_Misty_Text0
  promptbutton
  closetext
  sjump .MistyText3
  end
 
.MistyText1
  opentext
  farwritetext NPC_Misty_Text1
  promptbutton
  closetext
  sjump .MistyText3
  end
  
.MistyText2
  opentext
  farwritetext NPC_Misty_Text2
  promptbutton
  closetext
  sjump .MistyText3
  end
 
.MistyText3
  opentext
  farwritetext NPC_Misty_Text3
  promptbutton
  yesorno
  iftrue .MistyText4
  iffalse .MistyText5
  end

.MistyText4
  opentext
  farwritetext NPC_Misty_Text4
  promptbutton
  closetext
  sjump SwitchMistyWithPlayer
 
  end
  
.MistyText5 
  opentext
  farwritetext NPC_Misty_Text5
  promptbutton
  closetext
  end  
 
 
NPC_Brock_Script:
  faceplayer
  random 3
  ifequal 0, .BrockText0
  ifequal 1, .BrockText1
  ifequal 2, .BrockText2
  end
  
.BrockText0 
  opentext
  farwritetext NPC_Brock_Text0
  promptbutton
  closetext
  sjump .BrockText3
  end
 
.BrockText1
  opentext
  farwritetext NPC_Brock_Text1
  promptbutton
  closetext
  sjump .BrockText3
  end
  
.BrockText2
  opentext
  farwritetext NPC_Brock_Text2
  promptbutton
  closetext
  sjump .BrockText3
  end
 
.BrockText3
  opentext
  farwritetext NPC_Brock_Text3
  promptbutton
  yesorno
  iftrue .BrockText4
  iffalse .BrockText5
  end

.BrockText4
  opentext
  farwritetext NPC_Brock_Text4
  promptbutton
  closetext
  sjump SwitchBrockWithPlayer
 
  end
  
.BrockText5 
  opentext
  farwritetext NPC_Brock_Text5
  promptbutton
  closetext
  end  
  
NPC_Gary_Script:
  faceplayer
  random 3
  ifequal 0, .GaryText0
  ifequal 1, .GaryText1
  ifequal 2, .GaryText2
  end
  
.GaryText0 
  opentext
  farwritetext NPC_Gary_Text0
  promptbutton
  closetext
  sjump .GaryText3
  end
 
.GaryText1
  opentext
  farwritetext NPC_Gary_Text1
  promptbutton
  closetext
  sjump .GaryText3
  end
  
.GaryText2
  opentext
  farwritetext NPC_Gary_Text2
  promptbutton
  closetext
  sjump .GaryText3
  end
 
.GaryText3
  opentext
  farwritetext NPC_Gary_Text3
  promptbutton
  yesorno
  iftrue .GaryText4
  iffalse .GaryText5
  end

.GaryText4
  opentext
  farwritetext NPC_Gary_Text4
  promptbutton
  closetext
  sjump SwitchGaryWithPlayer
 
  end
  
.GaryText5 
  opentext
  farwritetext NPC_Gary_Text5
  promptbutton
  closetext
  end  
 end

NPC_Pikachu_Script:
 end

 SwitchAshWithPlayer:
 	readvar VAR_FACING
	ifequal DOWN, StepUpAshScript
	ifequal UP, StepDownAshScript
	ifequal LEFT, StepRightAshScript
	ifequal RIGHT, StepLeftAshScript
	end 
 
SwitchMistyWithPlayer:
 	readvar VAR_FACING
	ifequal DOWN, StepUpMistyScript
	ifequal UP, StepDownMistyScript
	ifequal LEFT, StepRightMistyScript
	ifequal RIGHT, StepLeftMistyScript
	end 
 
SwitchBrockWithPlayer:
 	readvar VAR_FACING
	ifequal DOWN, StepUpBrockScript
	ifequal UP, StepDownBrockScript
	ifequal LEFT, StepRightBrockScript
	ifequal RIGHT, StepLeftBrockScript
	end
	
SwitchGaryWithPlayer:
 	readvar VAR_FACING
	ifequal DOWN, StepUpGaryScript
	ifequal UP, StepDownGaryScript
	ifequal LEFT, StepRightGaryScript
	ifequal RIGHT, StepLeftGaryScript
	end
	
SwitchPikachuWithPlayer:
 	readvar VAR_FACING
	ifequal DOWN, StepUpPikachuScript
	ifequal UP, StepDownPikachuScript
	ifequal LEFT, StepRightPikachuScript
	ifequal RIGHT, StepLeftPikachuScript
	end		
	
SwapNPC1WithPlayer:

	ld a, [wPlayerCostume]
	inc a
	ld [wPokecenterChar1], a
	ret
	
SwapNPC2WithPlayer:	
	ld a, [wPlayerCostume]
	inc a
	ld [wPokecenterChar2], a
	ret	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
StepUpAshScript:
    applymovement POKECENTER2F_NPC_ASH, PokecenterNPCStepUpMovement
	readvar VAR_XCOORD
    ifequal 6, FinishAshScript
    ifequal 7, FinishAshScript2
	end
	
StepDownAshScript:
   applymovement POKECENTER2F_NPC_ASH, PokecenterNPCStepDownMovement
	readvar VAR_XCOORD
    ifequal 6, FinishAshScript
    ifequal 7, FinishAshScript2
   end
StepLeftAshScript:  
   applymovement POKECENTER2F_NPC_ASH, PokecenterNPCStepLeftMovement
  	readvar VAR_XCOORD
    ifequal 5, FinishAshScript
    ifequal 6, FinishAshScript2
   end
StepRightAshScript:
    applymovement POKECENTER2F_NPC_ASH, PokecenterNPCStepRightMovement
   	readvar VAR_XCOORD
    ifequal 7, FinishAshScript
    ifequal 8, FinishAshScript2
   end
   
FinishAshScript:
	 disappear POKECENTER2F_NPC_ASH
	 setevent EVENT_POKECENTER_ASH	 
	 callasm SwapNPC1WithPlayer
     callasm AshCostumeChange 
	 sjump CheckPokecenterChar1
end

FinishAshScript2:
	 disappear POKECENTER2F_NPC_ASH
	 setevent EVENT_POKECENTER_ASH	 
	 callasm SwapNPC2WithPlayer
	 moveobject POKECENTER2F_NPC_ASH, 7, 6
     callasm AshCostumeChange 
	 sjump CheckPokecenterChar2
end     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
StepUpBrockScript:
	; disappear PLAYER
    applymovement POKECENTER2F_NPC_BROCK, PokecenterNPCStepUpMovement
 	readvar VAR_XCOORD
    ifequal 6, FinishBrockScript
    ifequal 7, FinishBrockScript2
	end
	
StepDownBrockScript:
	; disappear PLAYER
   applymovement POKECENTER2F_NPC_BROCK, PokecenterNPCStepDownMovement
	readvar VAR_XCOORD
    ifequal 6, FinishBrockScript
    ifequal 7, FinishBrockScript2
   end
StepLeftBrockScript: 
	; disappear PLAYER
   applymovement POKECENTER2F_NPC_BROCK, PokecenterNPCStepLeftMovement
  	readvar VAR_XCOORD
    ifequal 5, FinishBrockScript
    ifequal 6, FinishBrockScript2
   end
StepRightBrockScript:
	; disappear PLAYER
    applymovement POKECENTER2F_NPC_BROCK, PokecenterNPCStepRightMovement
   	readvar VAR_XCOORD
    ifequal 7, FinishBrockScript
    ifequal 8, FinishBrockScript2
   end
   
FinishBrockScript:
	 disappear POKECENTER2F_NPC_BROCK
	 setevent EVENT_POKECENTER_BROCK	 
	 callasm SwapNPC1WithPlayer
	 
     callasm BrockCostumeChange
    sjump CheckPokecenterChar1
end

FinishBrockScript2:
	 disappear POKECENTER2F_NPC_BROCK
	 setevent EVENT_POKECENTER_BROCK	 
	 callasm SwapNPC2WithPlayer
	 
     callasm BrockCostumeChange
    sjump CheckPokecenterChar2
end      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
StepUpMistyScript:
   applymovement POKECENTER2F_NPC_MISTY, PokecenterNPCStepUpMovement
 	readvar VAR_XCOORD
    ifequal 6, FinishMistyScript
    ifequal 7, FinishMistyScript2
	end
StepDownMistyScript:
    applymovement POKECENTER2F_NPC_MISTY, PokecenterNPCStepDownMovement
	readvar VAR_XCOORD
    ifequal 6, FinishMistyScript
    ifequal 7, FinishMistyScript2
   end
StepLeftMistyScript:  
    applymovement POKECENTER2F_NPC_MISTY, PokecenterNPCStepLeftMovement
  	readvar VAR_XCOORD
    ifequal 5, FinishMistyScript
    ifequal 6, FinishMistyScript2
   end
StepRightMistyScript:
   applymovement POKECENTER2F_NPC_MISTY, PokecenterNPCStepRightMovement
   	readvar VAR_XCOORD
    ifequal 7, FinishMistyScript
    ifequal 8, FinishMistyScript2
   end
   
FinishMistyScript:
	 disappear POKECENTER2F_NPC_MISTY
	 setevent EVENT_POKECENTER_MISTY	 
	 callasm SwapNPC1WithPlayer
     callasm MistyCostumeChange
	 
     sjump CheckPokecenterChar1
     end

FinishMistyScript2:
	 disappear POKECENTER2F_NPC_MISTY
	 setevent EVENT_POKECENTER_MISTY	 
	 callasm SwapNPC2WithPlayer
     callasm MistyCostumeChange
	 
     sjump CheckPokecenterChar2
     end  	 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
StepUpGaryScript:
   applymovement POKECENTER2F_NPC_GARY, PokecenterNPCStepUpMovement
 	readvar VAR_XCOORD
    ifequal 6, FinishGaryScript
    ifequal 7, FinishGaryScript2
	end
StepDownGaryScript:
    applymovement POKECENTER2F_NPC_GARY, PokecenterNPCStepDownMovement
 	readvar VAR_XCOORD
    ifequal 6, FinishGaryScript
    ifequal 7, FinishGaryScript2
   end
StepLeftGaryScript:  
    applymovement POKECENTER2F_NPC_GARY, PokecenterNPCStepLeftMovement
  	readvar VAR_XCOORD
    ifequal 5, FinishGaryScript
    ifequal 6, FinishGaryScript2
   end
StepRightGaryScript:
   applymovement POKECENTER2F_NPC_GARY, PokecenterNPCStepRightMovement
   	readvar VAR_XCOORD
    ifequal 7, FinishGaryScript
    ifequal 8, FinishGaryScript2
   end
   
FinishGaryScript:
	 disappear POKECENTER2F_NPC_GARY
	 setevent EVENT_POKECENTER_GARY	 
	 callasm SwapNPC1WithPlayer
     callasm GaryCostumeChange
	 
     sjump CheckPokecenterChar1
     end

FinishGaryScript2:
	 disappear POKECENTER2F_NPC_GARY
	 setevent EVENT_POKECENTER_GARY	 
	 callasm SwapNPC2WithPlayer
     callasm GaryCostumeChange
	 
     sjump CheckPokecenterChar2
     end      	 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
StepUpPikachuScript:
   applymovement POKECENTER2F_NPC_PIKACHU, PokecenterNPCStepUpMovement
 	readvar VAR_XCOORD
    ifequal 6, FinishPikachuScript
    ifequal 7, FinishPikachuScript2 
	end
StepDownPikachuScript:
    applymovement POKECENTER2F_NPC_PIKACHU, PokecenterNPCStepDownMovement
 	readvar VAR_XCOORD
    ifequal 6, FinishPikachuScript
    ifequal 7, FinishPikachuScript2 
   end
StepLeftPikachuScript:  
    applymovement POKECENTER2F_NPC_PIKACHU, PokecenterNPCStepLeftMovement
    	readvar VAR_XCOORD
    ifequal 5, FinishPikachuScript
    ifequal 6, FinishPikachuScript2 
   end
StepRightPikachuScript:
   applymovement POKECENTER2F_NPC_PIKACHU, PokecenterNPCStepRightMovement
    	readvar VAR_XCOORD
    ifequal 7, FinishPikachuScript
    ifequal 8, FinishPikachuScript2 
   end
   
FinishPikachuScript:
	 disappear POKECENTER2F_NPC_PIKACHU
	 setevent EVENT_POKECENTER_PIKACHU	 
	 callasm SwapNPC1WithPlayer
     callasm PikachuCostumeChange
	 
     sjump CheckPokecenterChar1
     end

FinishPikachuScript2:
	 disappear POKECENTER2F_NPC_PIKACHU
	 setevent EVENT_POKECENTER_PIKACHU	 
	 callasm SwapNPC2WithPlayer
     callasm PikachuCostumeChange
	 
     sjump CheckPokecenterChar2
     end    	 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CheckPokecenterChar1:   
	 readmem wPokecenterChar1
	 ifequal 1, AshAppear
	 ifequal 2, MistyAppear
	 ifequal 3, BrockAppear
	 ifequal 4, GaryAppear
	 ifequal 5, PikachuAppear
	 end

CheckPokecenterChar2:   
	 readmem wPokecenterChar2
	 ifequal 1, AshAppear2
	 ifequal 2, MistyAppear2
	 ifequal 3, BrockAppear2
	 ifequal 4, GaryAppear2
	 ifequal 5, PikachuAppear2
	 end

AshAppear2:
  moveobject POKECENTER2F_NPC_ASH, 7, 6
   clearevent EVENT_POKECENTER_ASH
  appear POKECENTER2F_NPC_ASH
  end
  
AshAppear:
  moveobject POKECENTER2F_NPC_ASH, 6, 6
 clearevent EVENT_POKECENTER_ASH
  appear POKECENTER2F_NPC_ASH
    end

MistyAppear2:
  moveobject POKECENTER2F_NPC_MISTY, 7, 6
   clearevent EVENT_POKECENTER_MISTY	
  appear POKECENTER2F_NPC_MISTY
  end
  
MistyAppear:
  moveobject POKECENTER2F_NPC_MISTY, 6, 6
 clearevent EVENT_POKECENTER_MISTY	
  appear POKECENTER2F_NPC_MISTY
    end

BrockAppear2:
 moveobject POKECENTER2F_NPC_BROCK, 7, 6
  clearevent EVENT_POKECENTER_BROCK
  appear POKECENTER2F_NPC_BROCK
    end	
	
BrockAppear:
 moveobject POKECENTER2F_NPC_BROCK, 6, 6
 clearevent EVENT_POKECENTER_BROCK
  appear POKECENTER2F_NPC_BROCK
    end	
	
GaryAppear2:
  moveobject POKECENTER2F_NPC_GARY, 7, 6
   clearevent EVENT_POKECENTER_GARY
  appear POKECENTER2F_NPC_GARY
    end
	
GaryAppear:
  moveobject POKECENTER2F_NPC_GARY, 6, 6
 clearevent EVENT_POKECENTER_GARY
  appear POKECENTER2F_NPC_GARY
    end

PikachuAppear2:
 moveobject POKECENTER2F_NPC_PIKACHU, 7, 6
 clearevent EVENT_POKECENTER_PIKACHU
  appear POKECENTER2F_NPC_PIKACHU
    end		 
PikachuAppear:
 moveobject POKECENTER2F_NPC_PIKACHU, 6, 6
 clearevent EVENT_POKECENTER_PIKACHU
  appear POKECENTER2F_NPC_PIKACHU
    end		


PokecenterNPCStepUpMovement:   
   step UP
    step_end
 
PokecenterNPCStepDownMovement:   
   step DOWN
    step_end

PokecenterNPCStepLeftMovement:   
   step LEFT
    step_end

PokecenterNPCStepRightMovement:   
   step RIGHT
    step_end	

Pokecenter2FCheckMysteryGiftScene:
	special CheckMysteryGift
	ifequal $0, .done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .done
	sdefer Pokecenter2F_AppearMysteryGiftDeliveryGuy
.done
	end

Pokecenter2FLeaveTradeCenterScene:
	sdefer Script_LeftCableTradeCenter
	end

Pokecenter2FLeaveColosseumScene:
	sdefer Script_LeftCableColosseum
	end

Pokecenter2FLeaveTimeCapsuleScene:
	sdefer Script_LeftTimeCapsule
	end

Pokecenter2FLeaveMobileTradeRoomScene:
	sdefer Script_LeftMobileTradeRoom
	end

Pokecenter2FLeaveMobileBattleRoomScene:
	sdefer Script_LeftMobileBattleRoom
	end

Pokecenter2F_AppearMysteryGiftDeliveryGuy:
	appear POKECENTER2F_OFFICER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end
	
; NPCTradeCrispy:
    ; clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	; callasm GiveGift
    ; special SetTradeNPCGenderBoy
	; faceplayer
	; opentext
	; trade NPC_TRADE_JULIO
	; waitbutton
	; closetext
	; end	

; GiveGift:
	; ld a, BANK(sMysteryGiftItem)
	; call OpenSRAM
   ; ld a, FRIEND_BALL
    ; ld [sMysteryGiftItem], a
	; ret
Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckMobileAdapterStatusSpecial ; always returns false
	iffalse .NoMobile
	writetext Text_TradeReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special TryQuickSave
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

BattleTradeMobile_WalkIn:
	applymovementlasttalked Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown
	applymovement PLAYER, Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckMobileAdapterStatusSpecial ; always returns false
	iffalse .NoMobile
	writetext Text_BattleReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForBattleRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .SelectThreeMons
	iffalse .Mobile_Abort
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special Function103780
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

.SelectThreeMons:
	special Mobile_SelectThreeMons
	iffalse .Mobile_DidNotSelect
	ifequal $1, .Mobile_OK
	ifequal $2, .Mobile_OK
	ifequal $3, .Mobile_InvalidParty
	sjump .Mobile_DidNotSelect

.Mobile_InvalidParty:
	writetext Text_BrokeStadiumRules
	waitbutton
.Mobile_DidNotSelect:
	closetext
	setval FALSE
	end

.Mobile_OK:
	setval TRUE
	end

Script_TimeCapsuleClosed:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckTimeCapsuleCompatibility
	ifequal $1, .MonTooNew
	ifequal $2, .MonMoveTooNew
	ifequal $3, .MonHasMail
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .OK
	special CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.OK:
	special EnterTimeCapsule
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall TimeCapsuleScript_CheckPlayerGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special WaitForOtherPlayerToExit
	closetext
	end

.MonTooNew:
	writetext Text_RejectNewMon
	closetext
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	closetext
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

Script_LeftMobileTradeRoom:
	special Function101220
	scall Script_WalkOutOfMobileTradeRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene MOBILE_TRADE_ROOM, SCENE_MOBILETRADEROOM_INITIALIZE
	end

Script_WalkOutOfMobileTradeRoom:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

Script_LeftMobileBattleRoom:
	special Function101220
	scall Script_WalkOutOfMobileBattleRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene MOBILE_BATTLE_ROOM, SCENE_MOBILEBATTLEROOM_INITIALIZE
	end

Script_WalkOutOfMobileBattleRoom:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Pokecenter2F_CheckGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	end

.Female:
;	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2
;	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
;	applymovementlasttalked Pokecenter2FMovementData_ReceptionistLooksRight
;	turnobject PLAYER, LEFT
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_GREEN << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special UpdatePlayerSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
;	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp
	end

Script_WalkOutOfLinkTradeRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

TimeCapsuleScript_CheckPlayerGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	readvar VAR_FACING
	ifequal LEFT, .MaleFacingLeft
	ifequal RIGHT, .MaleFacingRight
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp_2
	end

.MaleFacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksLeftAndUp
	end

.MaleFacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksRightAndUp
	end

.Female:
	readvar VAR_FACING
	ifequal RIGHT, .FemaleFacingRight
	ifequal LEFT, .FemaleFacingLeft
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp_2
	sjump .FemaleContinue

.FemaleFacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksLeft_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepRight
	sjump .FemaleContinue

.FemaleFacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepLeft
.FemaleContinue:
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .FemaleChangeApperance
	turnobject PLAYER, LEFT
.FemaleChangeApperance:
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	faceobject PLAYER, POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special UpdatePlayerSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp_2
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
	sjump .Done

.Female:
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
.Done:
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TIME_CAPSULE, SCENE_TIMECAPSULE_INITIALIZE
	end

Pokecenter2FLinkRecordSign:
	refreshscreen
	special DisplayLinkRecord
	closetext
	end

Pokecenter2F_OfficerScript2:
	faceplayer
    

Pokecenter2F_OfficerScript:
;    clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	faceplayer
	opentext
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .NoGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	promptbutton
	waitsfx
	special GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	sjump .ServeYouAgain
	end
	
.ServeYouAgain:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	waitbutton
	closetext
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	end

.NoGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro2
	waitbutton
	closetext
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	waitbutton
	closetext
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
	waitbutton
	closetext
	end
	
	
Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown:
	slow_step UP
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistLooksRight:
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepUp:
	step UP
	step_end

Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom:
	step UP
	step UP
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsUp_2:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepDown:
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepDown_2:
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepUp_2:
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepRight:
	step RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepLeft:
	step LEFT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2:
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksLeft_2:
	slow_step RIGHT
	turn_head LEFT
	step_end

Text_BattleReceptionistMobile:
	text "Would you like to"
	line "battle over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

Text_TradeReceptionistMobile:
	text "Would you like to"
	line "trade over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

Text_ThisWayToMobileRoom: ; unreferenced
	text "This way to the"
	line "MOBILE ROOM."
	done

Text_BattleReceptionistIntro:
	text "Welcome to CABLE"
	line "CLUB COLOSSEUM."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

Text_TradeReceptionistIntro:
	text "Welcome to CABLE"
	line "TRADE CENTER."

	para "You may trade your"
	line "#MON here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

Text_TimeCapsuleReceptionistIntro:
	text "Welcome to CABLE"
	line "CLUB TIME CAPSULE."

	para "You can travel to"
	line "the past and trade"
	cont "your #MON."

	para "Would you like to"
	line "trade across time?"
	done

YourFriendIsNotReadyText:
	text "Your friend is not"
	line "ready."
	prompt

Text_MustSaveGame:
	text "Before opening the"
	line "link, you must"
	cont "save your game."
	done

Text_PleaseWait:
	text "Please wait."
	done

Text_LinkTimedOut:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	text "Please come again."
	prompt

Text_PleaseComeInDuplicate: ; unreferenced
	text "Please come in."
	prompt

Text_TemporaryStagingInLinkRoom: ; unreferenced
	text "We'll put you in"
	line "the link room for"
	cont "the time being."
	done

Text_CantLinkToThePast:
	text "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	text "Incompatible rooms"
	line "were chosen."
	prompt

Text_PleaseComeIn:
	text "Please come in."
	done

Text_PleaseEnter: ; unreferenced
	text "Please enter."
	prompt

Text_RejectNewMon:
	text "Sorry--@"
	text_ram wStringBuffer1
	text_start
	line "can't be taken."
	prompt

Text_RejectMonWithNewMove:
	text "You can't take the"
	line "@"
	text_ram wStringBuffer1
	text " with a"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_RejectMonWithMail:
	text "You can't take the"
	line "@"
	text_ram wStringBuffer1
	text " that"
	cont "has MAIL with you."
	prompt

Text_TimeCapsuleClosed:
	text "I'm sorry--the"
	line "TIME CAPSULE is"
	cont "being adjusted."
	done

Text_TradeRoomClosed:
	text "I'm sorry--the"
	line "TRADE MACHINE is"
	cont "being adjusted."
	done

Text_BattleRoomClosed:
	text "I'm sorry--the"
	line "BATTLE MACHINE is"
	cont "being adjusted."
	done

Text_MysteryGiftDeliveryGuy_Intro:
	text "Hello! You're"
	line "<PLAYER>, right?"

	para "I have some-"
	line "thing for you."
	done

Text_MysteryGiftDeliveryGuy_HereYouGo:
	text "Here you go!"
	done

Text_MysteryGiftDeliveryGuy_Outro:
	text "We hope to serve"
	line "you again."
	done
	
Text_MysteryGiftDeliveryGuy_Outro2:
	text "Hello there!"
	
	para "<PLAYER>, was it?"
	;line "it?"
	
	para "No, it doesn't"
	line "look like we"
	cont "have anything"
	cont "here for you!"
	
    para "But please,"
	line "do keep MYSTERY"
	cont "GIFT Delivery Co."
	cont "in mind for all"
	cont "of your future"
	cont "delivery needs!"
	done	

Text_MysteryGiftDeliveryGuy_NoRoom:
	text "Oh, you have no"
	line "space for this."

	para "Stop in at any"
	line "#MON CENTER"

	para "across the country"
	line "to pick it up."
	done

Text_MysteryGiftDeliveryGuy_SaidNo:
	text "No? That's very"
	line "strange…"
	done

Text_OhPleaseWait:
	text "Oh, please wait."
	done

Text_ChangeTheLook:
	text "We need to change"
	line "the look here…"
	done

Text_LikeTheLook:
	text "How does this"
	line "style look to you?"
	done

Text_BrokeStadiumRules:
	text "Excuse me!"

	para "For STADIUM rules,"
	line "please bring six"

	para "different #MON,"
	line "excluding EGGS."

	para "The six #MON"
	line "must be different."

	para "Also, they must"
	line "not be holding"
	cont "identical items."

	para "Please come back"
	line "when you're ready."
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1
	warp_event 13,  2, TIME_CAPSULE, 1
	warp_event  6,  0, MOBILE_TRADE_ROOM, 1
	warp_event 10,  0, MOBILE_BATTLE_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  7,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	def_object_events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	object_event  1,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Pokecenter2F_OfficerScript, -1

   	object_event 6, 6, SPRITE_ASH, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NPC_Ash_Script, EVENT_POKECENTER_ASH
	object_event 6, 6, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NPC_Brock_Script, EVENT_POKECENTER_BROCK
	object_event 6, 6, SPRITE_OLD_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, NPC_Misty_Script, EVENT_POKECENTER_MISTY
	object_event 6, 6, SPRITE_GARY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NPC_Gary_Script, EVENT_POKECENTER_GARY
	object_event 6, 6, SPRITE_PIKACHU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NPC_Pikachu_Script, EVENT_POKECENTER_PIKACHU
;	object_event  9,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NPCTradeCrispy, -1