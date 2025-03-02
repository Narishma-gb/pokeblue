; Number of entries in CreditsRollPointers (see data/credits/credits.order.asm)
DEF NUM_CRED_SCREENS EQU 26

; CreditsTextPointers indexes (see data/credits/credits_text.asm)
	const_def
	const CRED_STAFF          ; $00
	const CRED_TAJIRI         ; $01
	const CRED_TA_OOTA        ; $02
	const CRED_MORIMOTO       ; $03
	const CRED_WATANABE       ; $04
	const CRED_MASUDE         ; $05
	const CRED_NISINO         ; $06
	const CRED_SUGIMORI       ; $07
	const CRED_NISHIDA        ; $08
	const CRED_MIYAMOTO       ; $09
	const CRED_KAWAGUCHI      ; $0A
	const CRED_ISHIHARA       ; $0B
	const CRED_YAMAUCHI       ; $0C
	const CRED_ZINNAI         ; $0D
	const CRED_HISHIDA        ; $0E
	const CRED_SAKAI          ; $0F
	const CRED_YAMAGUCHI      ; $10
	const CRED_YAMAMOTO       ; $11
	const CRED_TANIGUCHI      ; $12
	const CRED_NONOMURA       ; $13
	const CRED_FUZIWARA       ; $14
	const CRED_MATSUSIMA      ; $15
	const CRED_TOMISAWA       ; $16
	const CRED_KAWAMOTO       ; $17
	const CRED_KAKEI          ; $18
	const CRED_TSUCHIYA       ; $19
	const CRED_NAKAMURA       ; $1A
	const CRED_YUDA           ; $1B
	const CRED_MON            ; $1C
	const CRED_DIRECTOR       ; $1D
	const CRED_PROGRAMMERS    ; $1E
	const CRED_CHAR_DESIGN    ; $1F
	const CRED_MUSIC          ; $20
	const CRED_SOUND_EFFECTS  ; $21
	const CRED_GAME_DESIGN    ; $22
	const CRED_MONSTER_DESIGN ; $23
	const CRED_GAME_SCENE     ; $24
	const CRED_PARAM          ; $25
	const CRED_MAP            ; $26
	const CRED_TEST           ; $27
	const CRED_SPECIAL        ; $28
	const CRED_PRODUCERS      ; $29
	const CRED_EXECUTIVE      ; $2A
	const CRED_TAMADA         ; $2B
	const CRED_SA_OOTA        ; $2C
	const CRED_YOSHIKAWA      ; $2D
	const CRED_TO_OOTA        ; $2E
DEF NUM_CRED_STRINGS EQU const_value

	const_def -1, -1
	const CRED_TEXT_FADE_MON ; $FF
	const CRED_TEXT_MON      ; $FE
	const CRED_TEXT_FADE     ; $FD
	const CRED_TEXT          ; $FC
	const CRED_COPYRIGHT     ; $FB
	const CRED_THE_END       ; $FA
