	object_const_def
	const LAVENDERTOWER6F_RECEPTIONIST
	const LAVENDERTOWER6F_OFFICER
	const LAVENDERTOWER6F_SUPER_NERD1
	const LAVENDERTOWER6F_GENTLEMAN
	const LAVENDERTOWER6F_SUPER_NERD2

LavenderTower6F_MapScripts:
	def_scene_scripts

	scene_script LavenderTower6FNoop1Scene, SCENE_LAVENDERTOWER6F_NOOP
	scene_script LavenderTower6FNoop2Scene, SCENE_LAVENDERTOWER6F_NOOP2

	
	def_callbacks

LavenderTower6FNoop1Scene:
    end
LavenderTower6FNoop2Scene:
    end
	
LavenderTowerMarowakGhost:
    checkevent EVENT_DEFEATED_GHOST_MAROWAK
     iffalse .Battle
	 end
	 
.Battle	 
	opentext
	writetext SilphGhostCryText2
	pause 15
	cry MAROWAK
	closetext
	loadwildmon MAROWAK, 5
	loadvar VAR_BATTLETYPE, BATTLETYPE_GHOST
	startbattle
	ifequal LOSE, .NotBeaten1
	ifequal WIN, .Beaten
	;disappear VIRIDIANFOREST_GHOST
	
		
		
.NotBeaten1:
	reloadmapafterbattle
	opentext
	giveitem SILPH_SCOPE
	waitsfx
	writetext LavenderTowerGotSilphScopeText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
    applymovement PLAYER, StepAwayFromGhostMovement
	end	
	
.Beaten:	
	reloadmapafterbattle
	setevent EVENT_DEFEATED_GHOST_MAROWAK
	end
	
SilphGhostCryText2:
	text "GHOST: Woooo..."
	done


LavenderTowerGotSilphScopeText:
	text "<PLAYER> obtained a"
	line "SILPH SCOPE!"
	done	

LavenderTower6F_DefeatedGhostMarowakText:
	text "The spirit of"
	line "MAROWAK was calmed!"
	done	

BlankScript:
    end



	
StepAwayFromGhostMovement:
    step RIGHT
    turn_head UP
    step_end

BeatGhostMovement:
  
    turn_head LEFT
    step_end

LavenderTower6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  9, LAVENDER_TOWER_5F, 2
	warp_event  9, 16, LAVENDER_TOWER_7F, 1

	def_coord_events
    coord_event  10,  16, SCENE_LAVENDERTOWER6F_NOOP, LavenderTowerMarowakGhost
	
	def_bg_events
	; bg_event 17, 13, BGEVENT_READ, LavenderTower6FDirectory
	; bg_event 16, 13, BGEVENT_READ, LavenderTower6FPokeFluteSign

	def_object_events
	object_event 13,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlankScript, -1
	object_event 15, 13, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlankScript, -1
	object_event  8, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlankScript, -1
	object_event 16,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlankScript, -1
	object_event 17,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlankScript, -1
