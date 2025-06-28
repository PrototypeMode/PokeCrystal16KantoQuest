	object_const_def
	const PEWTERPOKECENTER1F_NURSE
	const PEWTERPOKECENTER1F_CHANSEY
	const PEWTERPOKECENTER1F_GENTLEMAN
	const PEWTERPOKECENTER1F_JIGGLYPUFF
	const PEWTERPOKECENTER1F_BUG_CATCHER
	const PEWTERPOKECENTER1F_NPC_TRADE_CHRIS
	; const PEWTERPOKECENTER1F_NPC_ASH
	; const PEWTERPOKECENTER1F_NPC_BROCK
	; const PEWTERPOKECENTER1F_NPC_MISTY
	 ; const PEWTERPOKECENTER1F_NPC_GARY
	 ; const PEWTERPOKECENTER1F_NPC_PIKACHU

PewterPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script PewterPokecenter1FScene, SCENE_PEWTERPOKECENTER_1F_NOOP


	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterPokecenterCallback
	
PewterPokecenter1FScene:

	end
	
PewterPokecenterCallback:
    endcallback
   ; setevent EVENT_POKECENTER_ASH   
   ; setevent EVENT_POKECENTER_MISTY   
   ; setevent EVENT_POKECENTER_BROCK   
   ; setevent EVENT_POKECENTER_GARY   
   ; setevent EVENT_POKECENTER_PIKACHU
   ; readmem wTeamCount
   ; ifequal 0, .DeleteTeamNPC
   ; ifgreater 0, .GenerateNPC1
; ;   ifequal 2, .GenerateNPC2
    ; endcallback
	
; .DeleteTeamNPC
   ; setevent EVENT_POKECENTER_ASH   
   ; setevent EVENT_POKECENTER_MISTY   
   ; setevent EVENT_POKECENTER_BROCK   
   ; setevent EVENT_POKECENTER_GARY   
   ; setevent EVENT_POKECENTER_PIKACHU
   ; endcallback
   
; .GenerateNPC1
   ; readmem wPokecenterChar1
   ; ifequal 1, .JustAsh
   ; ifequal 2, .JustMisty
   ; ifequal 3, .JustBrock
   ; ifequal 4, .JustGary
   ; ifequal 5, .JustPikachu


   ; endcallback
   
; .JustAsh
   ; setevent EVENT_POKECENTER_MISTY
   ; setevent EVENT_POKECENTER_BROCK
   ; setevent EVENT_POKECENTER_GARY
   ; setevent EVENT_POKECENTER_PIKACHU
   ; clearevent EVENT_POKECENTER_ASH
   ; readmem wPokecenterChar2
   ; ifgreater 0, .GenerateNPC2
   ; endcallback   
   
; .JustBrock
   ; setevent EVENT_POKECENTER_ASH
   ; setevent EVENT_POKECENTER_MISTY
   ; setevent EVENT_POKECENTER_GARY
   ; setevent EVENT_POKECENTER_PIKACHU
   ; clearevent EVENT_POKECENTER_BROCK
   ; readmem wPokecenterChar2
   ; ifgreater 0, .GenerateNPC2   
   ; endcallback
   
; .JustMisty
   ; setevent EVENT_POKECENTER_ASH
   ; setevent EVENT_POKECENTER_BROCK
   ; setevent EVENT_POKECENTER_GARY
   ; setevent EVENT_POKECENTER_PIKACHU
   ; clearevent EVENT_POKECENTER_MISTY
   ; readmem wPokecenterChar2
   ; ifgreater 0, .GenerateNPC2
  
   ; endcallback
   
; .JustGary
   ; setevent EVENT_POKECENTER_ASH
   ; setevent EVENT_POKECENTER_BROCK
   ; setevent EVENT_POKECENTER_MISTY
   ; setevent EVENT_POKECENTER_PIKACHU
   ; clearevent EVENT_POKECENTER_GARY
   ; readmem wPokecenterChar2
    ; ifgreater 0, .GenerateNPC2
   ; endcallback

