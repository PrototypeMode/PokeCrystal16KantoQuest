_UpdateBattleHUDs:
    farcall _CGB_BattleColors
	farcall DrawPlayerHUD
	ld hl, wPlayerHPPal
	call SetHPPal
	farcall DrawEnemyHUD
	ld hl, wEnemyHPPal
	call SetHPPal
	farcall FinishBattleAnim
	ret
