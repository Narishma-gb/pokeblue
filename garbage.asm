SECTION "Garbage Header", ROM0
INCBIN "garbage/garbage_header.bin"

SECTION "Garbage 0", ROM0
INCBIN "garbage/garbage_0.bin"


SECTION "Garbage 1", ROMX
	db $6F, $10, $FF, $03, $FF


SECTION "Garbage 2", ROMX
INCBIN "garbage/garbage_2.bin"


SECTION "Garbage 3", ROMX
INCBIN "garbage/garbage_3.bin"


SECTION "Garbage 4", ROMX
	db $7F


SECTION "Garbage 5", ROMX
	db $2E, $FF, $AA, $FF


SECTION "Garbage 6", ROMX
INCBIN "garbage/garbage_6.bin"


SECTION "Garbage 7", ROMX
INCBIN "garbage/garbage_7.bin"


SECTION "Garbage 9", ROMX
INCBIN "garbage/garbage_9.bin"


SECTION "Garbage 10", ROMX
INCBIN "garbage/garbage_10.bin"


SECTION "Garbage 11", ROMX
INCBIN "garbage/garbage_11.bin"


SECTION "Garbage 12", ROMX
INCBIN "garbage/garbage_12.bin"


SECTION "Garbage 13", ROMX
INCBIN "garbage/garbage_13.bin"


SECTION "Garbage 14", ROMX
	db $FF


SECTION "Garbage 15", ROMX
INCBIN "garbage/garbage_15.bin"


SECTION "Garbage 16", ROMX
INCBIN "garbage/garbage_16.bin"


SECTION "Garbage 17", ROMX
INCBIN "garbage/garbage_17.bin"


SECTION "Garbage 18", ROMX
INCBIN "garbage/garbage_18.bin"


SECTION "Garbage 19", ROMX
	db $38, $FF


SECTION "Garbage 20", ROMX
INCBIN "garbage/garbage_20.bin"


SECTION "Garbage 21", ROMX
INCBIN "garbage/garbage_21.bin"


SECTION "Garbage 22", ROMX
INCBIN "garbage/garbage_22.bin"


SECTION "Garbage 23", ROMX
INCBIN "garbage/garbage_23.bin"


SECTION "Garbage 24", ROMX
INCBIN "garbage/garbage_24.bin"


SECTION "Garbage 25", ROMX
INCBIN "garbage/garbage_25.bin"


SECTION "Garbage 26", ROMX
INCBIN "garbage/garbage_26.bin"


SECTION "Garbage 28", ROMX
INCBIN "garbage/garbage_28.bin"


SECTION "Garbage 29", ROMX
INCBIN "garbage/garbage_29.bin"


SECTION "Garbage 30", ROMX
INCBIN "garbage/garbage_30.bin"


SECTION "Garbage 31", ROMX
	db $0D, $0A, $4A, $40, $98 ; final byte is $00, same as padding byte
