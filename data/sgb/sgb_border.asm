BorderPalettes:
	INCBIN "gfx/sgb/blue_border.tilemap"

	ds $100

	RGB 00,00,00, 10,17,26, 05,09,20, 16,20,27 ; PAL_SGB1 
	; the first color is not defined, but if used, turns up as 30,29,29
	ds $18

	RGB 30,29,29, 27,11,06, 05,09,20, 28,25,15 ; PAL_SGB2

	ds $18

	RGB 30,29,29, 12,15,11, 05,09,20, 14,22,17 ; PAL_SGB3

	ds $18

SGBBorderGraphics:
	INCBIN "gfx/sgb/blue_border.2bpp"
