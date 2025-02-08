; loads tile patterns for battle animations
LoadMoveAnimationTiles:
	ld a, [wWhichBattleAnimTileset]
	add a
	add a
	ld hl, MoveAnimationTilesPointers
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld [wTempTilesetNumTiles], a ; number of tiles
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a ; de = address of tileset
	ld hl, vSprites tile $31
	ld b, BANK(MoveAnimationTiles0) ; ROM bank
	ld a, [wTempTilesetNumTiles]
	ld c, a ; number of tiles
	jp CopyVideoData ; load tileset

MACRO anim_tileset
	db \1
	dw \2
	db -1 ; padding
ENDM

MoveAnimationTilesPointers:
	; number of tiles, gfx pointer
	anim_tileset 79, MoveAnimationTiles0
	anim_tileset 79, MoveAnimationTiles1
	anim_tileset 64, MoveAnimationTiles2

MoveAnimationTiles0:
MoveAnimationTiles2:
	INCBIN "gfx/battle/move_anim_0.2bpp"

MoveAnimationTiles1:
	INCBIN "gfx/battle/move_anim_1.2bpp"

SlotMachineTiles2:
	INCBIN "gfx/slots/blue_slots_2.2bpp"
SlotMachineTiles2End:
