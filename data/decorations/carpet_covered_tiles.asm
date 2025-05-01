 CarpetCoveredTiles:
 	; tile id, pixel mask
 	dbw $01, .Floor
 	dbw $30, .TableLeft
 	dbw $31, .TableMiddle
 	dbw $32, .TableRight
 	dbw $46, .PotLeft
 	dbw $56, .PotRight
 	dbw $07, .JumboPlantTopLeft
 	dbw $08, .JumboPlantTopRight
 	dbw $17, .JumboPlantBottomLeft
 	dbw $18, .JumboPlantBottomRight
 	dbw $27, .MagnaPlantTopLeft
 	dbw $28, .MagnaPlantTopRight
 	dbw $37, .MagnaPlantBottomLeft
 	dbw $38, .MagnaPlantBottomRight
 	dbw $47, .TropicPlantTopLeft
 	dbw $48, .TropicPlantTopRight
 	dbw $57, .TropicPlantBottomLeft
 	dbw $58, .TropicPlantBottomRight
	dbw $67, .SeatTopLeft
 	dbw $68, .SeatTopRight
	dbw $77, .SeatBottomLeft
 	dbw $78, .SeatBottomRight
 	dbw $23, .ControllerCord
 	dbw $24, .NESController
	dbw $33, .SNESController
	dbw $34, .N64Controller
	dbw $43, .FloorPlug
 	db -1 ; end
 
 .Floor:
 	db %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
 
 
 .TableLeft:
 	db %00000000, %00000000, %00000000, %00000001, %00000001, %10000001, %10000011, %11111111
 
 .TableMiddle
 	db %00000000, %00000000, %00000000, %11111111, %11111111, %11111111, %11111111, %11111111
 
 .TableRight
 	db %00000000, %00000000, %00000000, %10000000, %10000000, %10000001, %11000001, %11111111
 
 
 .PotLeft
 	db %11000000, %11000000, %11100000, %11100000, %11100000, %11110000, %11111000, %11111111
 
 .PotRight
 	db %00000011, %00000011, %00000111, %00000001, %00000000, %00000000, %00000001, %11111111
 
 
 .JumboPlantTopLeft
 	db %11111110, %11111100, %11111100, %11111000, %11100000, %11000000, %11000000, %11000000
 
 .JumboPlantTopRight
 	db %01111111, %00111111, %00111111, %00011111, %00000111, %00000011, %00000011, %00000011
 
 .JumboPlantBottomLeft
 	db %10000000, %10000000, %11000000, %10000000, %00000000, %00000000, %10000000, %11000000
 
 .JumboPlantBottomRight
 	db %00000001, %00000001, %00000011, %00000001, %00000000, %00000000, %00000001, %00000011
 
 
 
 .MagnaPlantTopLeft
 	db %10001100, %10000000, %10000000, %11000000, %10000000, %11000000, %10000000, %10000000
 
 .MagnaPlantTopRight
 	db %10100011, %00000001, %00000000, %00000000, %00000001, %00000001, %00000000, %00000001
 
 .MagnaPlantBottomLeft
 	db %00000000, %10000000, %10000000, %00000000, %10000000, %10000000, %10000000, %11100000
 
 .MagnaPlantBottomRight
 	db %00000000, %00000000, %00000000, %00000001, %00000001, %00000000, %00000000, %00000000
 
 
 
 .TropicPlantTopLeft
 	db %10011111, %10000111, %10000001, %00000000, %10000000, %10000000, %00000000, %00000000
 
 .TropicPlantTopRight
 	db %11111000, %11100000, %10000000, %00000001, %00000001, %00000000, %00000000, %00000011
 
 .TropicPlantBottomLeft
 	db %10000000, %10000000, %00000000, %10000000, %10000000, %00000000, %00000000, %11100000
 
 .TropicPlantBottomRight:
 	db %00000000, %00000000, %00000001, %00000001, %00000000, %00000000, %00000000, %00000011
	
.SeatTopLeft
INCBIN "gfx/tilesets/carpet-masks/seat-top-left.1bpp"

.SeatTopRight
INCBIN "gfx/tilesets/carpet-masks/seat-top-right.1bpp"

.SeatBottomLeft
INCBIN "gfx/tilesets/carpet-masks/seat-bottom-left.1bpp"

.SeatBottomRight:
INCBIN "gfx/tilesets/carpet-masks/seat-bottom-right.1bpp"

.ControllerCord
INCBIN "gfx/tilesets/carpet-masks/controller-cord.1bpp"

.NESController:
INCBIN "gfx/tilesets/carpet-masks/nes-controller.1bpp"

.SNESController:
INCBIN "gfx/tilesets/carpet-masks/snes-controller.1bpp"

.N64Controller:
INCBIN "gfx/tilesets/carpet-masks/n64-controller.1bpp"

.FloorPlug:
INCBIN "gfx/tilesets/carpet-masks/floor-plug.1bpp"