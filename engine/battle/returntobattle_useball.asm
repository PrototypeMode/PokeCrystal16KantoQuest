_ReturnToBattle_UseBall:
    ld a, [wCurItem]
	ld [wCurItemBackup], a
	
	farcall DrawPlayerHUD
	call ClearBGPalettes
	call ClearTilemap
	
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .gettutorialbackpic
	
	farcall GetTrainerBackpic
	farcall _CGB_BattleColors
	jr .continue

.gettutorialbackpic
	farcall GetTrainerBackpic
.continue
	farcall GetEnemyMonFrontpic
	farcall _LoadBattleFontsHPBar
	call GetMemSGBLayout
	call CloseWindow
	call LoadStandardMenuHeader
	call WaitBGMap
	farcall _CGB_BattleColors
	jp SetDefaultBGPAndOBP