; .JustPikachu
   ; setevent EVENT_POKECENTER_ASH
   ; setevent EVENT_POKECENTER_BROCK
   ; setevent EVENT_POKECENTER_MISTY
   ; setevent EVENT_POKECENTER_GARY
   ; clearevent EVENT_POKECENTER_PIKACHU
   ; readmem wPokecenterChar2
    ; ifgreater 0, .GenerateNPC2
   ; endcallback      

; .GenerateNPC2
   ; readmem wPokecenterChar2
   ; ifequal 1, .JustAsh2
   ; ifequal 2, .JustMisty2
   ; ifequal 3, .JustBrock2
   ; ifequal 4, .JustGary2
   ; ifequal 5, .JustPikachu2 
 
   ; endcallback
   
; .JustAsh2

   ; clearevent EVENT_POKECENTER_ASH
   ; moveobject PEWTERPOKECENTER1F_NPC_ASH, 9, 5
   ; appear PEWTERPOKECENTER1F_NPC_ASH
   ; endcallback

; .JustMisty2

   ; clearevent EVENT_POKECENTER_MISTY
   ; moveobject PEWTERPOKECENTER1F_NPC_MISTY, 9, 5
    ; appear PEWTERPOKECENTER1F_NPC_MISTY
   ; endcallback

; .JustBrock2

   ; clearevent EVENT_POKECENTER_BROCK
   ; moveobject PEWTERPOKECENTER1F_NPC_BROCK, 9, 5
    ; appear PEWTERPOKECENTER1F_NPC_BROCK
   ; endcallback
   
; .JustGary2

   ; clearevent EVENT_POKECENTER_GARY
   ; moveobject PEWTERPOKECENTER1F_NPC_GARY, 9, 5
    ; appear PEWTERPOKECENTER1F_NPC_GARY
   ; endcallback

; .JustPikachu2
   

   ; clearevent EVENT_POKECENTER_PIKACHU
   ; moveobject PEWTERPOKECENTER1F_NPC_PIKACHU, 9, 5
    ; appear PEWTERPOKECENTER1F_NPC_PIKACHU
   ; endcallback    
   
PewterPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
PewterChansey:
	refreshscreen
	pokepic CHANSEY
    waitbutton
	closepokepic

	opentext
	writetext PewterChanseyText
	cry CHANSEY
	waitbutton
    closetext

	end	

PewterPokecenter1FGentlemanScript:
    faceplayer
	opentext
	writetext PewterPokecenter1FGentlemanText
    promptbutton
	closetext
	turnobject PEWTERPOKECENTER1F_GENTLEMAN, LEFT
	end

PewterJigglypuff:
	refreshscreen
	pokepic JIGGLYPUFF
    waitbutton
	closepokepic
	special FadeOutMusic
	opentext
	writetext PewterJigglypuffText

	playsound SFX_SING
	waitsfx
	closetext
   sjump FallAsleepScript
	end

FallAsleepScript:
   turnobject PLAYER, DOWN
   showemote EMOTE_SLEEP, PLAYER, 90
   earthquake 16
   showemote EMOTE_SHOCK, PLAYER, 24
   special RestartMapMusic
   end

; NPC_Ash_Script:
  ; faceplayer
  ; random 3
  ; ifequal 0, .AshText0
  ; ifequal 1, .AshText1
  ; ifequal 2, .AshText2
 ; end
 
; .AshText0 
  ; opentext
  ; farwritetext NPC_Ash_Text0
  ; promptbutton
  ; closetext
  ; sjump .AshText3
  ; end
 
; .AshText1
  ; opentext
  ; farwritetext NPC_Ash_Text1
  ; promptbutton
  ; closetext
  ; sjump .AshText3
  ; end
  
; .AshText2
  ; opentext
  ; farwritetext NPC_Ash_Text2
  ; promptbutton
  ; closetext
  ; sjump .AshText3
  ; end
 
; .AshText3
  ; opentext
  ; farwritetext NPC_Ash_Text3
  ; promptbutton
  ; yesorno
  ; iftrue .AshText4
  ; iffalse .AshText5
  ; end

; .AshText4
  ; opentext
  ; farwritetext NPC_Ash_Text4
  ; promptbutton
  ; closetext
  ; sjump SwitchAshWithPlayer
 
  ; end
  
