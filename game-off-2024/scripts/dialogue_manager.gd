extends Node

var dialogues: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_dialogues("res://assets/dialogue.json")
	
func load_dialogues(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		var json_as_text: String = FileAccess.get_file_as_string(file_path)
		var json_as_dict: Dictionary = JSON.parse_string(json_as_text)
		dialogues = json_as_dict["dialogues"]
	else:
		print("File does not exist")
