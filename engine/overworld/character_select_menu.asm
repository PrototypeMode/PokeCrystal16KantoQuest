CharacterSwitch::

    ld a, [wPlayerCostume]
	inc a
	ld [wPlayerCostume], a
    ld a, [wPlayerCostume]
	cp 0
	jr z, AshCostumeChange
	cp 1
	jr z, MistyCostumeChange
	cp 2
	jr z, BrockCostumeChange
	cp 3
	jr z, GaryCostumeChange
	cp 4
	jp z, PikachuCostumeChange
    
	
AshCostumeChange::
ld a, 0
ld [wPlayerCostume], a
ld [wPlayerGender], a

    farcall SpawnPlayer
;	special SetPlayerPalette	
	farcall UpdatePlayerSprite
	ld hl, wAshsName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

	
MistyCostumeChange::
ld a, 1
ld [wPlayerCostume], a
ld [wPlayerGender], a

     farcall SpawnPlayer
;	special SetPlayerPalette	
  ;  farcall ReloadTilesetAndPalettes

	farcall UpdatePlayerSprite
	ld hl, wMistysName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret	
	
BrockCostumeChange::
ld a, 2
ld [wPlayerCostume], a
xor a
ld [wPlayerGender], a


    farcall SpawnPlayer
;	special SetPlayerPalette	
	farcall UpdatePlayerSprite
	ld hl, wBrocksName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
	
GaryCostumeChange::
ld a, 3
ld [wPlayerCostume], a
xor a
ld [wPlayerGender], a
    farcall SpawnPlayer
;	special SetPlayerPalette	
	farcall UpdatePlayerSprite
	ld hl, wGarysName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret		
	
PikachuCostumeChange::
	ld a, 4
ld [wPlayerCostume], a
xor a
ld [wPlayerGender], a

    farcall SpawnPlayer
;	special SetPlayerPalette	
	farcall UpdatePlayerSprite
	
	ld hl, .PikachuName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	 ret
	 
 .PikachuName:
	 db "PIKACHU@"	
	ret		

	


