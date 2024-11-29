extends Node2D

enum Music {
	BACKGROUND,
}

@onready var music_player: AudioStreamPlayer2D = $MusicPlayer

@onready var background_music: AudioStream  = preload("res://assets/sound/mysterious.mp3")

@onready var musics: Dictionary = {
	Music.BACKGROUND: background_music
}

func _ready() -> void:
	pass

func play_music(music: Music) -> void:
	if music in musics:
		var audio_stream: AudioStream = musics[music]
		if music_player.stream == audio_stream:
			return
		else:
			music_player.stop()
			music_player.stream = audio_stream
			music_player.play()

func _on_music_player_finished() -> void:
	music_player.play()
