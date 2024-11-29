extends Node2D

@onready var text_box: MarginContainer = $TextBox

const game_scene: PackedScene = preload("res://scenes/screens/game.tscn")

var story_lines: Array
var line_index = 0

func _ready() -> void:
	load_story("res://assets/story-introduction.json") 
	text_box.set_text(story_lines[line_index])
	
func load_story(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		var json_as_text: String = FileAccess.get_file_as_string(file_path)
		var json_as_dict: Dictionary = JSON.parse_string(json_as_text)
		story_lines = json_as_dict["story"]
	else:
		print("File does not exist")

func _on_next_button_button_up() -> void:
	line_index += 1 
	
	if line_index < story_lines.size():
		text_box.set_text(story_lines[line_index])
	else:
		await FadeWindow.fade_out()
		get_tree().change_scene_to_packed(game_scene)
		await FadeWindow.fade_in()
		SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
