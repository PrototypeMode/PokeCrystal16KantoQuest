LoadFishingGFX:
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	

   ld a, [wPlayerCostume]
   cp 0
   jr z, .AshFishingGFX
   cp 1
   jr z, .MistyFishingGFX
   cp 2
   jr z, .BrockFishingGFX
   cp 3
   jr z, .GaryFishingGFX
   cp 4
   jr z, .PikachuFishingGFX
   
  
.AshFishingGFX
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr nz, .AshFishingLand
	jr z, .AshFishingSurf  
	
.MistyFishingGFX
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr nz, .MistyFishingLand
	jr z, .MistyFishingSurf

.BrockFishingGFX
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr nz, .BrockFishingLand
	jr z, .BrockFishingSurf
	
.GaryFishingGFX
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr nz, .GaryFishingLand
	jr z, .GaryFishingSurf

.PikachuFishingGFX
    ld a, [wPlayerState]
	cp PLAYER_SURF_PIKA
    jr nz, .LandPikachuFishing
    jr z, .SurfPikachuFishing
	
.AshFishingLand
	ld de, AshFishingLandGFX
    jp .got_character_land
	
.AshFishingSurf
	ld de, AshFishingSurfGFX	
	jr .got_character_surf

	
.MistyFishingLand
	ld de, MistyFishingLandGFX
    jp .got_character_land
	
.MistyFishingSurf
	ld de, MistyFishingSurfGFX	
	jr .got_character_surf		
	
	
.BrockFishingLand
	ld de, BrockFishingLandGFX
    jp .got_character_land
	
.BrockFishingSurf
	ld de, BrockFishingSurfGFX	
	jr .got_character_surf		
	
		
.GaryFishingLand
	ld de, GaryFishingLandGFX
    jp .got_character_land
	
.GaryFishingSurf
	ld de, GaryFishingSurfGFX	
	jr .got_character_surf	
	
	
.LandPikachuFishing
	ld de, PikachuFishingLandGFX
    jp .got_character_land
	
.SurfPikachuFishing
	ld de, PikachuFishingSurfGFX	
	jr .got_character_surf	
    ret	
	
; ;	ld a, [wPlayerGender]
; ;	bit PLAYERGENDER_FEMALE_F, a

; .AshFishingGFX
	; ld de, AshFishingLandGFX
	; jr .got_gender
; ;	ld de, AshFishingSurfGFX
; .MistyFishingGFX
	; ld de, MistyFishingLandGFX
		; jr .got_gender
; .BrockFishingGFX
	; ld de, BrockFishingLandGFX
	; jr .got_gender
	
; .GaryFishingGFX
	; ld de, GaryFishingLandGFX
	; jr .got_gender
; .PikachuFishingGFX
	; ld de, PikachuFishingLandGFX
	
; .got_gender

	; ld hl, vTiles0 tile $02
	; call .LoadGFX
	; ld hl, vTiles0 tile $06
	; call .LoadGFX
	; ld hl, vTiles0 tile $0a
	; call .LoadGFX
	; ld hl, vTiles0 tile $fc
	; call .LoadGFX

	; pop af
	; ldh [rVBK], a
	; ret
.got_character_normal	
	ld hl, vTiles0 tile $02
	call .LoadNormalGFX
	ld hl, vTiles0 tile $06
	call .LoadNormalGFX
	ld hl, vTiles0 tile $0a
	call .LoadNormalGFX
	ld hl, vTiles0 tile $fc
	call .LoadNormalGFX
	jp .continue	
	
.got_character_land

	ld hl, vTiles0 tile $00
	call .LoadLandGFX

	ld hl, vTiles0 tile $02
	call .LoadLandGFX	
	
	ld hl, vTiles0 tile $04
	call .LoadLandGFX
	
	ld hl, vTiles0 tile $06
	 call .LoadLandGFX
	 
	ld hl, vTiles0 tile $08
	 call .LoadLandGFX
	 
     jp .continue
	 
.got_character_surf

	ld hl, vTiles0 tile $00
	call .LoadSurfGFX

	ld hl, vTiles0 tile $02
	call .LoadSurfGFX	
	
	ld hl, vTiles0 tile $04
	call .LoadSurfGFX
	
	ld hl, vTiles0 tile $06
	 call .LoadSurfGFX
	 
	ld hl, vTiles0 tile $08
	 call .LoadSurfGFX

.SurfDirCheck
	ld a, [wPlayerDirection]
	cp OW_UP
    jr z, .one
	cp OW_RIGHT
    jr z, .two
	cp OW_DOWN
    jr z, .three
	cp OW_LEFT
    jr z, .four
.one
	  ld hl, vTiles0 tile $fa
	  call .LoadSurfGFX   	 
 	 jp .continue
.two
	  ld hl, vTiles0 tile $fa
	  call .LoadSurfGFX   	 
	  jp .continue
.three
	  ld hl, vTiles0 tile $fa
	  call .LoadSurfGFX
	  ld hl, vTiles0 tile $fa
	  call .LoadSurfGFX   		  
      jp .continue
.four	  
	   ld hl, vTiles0 tile $fa
	  call .LoadSurfGFX
	  	   ld hl, vTiles0 tile $fa
	  call .LoadSurfGFX
	  jp .continue

.continue
	pop af
	ldh [rVBK], a
	ret 	 
	

 .LoadSurfGFX:
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr nz, .MistySurf
	; jr z, .AshSurf

.AshSurf
	lb bc, BANK(AshFishingSurfGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret

.MistySurf
	lb bc, BANK(MistyFishingSurfGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret

.BrockSurf
	lb bc, BANK(BrockFishingSurfGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret	

.GarySurf
	lb bc, BANK(GaryFishingSurfGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret	

.PikachuSurf
	lb bc, BANK(PikachuFishingSurfGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret		
	
.LoadLandGFX:
	; ld a, [wPlayerGender]
	; bit PLAYERGENDER_FEMALE_F, a
	; jr nz, .MistyLand
	; jr z, .AshLand

.AshLand
	lb bc, BANK(AshFishingLandGFX), 6
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret

.MistyLand
	lb bc, BANK(MistyFishingLandGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret	

.BrockLand
	lb bc, BANK(BrockFishingLandGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret		

.GaryLand
	lb bc, BANK(GaryFishingLandGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret		

.PikachuLand
	lb bc, BANK(PikachuFishingLandGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret	

.LoadNormalGFX:
ret	

AshFishingLandGFX:
INCBIN "gfx/overworld/fishing/ash_fish_land.2bpp"

MistyFishingLandGFX:
INCBIN "gfx/overworld/fishing/misty_fish_land.2bpp"

BrockFishingLandGFX:
INCBIN "gfx/overworld/fishing/brock_fish_land.2bpp"

GaryFishingLandGFX:
INCBIN "gfx/overworld/fishing/gary_fish_land.2bpp"

PikachuFishingLandGFX:
INCBIN "gfx/overworld/fishing/pikachu_fish_land.2bpp"


AshFishingSurfGFX:
INCBIN "gfx/overworld/fishing/ash_fish_surf.2bpp"

MistyFishingSurfGFX:
INCBIN "gfx/overworld/fishing/misty_fish_surf.2bpp"

BrockFishingSurfGFX:
INCBIN "gfx/overworld/fishing/brock_fish_surf.2bpp"

GaryFishingSurfGFX:
INCBIN "gfx/overworld/fishing/gary_fish_surf.2bpp"

PikachuFishingSurfGFX:
INCBIN "gfx/overworld/fishing/pikachu_fish_surf.2bpp"