; .AshText5 
  ; opentext
  ; farwritetext NPC_Ash_Text5
  ; promptbutton
  ; closetext
  ; end   

; NPC_Misty_Script:
  ; faceplayer
  ; random 3
  ; ifequal 0, .MistyText0
  ; ifequal 1, .MistyText1
  ; ifequal 2, .MistyText2
 ; end
 
; .MistyText0 
  ; opentext
  ; farwritetext NPC_Misty_Text0
  ; promptbutton
  ; closetext
  ; sjump .MistyText3
  ; end
 
; .MistyText1
  ; opentext
  ; farwritetext NPC_Misty_Text1
  ; promptbutton
  ; closetext
  ; sjump .MistyText3
  ; end
  
; .MistyText2
  ; opentext
  ; farwritetext NPC_Misty_Text2
  ; promptbutton
  ; closetext
  ; sjump .MistyText3
  ; end
 
; .MistyText3
  ; opentext
  ; farwritetext NPC_Misty_Text3
  ; promptbutton
  ; yesorno
  ; iftrue .MistyText4
  ; iffalse .MistyText5
  ; end

; .MistyText4
  ; opentext
  ; farwritetext NPC_Misty_Text4
  ; promptbutton
  ; closetext
  ; sjump SwitchMistyWithPlayer
 
  ; end
  
; .MistyText5 
  ; opentext
  ; farwritetext NPC_Misty_Text5
  ; promptbutton
  ; closetext
  ; end  
 
 
; NPC_Brock_Script:
  ; faceplayer
  ; random 3
  ; ifequal 0, .BrockText0
  ; ifequal 1, .BrockText1
  ; ifequal 2, .BrockText2
  ; end
  
; .BrockText0 
  ; opentext
  ; farwritetext NPC_Brock_Text0
  ; promptbutton
  ; closetext
  ; sjump .BrockText3
  ; end
 
; .BrockText1
  ; opentext
  ; farwritetext NPC_Brock_Text1
  ; promptbutton
  ; closetext
  ; sjump .BrockText3
  ; end
  
; .BrockText2
  ; opentext
  ; farwritetext NPC_Brock_Text2
  ; promptbutton
  ; closetext
  ; sjump .BrockText3
  ; end
 
; .BrockText3
  ; opentext
  ; farwritetext NPC_Brock_Text3
  ; promptbutton
  ; yesorno
  ; iftrue .BrockText4
  ; iffalse .BrockText5
  ; end

; .BrockText4
  ; opentext
  ; farwritetext NPC_Brock_Text4
  ; promptbutton
  ; closetext
  ; sjump SwitchBrockWithPlayer
 
  ; end
  
; .BrockText5 
  ; opentext
  ; farwritetext NPC_Brock_Text5
  ; promptbutton
  ; closetext
  ; end  
  
; NPC_Gary_Script:
  ; faceplayer
  ; random 3
  ; ifequal 0, .GaryText0
  ; ifequal 1, .GaryText1
  ; ifequal 2, .GaryText2
  ; end
  
; .GaryText0 
  ; opentext
  ; farwritetext NPC_Gary_Text0
  ; promptbutton
  ; closetext
  ; sjump .GaryText3
  ; end
 
; .GaryText1
  ; opentext
  ; farwritetext NPC_Gary_Text1
  ; promptbutton
  ; closetext
  ; sjump .GaryText3
  ; end
  
; .GaryText2
  ; opentext
  ; farwritetext NPC_Gary_Text2
  ; promptbutton
  ; closetext
  ; sjump .GaryText3
  ; end
 
; .GaryText3
  ; opentext
  ; farwritetext NPC_Gary_Text3
  ; promptbutton
  ; yesorno
  ; iftrue .GaryText4
  ; iffalse .GaryText5
  ; end

; .GaryText4
  ; opentext
  ; farwritetext NPC_Gary_Text4
  ; promptbutton
  ; closetext
  ; sjump SwitchGaryWithPlayer
 
  ; end
  
; .GaryText5 
  ; opentext
  ; farwritetext NPC_Gary_Text5
  ; promptbutton
  ; closetext
  ; end  
 ; end

