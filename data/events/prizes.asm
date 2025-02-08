PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "いらない@"

PrizeMenuMon1Entries:
	db ABRA
	db PIKACHU
	db HORSEA
	db "@"

PrizeMenuMon1Cost:
	bcd2 150
	bcd2 620
	bcd2 1000
	db "@"

PrizeMenuMon2Entries:
	db CLEFABLE
	db DRAGONAIR
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 2880
	bcd2 5400
	bcd2 8300
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 3300
	bcd2 5500
	bcd2 7700
	db "@"
