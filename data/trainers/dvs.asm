TrainerClassDVs:
; entries correspond to trainer classes (see constants/trainer_constants.asm)
	table_width 2
	;  atk,def,spd,spc
	dn  9, 10,  7,  7 ; FALKNER
	dn  8,  8,  8,  8 ; WHITNEY
	dn  9,  8,  8,  8 ; BUGSY
	dn  9,  8,  8,  8 ; MORTY
	dn  9,  8,  8,  8 ; PRYCE
	dn  9,  8,  8,  8 ; JASMINE
	dn  9,  8,  8,  8 ; CHUCK
	dn  7, 12, 13, 13 ; CLAIR
	dn 13, 13, 13, 13 ; RIVAL1
	dn  9,  8,  8,  8 ; POKEMON_PROF
	dn 13, 12, 13, 13 ; WILL
	dn 13, 12, 13, 13 ; CAL
	dn 13, 12, 13, 13 ; BRUNO
	dn  7, 15, 13, 15 ; KAREN
	dn 13, 12, 13, 13 ; KOGA
	dn 13, 12, 13, 13 ; CHAMPION
	dn  9,  8,  8,  8 ; BROCK
	dn  7,  8,  8,  8 ; MISTY
	dn  9,  8,  8,  8 ; LT_SURGE
	dn  9,  8,  8,  8 ; SCIENTIST
	dn  7,  8,  8,  8 ; ERIKA
	dn  9,  8,  8,  8 ; YOUNGSTER
	dn  9,  8,  8,  8 ; SCHOOLBOY
	dn  9,  8,  8,  8 ; BIRD_KEEPER
	dn  5,  8,  8,  8 ; LASS
	dn  9,  8,  8,  8 ; JANINE
	dn 13,  8, 12,  8 ; COOLTRAINERM
	dn  7, 12, 12,  8 ; COOLTRAINERF
	dn  6,  9, 12,  8 ; BEAUTY
	dn  9,  8,  8,  8 ; POKEMANIAC
	dn 13,  8, 10,  8 ; GRUNTM
	dn  9,  8,  8,  8 ; GENTLEMAN
	dn  9,  8,  8,  8 ; SKIER
	dn  6,  8,  8,  8 ; TEACHER
	dn  7, 13,  8,  7 ; SABRINA
	dn  9,  8,  8,  8 ; BUG_CATCHER
	dn  9,  8,  8,  8 ; FISHER
	dn  9,  8,  8,  8 ; SWIMMERM
	dn  7,  8,  8,  8 ; SWIMMERF
	dn  9,  8,  8,  8 ; SAILOR
	dn  9,  8,  8,  8 ; SUPER_NERD
; BUG: RIVAL2 has lower DVs than RIVAL1 (see docs/bugs_and_glitches.md)
	dn  9,  8,  8,  8 ; RIVAL2
	dn  9,  8,  8,  8 ; GUITARIST
	dn 10,  8,  8,  8 ; HIKER
	dn  9,  8,  8,  8 ; BIKER
	dn  9,  8,  8,  8 ; BLAINE
	dn  9,  8,  8,  8 ; BURGLAR
	dn  9,  8,  8,  8 ; FIREBREATHER
	dn  9,  8,  8,  8 ; JUGGLER
	dn  9,  8,  8,  8 ; BLACKBELT_T
	dn 13,  8, 10,  8 ; EXECUTIVEM
	dn  9,  8,  8,  8 ; PSYCHIC_T
	dn  6, 10, 10,  8 ; PICNICKER
	dn  9,  8,  8,  8 ; CAMPER
	dn  7, 14, 10,  8 ; EXECUTIVEF
	dn  9,  8,  8,  8 ; SAGE
	dn  7,  8,  8,  8 ; MEDIUM
	dn  9,  8,  8,  8 ; BOARDER
	dn  9,  8,  8,  8 ; POKEFANM
	dn  6,  8,  8, 10 ; KIMONO_GIRL
	dn  6,  8, 10,  8 ; TWINS
	dn  6, 13,  8,  8 ; POKEFANF
	dn 15, 13, 13, 14 ; RED
	dn  9, 13, 13, 13 ; BLUE
	dn  9,  8,  8,  8 ; OFFICER
	dn  7, 14, 10,  8 ; GRUNTF
	dn  9,  8,  8,  8 ; MYSTICALMAN
	dn 13, 13, 13, 13 ; RIVAL GARY
	dn 13, 13, 13, 13 ; RIVAL ASH
	assert_table_length NUM_TRAINER_CLASSES