; NPC_Pikachu_Script:
 ; end
 
; SwitchAshWithPlayer:
 	; readvar VAR_FACING
	; ifequal DOWN, StepUpAshScript
	; ifequal UP, StepDownAshScript
	; ifequal LEFT, StepRightAshScript
	; ifequal RIGHT, StepLeftAshScript
	; end 
 
; SwitchMistyWithPlayer:
 	; readvar VAR_FACING
	; ifequal DOWN, StepUpMistyScript
	; ifequal UP, StepDownMistyScript
	; ifequal LEFT, StepRightMistyScript
	; ifequal RIGHT, StepLeftMistyScript
	; end 
 
; SwitchBrockWithPlayer:
 	; readvar VAR_FACING
	; ifequal DOWN, StepUpBrockScript
	; ifequal UP, StepDownBrockScript
	; ifequal LEFT, StepRightBrockScript
	; ifequal RIGHT, StepLeftBrockScript
	; end
	
; SwitchGaryWithPlayer:
 	; readvar VAR_FACING
	; ifequal DOWN, StepUpGaryScript
	; ifequal UP, StepDownGaryScript
	; ifequal LEFT, StepRightGaryScript
	; ifequal RIGHT, StepLeftGaryScript
	; end
	
; SwitchPikachuWithPlayer:
 	; readvar VAR_FACING
	; ifequal DOWN, StepUpPikachuScript
	; ifequal UP, StepDownPikachuScript
	; ifequal LEFT, StepRightPikachuScript
	; ifequal RIGHT, StepLeftPikachuScript
	; end		
	
; SwapNPC1WithPlayer:

	; ld a, [wPlayerCostume]
	; inc a
	; ld [wPokecenterChar1], a
	; ret
	
; SwapNPC2WithPlayer:	
	; ld a, [wPlayerCostume]
	; inc a
	; ld [wPokecenterChar2], a
	; ret	
	
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; StepUpAshScript:
    ; applymovement PEWTERPOKECENTER1F_NPC_ASH, PewterPCStepUpMovement
	; readvar VAR_XCOORD
    ; ifequal 8, FinishAshScript
    ; ifequal 9, FinishAshScript2
	; end
	
; StepDownAshScript:
   ; applymovement PEWTERPOKECENTER1F_NPC_ASH, PewterPCStepDownMovement
	; readvar VAR_XCOORD
    ; ifequal 8, FinishAshScript
    ; ifequal 9, FinishAshScript2
   ; end
; StepLeftAshScript:  
   ; applymovement PEWTERPOKECENTER1F_NPC_ASH, PewterPCStepLeftMovement
  	; readvar VAR_XCOORD
    ; ifequal 7, FinishAshScript
    ; ifequal 8, FinishAshScript2
   ; end
; StepRightAshScript:
    ; applymovement PEWTERPOKECENTER1F_NPC_ASH, PewterPCStepRightMovement
   	; readvar VAR_XCOORD
    ; ifequal 9, FinishAshScript
    ; ifequal 10, FinishAshScript2
   ; end
   
; FinishAshScript:
	 ; disappear PEWTERPOKECENTER1F_NPC_ASH
	 ; setevent EVENT_POKECENTER_ASH	 
	 ; callasm SwapNPC1WithPlayer
     ; callasm AshCostumeChange 
	 ; sjump CheckPokecenterChar1
; end

; FinishAshScript2:
	 ; disappear PEWTERPOKECENTER1F_NPC_ASH
	 ; setevent EVENT_POKECENTER_ASH	 
	 ; callasm SwapNPC2WithPlayer
	 ; moveobject PEWTERPOKECENTER1F_NPC_ASH, 9, 5
     ; callasm AshCostumeChange 
	 ; sjump CheckPokecenterChar2
; end     
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; StepUpBrockScript:
	; ; disappear PLAYER
    ; applymovement PEWTERPOKECENTER1F_NPC_BROCK, PewterPCStepUpMovement
 	; readvar VAR_XCOORD
    ; ifequal 8, FinishBrockScript
    ; ifequal 9, FinishBrockScript2
	; end
	
