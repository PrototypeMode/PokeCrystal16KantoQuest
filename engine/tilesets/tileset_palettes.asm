LoadSpecialMapPalette:
	ld a, [wMapTileset]
		cp TILESET_GATE
	jr z, .gate
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile

	cp TILESET_CEMETERY
	jr z, .cemetery
	jr .do_nothing
	
.gate

	call LoadGatePalette
	scf
    ret 
	
.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower_inside
	call LoadBattleTowerInsidePalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret
	
.museum
	call LoadMuseumPalette
	scf
	ret

.cemetery
	call LoadCemeteryPalette
	scf
	ret	

.do_nothing
	and a
	ret

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadBattleTowerInsidePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerInsidePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerInsidePalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadMuseumPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MuseumPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

MuseumPalette:
INCLUDE "gfx/tilesets/museum.pal"

LoadCemeteryPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, CemeteryPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

CemeteryPalette:
INCLUDE "gfx/tilesets/cemetery.pal"

LoadGatePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GatePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	; ld a, BANK(wBGPals1)
	; ld de, wBGPals1 palette PAL_BG_YELLOW
	; ld hl, MansionPalette2
	; ld bc, 1 palettes
	; call FarCopyWRAM
	; ld a, BANK(wBGPals1)
	; ld de, wBGPals1 palette PAL_BG_WATER
	; ld hl, MansionPalette1 palette 6
	; ld bc, 1 palettes
	; call FarCopyWRAM
	ld a, [wMapGroup]
	ld b, a	
	ld a, [wMapNumber]
	ld c, a
    call GetWorldMapLocation
    cp LANDMARK_ROUTE_2
    jr z, .ViridianGate
	cp LANDMARK_ROUTE_29
    jr z, .Route29Gate
	ret

.ViridianGate
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF	
	ld hl, GateRoofPalette palette 2
	ld bc, 1 palettes
	call FarCopyWRAM
    ret
	
.Route29Gate
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF	
	ld hl, GateRoofPalette palette 3
	ld bc, 1 palettes
	call FarCopyWRAM	
	ret

GatePalette:
INCLUDE "gfx/tilesets/gate.pal"
GateRoofPalette:
INCLUDE "gfx/tilesets/gateroof.pal"