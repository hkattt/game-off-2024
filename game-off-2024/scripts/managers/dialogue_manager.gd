extends Node

# Character index (i.e. Child, Chef, Scientist, Doctor, Artist)
var character_index: int = 0
# Character dialogue index 
var positive_dialogue_index: int = 0
var negative_dialogue_index: int = 0
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
	positive_dialogue_index = 0
	negative_dialogue_index = 0
	
func next_positive_line() -> void:
	positive_dialogue_index += 1
	
func next_negative_line() -> void:
	negative_dialogue_index += 1
	
func get_character() -> String:
	return dialogues[character_index]["character"]
	
func get_opening_line() -> String:
	return dialogues[character_index]["opening"]

func get_closing_line() -> String:
	return dialogues[character_index]["closing"]
	
func get_positive_line() -> String:
	return dialogues[character_index]["positive"][positive_dialogue_index]
	
func get_negative_line() -> String:
	return dialogues[character_index]["negative"][negative_dialogue_index]
