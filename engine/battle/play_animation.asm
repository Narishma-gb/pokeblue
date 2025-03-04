; Draws a "frame block". Frame blocks are blocks of tiles that are put
; together to form frames in battle animations.
DrawFrameBlock:
	ld l, c
	ld h, b
	ld a, [hli]
	ld [wNumFBTiles], a
	ld a, [wFBDestAddr + 1]
	ld e, a
	ld a, [wFBDestAddr]
	ld d, a
	xor a
	ld [wFBTileCounter], a ; loop counter
.loop
	ld a, [wFBTileCounter]
	inc a
	ld [wFBTileCounter], a
	ld a, [wSubAnimTransform]
	dec a
	jr z, .flipHorizontalAndVertical   ; SUBANIMTYPE_HVFLIP
	dec a
	jp z, .flipHorizontalTranslateDown ; SUBANIMTYPE_HFLIP
	dec a
	jr z, .flipBaseCoords              ; SUBANIMTYPE_COORDFLIP
; noTransformation
	ld a, [wBaseCoordY]
	add [hl]
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	jr .finishCopying
.flipBaseCoords
	ld a, [wBaseCoordY]
	ld b, a
	ld a, 136
	sub b ; flip Y base coordinate
	add [hl] ; Y offset
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	ld b, a
	ld a, 168
	sub b ; flip X base coordinate
.finishCopying ; finish copying values to OAM (when subanimation not transformed)
	add [hl] ; X offset
	ld [de], a ; store X
	inc hl
	inc de
	ld a, [hli]
	add $31 ; base tile ID for battle animations
	ld [de], a ; store tile ID
	inc de
	ld a, [hli]
	ld [de], a ; store flags
	inc de
	jp .nextTile
.flipHorizontalAndVertical
	ld a, [wBaseCoordY]
	add [hl] ; Y offset
	ld b, a
	ld a, 136
	sub b ; flip Y coordinate
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	add [hl] ; X offset
	ld b, a
	ld a, 168
	sub b ; flip X coordinate
	ld [de], a ; store X
	inc hl
	inc de
	ld a, [hli]
	add $31 ; base tile ID for battle animations
	ld [de], a ; store tile ID
	inc de
; toggle horizontal and vertical flip
	ld a, [hli] ; flags
	and a
	ld b, OAM_VFLIP | OAM_HFLIP
	jr z, .storeFlags1
	cp OAM_HFLIP
	ld b, OAM_VFLIP
	jr z, .storeFlags1
	cp OAM_VFLIP
	ld b, OAM_HFLIP
	jr z, .storeFlags1
	ld b, 0
.storeFlags1
	ld a, b
	ld [de], a
	inc de
	jp .nextTile
.flipHorizontalTranslateDown
	ld a, [wBaseCoordY]
	add [hl]
	add 40 ; translate Y coordinate downwards
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	add [hl]
	ld b, a
	ld a, 168
	sub b ; flip X coordinate
	ld [de], a ; store X
	inc hl
	inc de
	ld a, [hli]
	add $31 ; base tile ID for battle animations
	ld [de], a ; store tile ID
	inc de
	ld a, [hli]
	bit OAM_X_FLIP, a
	jr nz, .disableHorizontalFlip
.enableHorizontalFlip
	set OAM_X_FLIP, a
	jr .storeFlags2
.disableHorizontalFlip
	res OAM_X_FLIP, a
.storeFlags2
	ld [de], a
	inc de
.nextTile
	ld a, [wFBTileCounter]
	ld c, a
	ld a, [wNumFBTiles]
	cp c
	jp nz, .loop ; go back up if there are more tiles to draw
; afterDrawingTiles
	ld a, [wFBMode]
	cp FRAMEBLOCKMODE_02
	jr z, .advanceFrameBlockDestAddr ; skip delay and don't clean OAM buffer
	ld a, [wSubAnimFrameDelay]
	ld c, a
	call DelayFrames
	ld a, [wFBMode]
	cp FRAMEBLOCKMODE_03
	jr z, .advanceFrameBlockDestAddr ; skip cleaning OAM buffer
	cp FRAMEBLOCKMODE_04
	jr z, .done ; skip cleaning OAM buffer and don't advance the frame block destination address
	ld a, [wAnimationID]
	cp GROWL
	jr z, .resetFrameBlockDestAddr
	call AnimationCleanOAM
.resetFrameBlockDestAddr
	ld hl, wShadowOAM
	ld a, l
	ld [wFBDestAddr + 1], a
	ld a, h
	ld [wFBDestAddr], a ; set destination address to beginning of OAM buffer
	ret
.advanceFrameBlockDestAddr
	ld a, e
	ld [wFBDestAddr + 1], a
	ld a, d
	ld [wFBDestAddr], a
.done
	ret

PlayAnimation:
	xor a
	ldh [hROMBankTemp], a ; it looks like nothing reads this
	ld [wSubAnimTransform], a
	ld a, [wAnimationID] ; get animation number
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	ld de, AttackAnimationPointers  ; animation command stream pointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.animationLoop
	vc_hook Stop_reducing_move_anim_flashing_Thunderbolt
	ld a, [hli]
	cp -1
	vc_hook Stop_reducing_move_anim_flashing_Explosion
	jr z, .AnimationOver
	cp FIRST_SE_ID ; is this subanimation or a special effect?
	jr c, .playSubanimation