; StepDownBrockScript:
	; ; disappear PLAYER
   ; applymovement PEWTERPOKECENTER1F_NPC_BROCK, PewterPCStepDownMovement
	; readvar VAR_XCOORD
    ; ifequal 8, FinishBrockScript
    ; ifequal 9, FinishBrockScript2
   ; end
; StepLeftBrockScript: 
	; ; disappear PLAYER
   ; applymovement PEWTERPOKECENTER1F_NPC_BROCK, PewterPCStepLeftMovement
  	; readvar VAR_XCOORD
    ; ifequal 7, FinishBrockScript
    ; ifequal 8, FinishBrockScript2
   ; end
; StepRightBrockScript:
	; ; disappear PLAYER
    ; applymovement PEWTERPOKECENTER1F_NPC_BROCK, PewterPCStepRightMovement
   	; readvar VAR_XCOORD
    ; ifequal 9, FinishBrockScript
    ; ifequal 10, FinishBrockScript2
   ; end
   
; FinishBrockScript:
	 ; disappear PEWTERPOKECENTER1F_NPC_BROCK
	 ; setevent EVENT_POKECENTER_BROCK	 
	 ; callasm SwapNPC1WithPlayer
	 
     ; callasm BrockCostumeChange
    ; sjump CheckPokecenterChar1
; end

; FinishBrockScript2:
	 ; disappear PEWTERPOKECENTER1F_NPC_BROCK
	 ; setevent EVENT_POKECENTER_BROCK	 
	 ; callasm SwapNPC2WithPlayer
	 
     ; callasm BrockCostumeChange
    ; sjump CheckPokecenterChar2
; end      
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; StepUpMistyScript:
   ; applymovement PEWTERPOKECENTER1F_NPC_MISTY, PewterPCStepUpMovement
 	; readvar VAR_XCOORD
    ; ifequal 8, FinishMistyScript
    ; ifequal 9, FinishMistyScript2
	; end
; StepDownMistyScript:
    ; applymovement PEWTERPOKECENTER1F_NPC_MISTY, PewterPCStepDownMovement
	; readvar VAR_XCOORD
    ; ifequal 8, FinishMistyScript
    ; ifequal 9, FinishMistyScript2
   ; end
; StepLeftMistyScript:  
    ; applymovement PEWTERPOKECENTER1F_NPC_MISTY, PewterPCStepLeftMovement
  	; readvar VAR_XCOORD
    ; ifequal 7, FinishMistyScript
    ; ifequal 8, FinishMistyScript2
   ; end
; StepRightMistyScript:
   ; applymovement PEWTERPOKECENTER1F_NPC_MISTY, PewterPCStepRightMovement
   	; readvar VAR_XCOORD
    ; ifequal 9, FinishMistyScript
    ; ifequal 10, FinishMistyScript2
   ; end
   
; FinishMistyScript:
	 ; disappear PEWTERPOKECENTER1F_NPC_MISTY
	 ; setevent EVENT_POKECENTER_MISTY	 
	 ; callasm SwapNPC1WithPlayer
     ; callasm MistyCostumeChange
	 
     ; sjump CheckPokecenterChar1
     ; end

; FinishMistyScript2:
	 ; disappear PEWTERPOKECENTER1F_NPC_MISTY
	 ; setevent EVENT_POKECENTER_MISTY	 
	 ; callasm SwapNPC2WithPlayer
     ; callasm MistyCostumeChange
	 
     ; sjump CheckPokecenterChar2
     ; end  	 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; StepUpGaryScript:
   ; applymovement PEWTERPOKECENTER1F_NPC_GARY, PewterPCStepUpMovement
 	; readvar VAR_XCOORD
    ; ifequal 8, FinishGaryScript
    ; ifequal 9, FinishGaryScript2
	; end
; StepDownGaryScript:
    ; applymovement PEWTERPOKECENTER1F_NPC_GARY, PewterPCStepDownMovement
 	; readvar VAR_XCOORD
    ; ifequal 8, FinishGaryScript
    ; ifequal 9, FinishGaryScript2
   ; end
; StepLeftGaryScript:  
    ; applymovement PEWTERPOKECENTER1F_NPC_GARY, PewterPCStepLeftMovement
  	; readvar VAR_XCOORD
    ; ifequal 7, FinishGaryScript
    ; ifequal 8, FinishGaryScript2
   ; end
