
AshNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .AshNames
	db 1 ; default option
	db 0 ; ????

.AshNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
AshPlayerNameArray:

	db "ASH@"
	db "SATOSHI@"
	db "RED@"
	db "RICHIE@"
	db 2 ; title indent
	db " NAME @" ; title
    end

MistyNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MistyNames
	db 1 ; default option
	db 0 ; ????

.MistyNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
MistyPlayerNameArray:
	db "MISTY@"
	db "KASUMI@"
	db "YELLOW@"
	db "LILY@"
	db 2 ; title indent
	db " NAME @" ; title
    end


BrockNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .BrockNames
	db 1 ; default option
	db 0 ; ????

.BrockNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
BrockPlayerNameArray:
	db "BROCK@"
	db "TAKESHI@"
	db "GREEN@"
	db "PIERRE@"
	db 2 ; title indent
	db " NAME @" ; title
	end
	
GaryNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .GaryNames
	db 1 ; default option
	db 0 ; ????

.GaryNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
GaryPlayerNameArray:

	db "GARY@"
	db "SHIGERU@"
	db "BLUE@"
	db "REGIS@"
	db 2 ; title indent
	db " NAME @" ; title
    end	
	
PikachuNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .PikachuNames
	db 1 ; default option
	db 0 ; ????

.PikachuNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
PikachuPlayerNameArray:

	db "PIKA@"
	db "PIKAPI@"
	db "PIPI@"
	db "PIKACHU@"
	db 2 ; title indent
	db " NAME @" ; title
    end