; doSpecialEffect
	ld c, a
	ld de, SpecialEffectPointers
.searchSpecialEffectTableLoop
	ld a, [de]
	cp c
	jr z, .foundMatch
	inc de
	inc de
	inc de
	jr .searchSpecialEffectTableLoop
.foundMatch
	ld a, [hli]
	cp NO_MOVE - 1 ; is there a sound to play?
	jr z, .skipPlayingSound
	ld [wAnimSoundID], a ; store sound
	push hl
	push de
	call GetMoveSound
	call PlaySound
	pop de
	pop hl
.skipPlayingSound
	push hl
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ld de, .nextAnimationCommand
	push de
	jp hl ; jump to special effect function
.playSubanimation
	ld c, a
	and %00111111
	ld [wSubAnimFrameDelay], a
	xor a
	sla c
	rla
	sla c
	rla
	ld [wWhichBattleAnimTileset], a
	ld a, [hli] ; sound
	ld [wAnimSoundID], a ; store sound
	ld a, [hli] ; subanimation ID
	ld c, l
	ld b, h
	ld l, a
	ld h, 0
	add hl, hl
	ld de, SubanimationPointers
	add hl, de
	ld a, l
	ld [wSubAnimAddrPtr], a
	ld a, h
	ld [wSubAnimAddrPtr + 1], a
	ld l, c
	ld h, b
	push hl
	ldh a, [rOBP0]
	push af
	ld a, [wAnimPalette]
	vc_hook Reduce_move_anim_flashing_Self_Destruct
	ldh [rOBP0], a
	call LoadMoveAnimationTiles
	call LoadSubanimation
	call PlaySubanimation
	vc_hook Stop_reducing_move_anim_flashing_Mega_Punch
	pop af
	vc_hook Stop_reducing_move_anim_flashing_Guillotine_Mega_Kick
	ldh [rOBP0], a
.nextAnimationCommand
	vc_hook Stop_reducing_move_anim_flashing_Hyper_Beam
	pop hl
	vc_hook Stop_reducing_move_anim_flashing_Reflect
	jr .animationLoop
.AnimationOver
	vc_hook Stop_reducing_move_anim_flashing_Self_Destruct_Spore
	ret

LoadSubanimation:
	ld a, [wSubAnimAddrPtr + 1]
	ld h, a
	ld a, [wSubAnimAddrPtr]
	ld l, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a ; de = address of subanimation
	ld a, [de]
	ld b, a
	and %00011111
	vc_hook Reduce_move_anim_flashing_Hyper_Beam
	ld [wSubAnimCounter], a ; number of frame blocks
	vc_hook Reduce_move_anim_flashing_Guillotine
	ld a, b
	vc_hook Reduce_move_anim_flashing_Mega_Kick
	and %11100000
	vc_hook Reduce_move_anim_flashing_Mega_Punch_Self_Destruct
	cp SUBANIMTYPE_ENEMY << 5
	vc_hook Reduce_move_anim_flashing_Thunderbolt
	jr nz, .isNotType5
; isType5
	call GetSubanimationTransform2
	jr .saveTransformation
.isNotType5
	vc_hook Reduce_move_anim_flashing_Reflect
	call GetSubanimationTransform1
.saveTransformation
; place the upper 3 bits of a into bits 0-2 of a before storing
	vc_hook Reduce_move_anim_flashing_Explosion
	srl a
	vc_hook Reduce_move_anim_flashing_Rock_Slide
	swap a
	vc_hook Reduce_move_anim_flashing_Blizzard
	ld [wSubAnimTransform], a
	vc_hook Reduce_move_anim_flashing_Bubblebeam
	cp SUBANIMTYPE_REVERSE
	ld hl, 0
	jr nz, .storeSubentryAddr
; if the animation is reversed, then place the initial subentry address at the end of the list of subentries
	ld a, [wSubAnimCounter]
	dec a
	ld bc, 3
.loop
	add hl, bc
	dec a
	jr nz, .loop
.storeSubentryAddr
	inc de
	add hl, de
	ld a, l
	ld [wSubAnimSubEntryAddr], a
	ld a, h
	ld [wSubAnimSubEntryAddr + 1], a
	ret

; called if the subanimation type is not SUBANIMTYPE_ENEMY
; sets the transform to SUBANIMTYPE_NORMAL if it's the player's turn
; sets the transform to the subanimation type if it's the enemy's turn
GetSubanimationTransform1:
	vc_hook Reduce_move_anim_flashing_Spore
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld a, b
	ret nz
	xor a ; SUBANIMTYPE_NORMAL << 5
	ret

; called if the subanimation type is SUBANIMTYPE_ENEMY
; sets the transform to SUBANIMTYPE_HFLIP if it's the player's turn
; sets the transform to SUBANIMTYPE_NORMAL if it's the enemy's turn
GetSubanimationTransform2:
	ldh a, [hWhoseTurn]
	and a
	ld a, SUBANIMTYPE_HFLIP << 5
	ret z
	xor a ; SUBANIMTYPE_NORMAL << 5
	ret
