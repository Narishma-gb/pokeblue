MACRO npctrade
; give mon, get mon, dialog id, nickname
	db \1, \2, \3
	dname \4, NAME_LENGTH - 2
ENDM

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH - 2
	; In Japanese Blue, this table size has been shortened,
	; nicknames can not exceed 4 characters (discounting the final '@')
	npctrade RHYDON,     KANGASKHAN, TRADE_DIALOGSET_CASUAL,    "ロダン"  ; used in ROUTE_11_GATE_2F
	npctrade JIGGLYPUFF, MR_MIME,    TRADE_DIALOGSET_CASUAL,    "まさる"  ; used in ROUTE_2_TRADE_HOUSE
	npctrade BUTTERFREE, BEEDRILL,   TRADE_DIALOGSET_HAPPY,     "チクチク" ; unused
	npctrade GROWLITHE,  KRABBY,     TRADE_DIALOGSET_CASUAL,    "どうらく" ; used in CINNABAR_LAB_FOSSIL_ROOM
	npctrade PIDGEY,     FARFETCHD,  TRADE_DIALOGSET_HAPPY,     "アッカ"  ; used in VERMILION_TRADE_HOUSE
	npctrade PERSIAN,    TAUROS,     TRADE_DIALOGSET_CASUAL,    "ぎゅうた" ; used in ROUTE_18_GATE_2F
	npctrade MACHOKE,    HAUNTER,    TRADE_DIALOGSET_EVOLUTION, "ゴーすけ" ; used in CERULEAN_TRADE_HOUSE
	npctrade KADABRA,    GRAVELER,   TRADE_DIALOGSET_EVOLUTION, "さぶろう" ; used in CINNABAR_LAB_TRADE_ROOM
	npctrade SEEL,       SLOWPOKE,   TRADE_DIALOGSET_HAPPY,     "オスカル" ; used in CINNABAR_LAB_TRADE_ROOM
	npctrade RATTATA,    POLIWAG,    TRADE_DIALOGSET_HAPPY,     "ロモたん" ; used in UNDERGROUND_PATH_ROUTE_5
	assert_table_length NUM_NPC_TRADES