; StepRightGaryScript:
   ; applymovement PEWTERPOKECENTER1F_NPC_GARY, PewterPCStepRightMovement
   	; readvar VAR_XCOORD
    ; ifequal 9, FinishGaryScript
    ; ifequal 10, FinishGaryScript2
   ; end
   
; FinishGaryScript:
	 ; disappear PEWTERPOKECENTER1F_NPC_GARY
	 ; setevent EVENT_POKECENTER_GARY	 
	 ; callasm SwapNPC1WithPlayer
     ; callasm GaryCostumeChange
	 
     ; sjump CheckPokecenterChar1
     ; end

; FinishGaryScript2:
	 ; disappear PEWTERPOKECENTER1F_NPC_GARY
	 ; setevent EVENT_POKECENTER_GARY	 
	 ; callasm SwapNPC2WithPlayer
     ; callasm GaryCostumeChange
	 
     ; sjump CheckPokecenterChar2
     ; end      	 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; StepUpPikachuScript:
   ; applymovement PEWTERPOKECENTER1F_NPC_PIKACHU, PewterPCStepUpMovement
   ; sjump FinishPikachuScript
	; end
; StepDownPikachuScript:
    ; applymovement PEWTERPOKECENTER1F_NPC_PIKACHU, PewterPCStepDownMovement
   ; sjump FinishPikachuScript
   ; end
; StepLeftPikachuScript:  
    ; applymovement PEWTERPOKECENTER1F_NPC_PIKACHU, PewterPCStepLeftMovement
   ; sjump FinishPikachuScript
   ; end
; StepRightPikachuScript:
   ; applymovement PEWTERPOKECENTER1F_NPC_PIKACHU, PewterPCStepRightMovement
   ; sjump FinishPikachuScript
   ; end
   
; FinishPikachuScript:
	 ; disappear PEWTERPOKECENTER1F_NPC_PIKACHU
	 ; setevent EVENT_POKECENTER_PIKACHU	 
	 ; callasm SwapNPC1WithPlayer
     ; callasm PikachuCostumeChange
	 
     ; sjump CheckPokecenterChar1
     ; end

; FinishPikachuScript2:
	 ; disappear PEWTERPOKECENTER1F_NPC_PIKACHU
	 ; setevent EVENT_POKECENTER_PIKACHU	 
	 ; callasm SwapNPC2WithPlayer
     ; callasm PikachuCostumeChange
	 
     ; sjump CheckPokecenterChar2
     ; end    	 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CheckPokecenterChar1:   
	 ; readmem wPokecenterChar1
	 ; ifequal 1, AshAppear
	 ; ifequal 2, MistyAppear
	 ; ifequal 3, BrockAppear
	 ; ifequal 4, GaryAppear
	 ; ifequal 5, PikachuAppear
	 ; end

; CheckPokecenterChar2:   
	 ; readmem wPokecenterChar2
	 ; ifequal 1, AshAppear2
	 ; ifequal 2, MistyAppear2
	 ; ifequal 3, BrockAppear2
	 ; ifequal 4, GaryAppear2
	 ; ifequal 5, PikachuAppear2
	 ; end

; AshAppear2:
  ; moveobject PEWTERPOKECENTER1F_NPC_ASH, 9, 5
   ; clearevent EVENT_POKECENTER_ASH
  ; appear PEWTERPOKECENTER1F_NPC_ASH
  ; end
  
; AshAppear:
  ; moveobject PEWTERPOKECENTER1F_NPC_ASH, 8, 5
 ; clearevent EVENT_POKECENTER_ASH
  ; appear PEWTERPOKECENTER1F_NPC_ASH
    ; end

; MistyAppear2:
  ; moveobject PEWTERPOKECENTER1F_NPC_MISTY, 9, 5
   ; clearevent EVENT_POKECENTER_MISTY	
  ; appear PEWTERPOKECENTER1F_NPC_MISTY
  ; end
  
