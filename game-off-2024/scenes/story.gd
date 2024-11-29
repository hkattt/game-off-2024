extends Node2D

@onready var text_box: MarginContainer = $TextBox

const game_scene: PackedScene = preload("res://scenes/game.tscn")

var story_text: String
var read_timer: float = 60.0

func _ready() -> void:
	load_story("res://assets/story-introduction.txt") 
	text_box.set_text(story_text)
	
func _process(delta: float) -> void:
	read_timer -= delta
	
	if read_timer <= 0:
		get_tree().change_scene_to_packed(game_scene)
		SoundManager.play_sound(SoundManager.Sound.CLICK)

func load_story(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		story_text = FileAccess.get_file_as_string(file_path)
	else:
		print("File does not exist")
