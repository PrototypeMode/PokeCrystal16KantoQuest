MACRO overworld_sprite
; pointer, length, type, palette
	dw \1
	db \2 tiles, BANK(\1), \3, \4
ENDM

OverworldSprites:
; entries correspond to SPRITE_* constants
	table_width NUM_SPRITEDATA_FIELDS
	overworld_sprite AshSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite AshBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite AshRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	
	overworld_sprite OldMistySpriteGFX, 12, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite OldMistyBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite OldMistyRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PINK
	
	
	overworld_sprite BrockSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite BrockBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite BrockRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	
	overworld_sprite GarySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite GaryBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite GaryRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	
	overworld_sprite WalkingPikachuSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite RunningPikachuSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SurfingPikachuSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE

	
	overworld_sprite GameboyKidSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite RivalSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite OakSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RedSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED

	overworld_sprite BillSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ElderSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite JanineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite KurtSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite MomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BlaineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RedsMomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite DaisySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ElmSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite WillSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite FalknerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite WhitneySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BugsySpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite MortySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ChuckSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite JasmineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite PryceSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ClairSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED

	overworld_sprite KarenSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite BrunoSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite MistySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite LanceSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SurgeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite ErikaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite KogaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite SabrinaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	
	overworld_sprite CooltrainerMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite CooltrainerFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	
	overworld_sprite BugCatcherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite TwinSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite YoungsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite LassSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite TeacherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BeautySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SuperNerdSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite RockerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite PokefanMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PokefanFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite GrampsSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite GrannySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite SwimmerGuySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SwimmerGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BigSnorlaxSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE

	overworld_sprite RocketSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RocketGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite NurseSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite LinkReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ClerkSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite FisherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite FishingGuruSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ScientistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KimonoGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SageSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite UnusedGuySpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite GentlemanSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BlackBeltSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite OfficerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite CalSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite SlowpokeSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite CaptainSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BigLaprasSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite GymGuideSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SailorSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BikerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PharmacistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite MonsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite FairySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BirdSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite DragonSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BigOnixSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite N64SpriteGFX, 4, STILL_SPRITE, PAL_OW_SILVER
	overworld_sprite SudowoodoSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite SurfSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PokeBallSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite PokedexSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite PaperSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite GamecubeSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE

	overworld_sprite RockSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite BoulderSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite SnesSpriteGFX, 4, STILL_SPRITE, PAL_OW_SILVER
	overworld_sprite FamicomSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite FruitTreeSpriteGFX, 4, STILL_SPRITE, PAL_OW_TREE
	overworld_sprite GoldTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite SilverTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_SILVER

	overworld_sprite SuicuneSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite EnteiSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite RaikouSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED


	
	overworld_sprite BulbasaurSpriteGFX, 12, STILL_SPRITE, PAL_OW_GREEN
	overworld_sprite SquirtleSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite CharmanderSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
    overworld_sprite PikachuSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	overworld_sprite SurfPikachuSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite UnownSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
    overworld_sprite GeodudeSpriteGFX, 12, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite WeedleSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
    overworld_sprite ShellderSpriteGFX, 12, STILL_SPRITE, PAL_OW_ROCK
    overworld_sprite OddishSpriteGFX, 12, STILL_SPRITE, PAL_OW_GREEN
    overworld_sprite ClefairySpriteGFX, 12, STILL_SPRITE, PAL_OW_PINK
    overworld_sprite GengarSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	overworld_sprite JigglypuffSpriteGFX, 12, STILL_SPRITE, PAL_OW_PINK
	overworld_sprite GrimerSpriteGFX, 12, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite PoliwagSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	overworld_sprite DiglettSpriteGFX, 12, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite StarmieSpriteGFX, 12, STILL_SPRITE, PAL_OW_ROCK
    overworld_sprite MagikarpSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	overworld_sprite MachopSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite TentacoolSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite VoltorbSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	
	overworld_sprite GrowlitheSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
    overworld_sprite ZubatSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
    overworld_sprite TogepiSpriteGFX, 12, STILL_SPRITE, PAL_OW_PINK
    overworld_sprite ButterfreeSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE 
    overworld_sprite JynxSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	overworld_sprite EkansSpriteGFX, 12, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite ParasSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	overworld_sprite TaurosSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite MiltankSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite LaprasSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite RhydonSpriteGFX, 12, STILL_SPRITE, PAL_OW_SILVER
    overworld_sprite FarfetchdSpriteGFX, 12, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite SnorlaxSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite GyaradosSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	
	overworld_sprite ArticunoSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite ZapdosSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
    overworld_sprite MoltresSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	overworld_sprite LugiaSpriteGFX, 12, STILL_SPRITE, PAL_OW_BLUE
    overworld_sprite Ho_OhSpriteGFX, 12, STILL_SPRITE, PAL_OW_RED
	
    overworld_sprite ChanseySpriteGFX, 12, STILL_SPRITE, PAL_OW_PINK
	

	overworld_sprite OldAmberSpriteGFX, 4, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite GamblerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite GamblerAsleepSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite KantoLassSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite KantoLass2SpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BugCatcher2SpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KantoGrampsSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BurlySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	assert_table_length NUM_OVERWORLD_SPRITES