; MistyAppear:
  ; moveobject PEWTERPOKECENTER1F_NPC_MISTY, 8, 5
 ; clearevent EVENT_POKECENTER_MISTY	
  ; appear PEWTERPOKECENTER1F_NPC_MISTY
    ; end

; BrockAppear2:
 ; moveobject PEWTERPOKECENTER1F_NPC_BROCK, 9, 5
  ; clearevent EVENT_POKECENTER_BROCK
  ; appear PEWTERPOKECENTER1F_NPC_BROCK
    ; end	
	
; BrockAppear:
 ; moveobject PEWTERPOKECENTER1F_NPC_BROCK, 8, 5
 ; clearevent EVENT_POKECENTER_BROCK
  ; appear PEWTERPOKECENTER1F_NPC_BROCK
    ; end	
	
; GaryAppear2:
  ; moveobject PEWTERPOKECENTER1F_NPC_GARY, 9, 5
   ; clearevent EVENT_POKECENTER_GARY
  ; appear PEWTERPOKECENTER1F_NPC_GARY
    ; end
	
; GaryAppear:
  ; moveobject PEWTERPOKECENTER1F_NPC_GARY, 8, 5
 ; clearevent EVENT_POKECENTER_GARY
  ; appear PEWTERPOKECENTER1F_NPC_GARY
    ; end

; PikachuAppear2:
 ; moveobject PEWTERPOKECENTER1F_NPC_PIKACHU, 9, 5
 ; clearevent EVENT_POKECENTER_PIKACHU
  ; appear PEWTERPOKECENTER1F_NPC_PIKACHU
    ; end		 
; PikachuAppear:
 ; moveobject PEWTERPOKECENTER1F_NPC_PIKACHU, 8, 5
 ; clearevent EVENT_POKECENTER_PIKACHU
  ; appear PEWTERPOKECENTER1F_NPC_PIKACHU
    ; end		



; PewterPCStepUpMovement:   
   ; step UP
    ; step_end
 
; PewterPCStepDownMovement:   
   ; step DOWN
    ; step_end

; PewterPCStepLeftMovement:   
   ; step LEFT
    ; step_end

; PewterPCStepRightMovement:   
   ; step RIGHT
    ; step_end
	
PewterPokecenter1FBugCatcherScript:
	jumptextfaceplayer PewterPokecenter1FBugCatcherText

NPCTradeChris:
    special SetTradeNPCGenderBoy
	faceplayer
	opentext
	trade NPC_TRADE_CHRIS
	waitbutton
	closetext
	end
	


PewterPokecenter1FGentlemanText:
	text "What!?"

	para "TEAM ROCKET is"
	line "at MT.MOON?"

	para "…Huh? I'm on the"
	line "phone!"
	
	para "Scram!"
	done

PewterJigglypuffText:
	text "JIGGLYPUFF: Jiii-"
	line "ga-leee-puuuff!"
	done
	
PewterChanseyText:
	text "CHANSEY: Chan!"
	line "Chansey!"
	done	

PewterPokecenter1FBugCatcherText:
	text "Most #MON get"
	line "drowsy if they"

	para "hear a JIGGLYPUFF"
	line "singing."

	para "There are several"
	line "moves that can be"

	para "used only while a"
	line "#MON is asleep."
	done
	

	
PewterPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, PEWTER_CITY, 4
	warp_event  4,  7, PEWTER_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FNurseScript, -1
	object_event  4,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterChansey, -1
	object_event  8,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FGentlemanScript, -1
	object_event  1,  3, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterJigglypuff, -1
	object_event  0,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FBugCatcherScript, -1
	object_event  9,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NPCTradeChris, -1
	
	; object_event 8, 5, SPRITE_ASH, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NPC_Ash_Script, EVENT_POKECENTER_ASH
	; object_event 8, 5, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NPC_Brock_Script, EVENT_POKECENTER_BROCK
	; object_event 8, 5, SPRITE_OLD_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, NPC_Misty_Script, EVENT_POKECENTER_MISTY
	; object_event 8, 5, SPRITE_GARY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NPC_Gary_Script, EVENT_POKECENTER_GARY
	; object_event 8, 5, SPRITE_PIKACHU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NPC_Pikachu_Script, EVENT_POKECENTER_PIKACHU
