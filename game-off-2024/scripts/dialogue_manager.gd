extends Node

# Character index (i.e. Child, Chef, Scientist, Doctor, Artist)
var character_index: int = 0
# Character dialogue index 
var dialogue_index: int  = 0
# Character dialogues
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
		
func next_character() -> void:
	character_index += 1
	
func next_line() -> void:
	dialogue_index += 1
	
func get_line() -> String:
	var character_lines = dialogues[character_index]["lines"]
	return character_lines[dialogue_index]
