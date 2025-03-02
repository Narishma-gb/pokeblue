TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH - 2
	; give mon, get mon, dialog id, nickname
	; Nicknames are only 4 characters long, omitting the final string terminator
	db RHYDON,     KANGASKHAN, TRADE_DIALOGSET_CASUAL,    "ロダン@"
	db JIGGLYPUFF, MR_MIME,    TRADE_DIALOGSET_CASUAL,    "まさる@"
	db BUTTERFREE, BEEDRILL,   TRADE_DIALOGSET_HAPPY,     "チクチク" ; unused
	db GROWLITHE,  KRABBY,     TRADE_DIALOGSET_CASUAL,    "どうらく"
	db PIDGEY,     FARFETCHD,  TRADE_DIALOGSET_HAPPY,     "アッカ@"
	db PERSIAN,    TAUROS,     TRADE_DIALOGSET_CASUAL,    "ぎゅうた"
	db MACHOKE,    HAUNTER,    TRADE_DIALOGSET_EVOLUTION, "ゴーすけ"
	db KADABRA,    GRAVELER,   TRADE_DIALOGSET_EVOLUTION, "さぶろう"
	db SEEL,       SLOWPOKE,   TRADE_DIALOGSET_HAPPY,     "オスカル"
	db RATTATA,    POLIWAG,    TRADE_DIALOGSET_HAPPY,     "ロモたん"
	assert_table_length NUM_NPC_TRADES
