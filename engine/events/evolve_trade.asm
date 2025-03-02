InGameTrade_CheckForTradeEvo:
; Verify the TradeMon's species name before
; attempting to initiate a trade evolution.
; TradeMons that can evolve are
; ゴローン (Graveler) and ゴースト (Haunter).

	ld a, [wInGameTradeReceiveMonName]
	cp "ゴ"
	ret nz
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	jp PlayDefaultMusic
