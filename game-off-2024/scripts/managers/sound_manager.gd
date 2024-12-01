extends Node2D

enum Sound {
	JUMP,
	DEATH,
	CORRECT,
	WRONG,
	CLICK,
	CRUNCH
}

@onready var sound_player: AudioStreamPlayer2D = $SoundPlayer

@onready var jump_sound: AudioStream    = preload("res://assets/sound/pop.mp3")
@onready var death_sound: AudioStream   = preload("res://assets/sound/explosion.mp3")
@onready var correct_sound: AudioStream = preload("res://assets/sound/correct.mp3")
@onready var wrong_sound: AudioStream   = preload("res://assets/sound/wrong.mp3")
@onready var click_sound: AudioStream   = preload("res://assets/sound/click.mp3")
@onready var crunch_sound: AudioStream  = preload("res://assets/sound/crunch.mp3")

@onready var sounds: Dictionary = {
	Sound.JUMP:    jump_sound,
	Sound.DEATH:   death_sound,
	Sound.CORRECT: correct_sound,
	Sound.WRONG:   wrong_sound,
	Sound.CLICK:   click_sound,
	Sound.CRUNCH:  crunch_sound
}

func _ready() -> void:
	pass

func play_sound(sound: Sound, volume_db: float = 0.0) -> void:
	if sound in sounds:
		var audio_stream: AudioStream = sounds[sound]
		sound_player.stop()
		sound_player.stream = audio_stream
		sound_player.set_volume_db(volume_db)
		sound_player.play()
