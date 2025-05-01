CatchTutorial::
	ld a, [wBattleType]
	dec a
	ld c, a
	ld hl, .dw
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw .DudeTutorial
	dw .DudeTutorial
	dw .DudeTutorial

.DudeTutorial:
    ld a, [wPlayerCostume]
	cp 0
    jr z, .AshBackup
	cp 1
    jr z, .MistyBackup
	cp 2
    jr z, .BrockBackup
	cp 3
    jr z, .GaryBackup

.AshBackup
	ld hl, wPlayerName
	ld de, wAshsName
	ld bc, NAME_LENGTH
	call CopyBytes
	jr .DudeContinue
	
.MistyBackup
	ld hl, wPlayerName
	ld de, wMistysName
	ld bc, NAME_LENGTH
	call CopyBytes
	jr .DudeContinue

.BrockBackup
	ld hl, wPlayerName
	ld de, wBrocksName
	ld bc, NAME_LENGTH
	call CopyBytes
	jr .DudeContinue	
	
.GaryBackup
	ld hl, wPlayerName
	ld de, wGarysName
	ld bc, NAME_LENGTH
	call CopyBytes	
;	jr .DudeContinue

; ; Back up your name to your Mom's name.
	; ld hl, wPlayerName
	; ld de, wBrocksName
	; ld bc, NAME_LENGTH
	; call CopyBytes
	
.DudeContinue	
     ld a, [wMapGroup]
	 ld b, a	
	 ld a, [wMapNumber]
	 ld c, a
     call GetWorldMapLocation
     cp LANDMARK_PALLET_TOWN
	 jr z, .OakTutorialName
     cp LANDMARK_VIRIDIAN_CITY
	 jr z, .OldDudeTutorialName

.OakTutorialName
; Copy Dude's name to your name
	ld hl, .OakName
	jr .IntoPlayerName
.OldDudeTutorialName
; Copy Dude's name to your name
	ld hl, .OldDudeName

.IntoPlayerName	
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	call .LoadDudeData

	xor a
	ldh [hJoyDown], a
	ldh [hJoyPressed], a
	ld a, [wOptions]
	push af
	and ~TEXT_DELAY_MASK
	add TEXT_DELAY_MED
	ld [wOptions], a
	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	callfar StartBattle
	call StopAutoInput	
	pop af

	ld [wOptions], a
	jr RestoreName


.LoadDudeData:
	ld hl, wDudeNumItems
	ld [hl], 1
	inc hl
	ld [hl], POTION
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], -1
	ld hl, wDudeNumKeyItems
	ld [hl], 0
	inc hl
	ld [hl], -1
	ld hl, wDudeNumBalls
	ld a, 1
	ld [hli], a
	ld a, POKE_BALL
	ld [hli], a
	ld [hli], a
	ld [hl], -1
	ret

.OakName:
	db "PROF. OAK@"
    end
	
.OldDudeName:
	db "OLD DUDE@"
    end 
	
.AutoInput:
	db NO_INPUT, $ff ; end

	
RestoreName:	
    ld a, [wPlayerCostume]
	cp 0
    jr z, .AshRestore
	cp 1
    jr z, .MistyRestore
	cp 2
    jr z, .BrockRestore
	cp 3
    jr z, .GaryRestore	


.AshRestore
	ld hl, wAshsName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
	
.MistyRestore
	ld hl, wMistysName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret	

.BrockRestore
	ld hl, wBrocksName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
	
.GaryRestore
	ld hl, wGarysName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret	