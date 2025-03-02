	audio_eng_channel SFX_Save, 5

	duty_cycle 2

IF audio_engine == 1
	square_note 4, 15, 4, 1792
	square_note 2, 14, 4, 1536
	square_note 2, 14, 4, 1664
	square_note 2, 14, 4, 1728
	square_note 2, 14, 4, 1792
	square_note 2, 14, 4, 1952

ENDC

IF audio_engine == 3
	square_note 3, 14, 4, 1536
	square_note 3, 14, 4, 1664
	square_note 3, 14, 4, 1728
	square_note 3, 14, 4, 1792
ENDC

	square_note 15, 15, 2, 2016
	sound_ret


	audio_eng_channel SFX_Save, 6

	duty_cycle 2

IF audio_engine == 1
	square_note 4, 0, 8, 0
	square_note 2, 13, 4, 1793
	square_note 2, 12, 4, 1537
	square_note 2, 12, 4, 1665
	square_note 2, 12, 4, 1729
	square_note 2, 12, 4, 1793
	square_note 2, 12, 4, 1953
ENDC

IF audio_engine == 3
	square_note 3, 0, 8, 0
	square_note 3, 12, 4, 1537
	square_note 3, 12, 4, 1665
	square_note 3, 12, 4, 1729
	square_note 3, 12, 4, 1793
ENDC

	square_note 15, 13, 2, 2017
	sound_ret
