extends Node2D

const story_scene_path: String = "res://scenes/screens/story.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(MusicManager.Music.BACKGROUND)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
		await FadeWindow.fade_out()
		get_tree().change_scene_to_file(story_scene_path)
		await FadeWindow.fade_in()
