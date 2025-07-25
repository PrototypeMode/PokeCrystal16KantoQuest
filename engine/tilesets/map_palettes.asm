_LoadOverworldAttrmapPals::
; Load wAttrmap palette numbers based on the tileset palettes of current map.
; This function is only used for the initial loading of the map; incremental
; loads while moving happen through ScrollBGMapPalettes.
	hlcoord 0, 0
	decoord 0, 0, wAttrmap
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld c, SCREEN_WIDTH
	call GetBGMapTilePalettes
; .innerloop
	; ld a, [hl]
	; push hl
	; srl a
	; jr c, .UpperNybble
	; ld hl, wTilesetPalettes
	; add [hl]
	; ld l, a
	; ld a, [wTilesetPalettes + 1]
	; adc 0
	; ld h, a
	; ld a, [hl]
	; and $f
	; jr .next

; .UpperNybble:
	; ld hl, wTilesetPalettes
	; add [hl]
	; ld l, a
	; ld a, [wTilesetPalettes + 1]
	; adc 0
	; ld h, a
	; ld a, [hl]
	; swap a
	; and $f

; .next
	; pop hl
	; ld [de], a
	; res OAM_TILE_BANK + 4, [hl]
	; inc hl
	; inc de
	; dec c
	; jr nz, .innerloop
	pop bc
	dec b
	jr nz, .loop
	ret

_ScrollBGMapPalettes::
	ld hl, wBGMapBuffer
	ld de, wBGMapPalBuffer
		; fallthrough
GetBGMapTilePalettes:
.loop
	ld a, [wFloorTile]
	cp [hl] ; if this tile is [wFloorTile]...
	ld a, [hl]
	jr nz, .not_floor
	ld a, [wCarpetTile] ; ...use the palette of [wCarpetTile] instead
    jr .not_wall ; We have found a carpet tile, so we skip the wall check.
	
.not_floor
   ld a, [wWallTile] ; $02.
   cp [hl] ; if this tile is [wWallTile]...
   ld a, [hl] ; Loading the original tile in A, in case it is not a Wall tile.
   jr nz, .not_wall
   ld a, [wWallpaperTile] ; ...use the palette of [wWallpaperTile] instead. NOTE: you may want to change this, to use whatever palette you want instead. 
.not_wall
	push hl
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc 0
	ld h, a
	ld a, [hl]
	; and $f
	; jr .next

; .UpperNybble:
	; ld hl, wTilesetPalettes
	; add [hl]
	; ld l, a
	; ld a, [wTilesetPalettes + 1]
	; adc 0
	; ld h, a
	; ld a, [hl]
	; swap a
	; and $f

; .next
	pop hl
	ld [de], a
	res OAM_TILE_BANK + 4, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret
