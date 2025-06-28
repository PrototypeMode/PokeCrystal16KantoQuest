; npctrade struct members (see data/events/npc_trades.asm)
rsreset
DEF NPCTRADE_DIALOG   rb
DEF NPCTRADE_GIVEMON  rw
DEF NPCTRADE_GETMON   rw
DEF NPCTRADE_NICKNAME rb MON_NAME_LENGTH
DEF NPCTRADE_DVS      rw
DEF NPCTRADE_ITEM     rb
DEF NPCTRADE_OT_ID    rw
DEF NPCTRADE_OT_NAME  rb PLAYER_NAME_LENGTH
DEF NPCTRADE_GENDER   rb
                      rb_skip 2
DEF NPCTRADE_STRUCT_LENGTH EQU _RS

; NPCTrades indexes (see data/events/npc_trades.asm)
	const_def
	const NPC_TRADE_MIKE   ; 0
	const NPC_TRADE_KYLE   ; 1
	const NPC_TRADE_TIM    ; 2
	const NPC_TRADE_EMY    ; 3
	const NPC_TRADE_CHRIS  ; 4
	const NPC_TRADE_KIM    ; 5
	const NPC_TRADE_FOREST ; 6	
	const NPC_TRADE_JULIO ; 7 Pewter Museum 2F Pikachu/Meowth
	const NPC_TRADE_MARCEL ; 8 Route 2 Nugget House Abra/Mr Mime
	const NPC_TRADE_SAIGE ;  9 Route 5 Underground Path Entrance NidoranM/NidoranF
	const NPC_TRADE_PAUL ;  10 Route 5 Underground Path Entrance Rattata/Poliwag
	const NPC_TRADE_TURNER ; 11 Route 11 Nidorino/Nidorina
	const NPC_TRADE_CHARLIE ; 12 Route 11 Rhydon/Kangaskhan
	const NPC_TRADE_HADEN ; 13 Route 18 Slowbro/Lickitung
	const NPC_TRADE_STEVE ; 14 Route 18 Persian/Tauros
	const NPC_TRADE_DANTE ; 15 Cerulean City Poliwhirl/Jynx
	const NPC_TRADE_HANK ; 16 Cerulean City Machoke/Haunter
	const NPC_TRADE_ELYSSA ; 17 Vermilion City Spearow/Farfetch'd
	const NPC_TRADE_CLIFTON ; 18 Cinnabar Lab Raichu/Electrode
	const NPC_TRADE_NORMA ; 19 Cinnabar Lab Venonat/Tangela
	const NPC_TRADE_GARRET ; 20 Cinnabar Lab Ponyta/Seel
	const NPC_TRADE_GERALD ; 21 Cinnabar Lab Kadabra/Graveler
	const NPC_TRADE_RONALD ; 22 Cinnabar Lab Growlithe/Krabby
	const NPC_TRADE_BARRY ; 23 Cinnabar Lab Kangaskhan/Muk
	
DEF NUM_NPC_TRADES EQU const_value

; trade gender limits
	const_def
	const TRADE_GENDER_EITHER
	const TRADE_GENDER_MALE
	const TRADE_GENDER_FEMALE

; TradeTexts indexes (see engine/events/npc_trade.asm)

; trade dialogs
	const_def
	const TRADE_DIALOG_INTRO
	const TRADE_DIALOG_CANCEL
	const TRADE_DIALOG_WRONG
	const TRADE_DIALOG_COMPLETE
	const TRADE_DIALOG_AFTER

; trade dialog sets
	const_def
	const TRADE_DIALOGSET_COLLECTOR
	const TRADE_DIALOGSET_HAPPY
	const TRADE_DIALOGSET_NEWBIE
	const TRADE_DIALOGSET_GIRL
    const TRADE_DIALOGSET_ALREADYGREETED