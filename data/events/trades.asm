MACRO npctrade
; give mon, get mon, dialog id, nickname
	db \1, \2, \3
	dname \4, NAME_LENGTH - 2
ENDM

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH - 2
	; In Japanese Blue, this table size has been shortened,
	; nicknames can not exceed 4 characters (discounting the final "@")
	npctrade RHYDON,     KANGASKHAN, TRADE_DIALOGSET_CASUAL,    "ロダン"
	npctrade JIGGLYPUFF, MR_MIME,    TRADE_DIALOGSET_CASUAL,    "まさる"
	npctrade BUTTERFREE, BEEDRILL,   TRADE_DIALOGSET_HAPPY,     "チクチク" ; unused
	npctrade GROWLITHE,  KRABBY,     TRADE_DIALOGSET_CASUAL,    "どうらく"
	npctrade PIDGEY,     FARFETCHD,  TRADE_DIALOGSET_HAPPY,     "アッカ"
	npctrade PERSIAN,    TAUROS,     TRADE_DIALOGSET_CASUAL,    "ぎゅうた"
	npctrade MACHOKE,    HAUNTER,    TRADE_DIALOGSET_EVOLUTION, "ゴーすけ"
	npctrade KADABRA,    GRAVELER,   TRADE_DIALOGSET_EVOLUTION, "さぶろう"
	npctrade SEEL,       SLOWPOKE,   TRADE_DIALOGSET_HAPPY,     "オスカル"
	npctrade RATTATA,    POLIWAG,    TRADE_DIALOGSET_HAPPY,     "ロモたん"
	assert_table_length NUM_NPC_TRADES
