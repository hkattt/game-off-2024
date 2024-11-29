extends Node2D

@onready var text_box: MarginContainer = $TextBox

const game_scene: PackedScene = preload("res://scenes/game.tscn")

var story_text: String

func _ready() -> void:
	load_story("res://assets/story-introduction.txt") 
	text_box.set_text(story_text)
	
func load_story(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		story_text = FileAccess.get_file_as_string(file_path)
	else:
		print("File does not exist")

func _on_next_button_button_up() -> void:
	get_tree().change_scene_to_packed(game_scene)
	SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
