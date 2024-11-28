extends "res://scripts/minigames/minigame.gd"

@onready var element1: Label = $"MarginContainer/VBoxContainer/SequenceHBoxContainer/Element 1"
@onready var element2: Label = $"MarginContainer/VBoxContainer/SequenceHBoxContainer/Element 2"
@onready var element3: Label = $"MarginContainer/VBoxContainer/SequenceHBoxContainer/Element 3"
@onready var element4: Label = $"MarginContainer/VBoxContainer/SequenceHBoxContainer/Element 4"
@onready var element5: Label = $"MarginContainer/VBoxContainer/SequenceHBoxContainer/Element 5"
@onready var element6: Label = $"MarginContainer/VBoxContainer/SequenceHBoxContainer/Element 6"

@onready var next1: Button = $"MarginContainer/VBoxContainer/MissingHBoxContainer/MissingElement 1"
@onready var next2: Button = $"MarginContainer/VBoxContainer/MissingHBoxContainer/MissingElement 2"
@onready var next3: Button = $"MarginContainer/VBoxContainer/MissingHBoxContainer/MissingElement 3"

var logic_challenges: Array = []
var correct_next: String
var challenge_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_challenge_index()
	
	load_logic_challenges("res://assets/minigames/scientist/logic-challenges.json")
	
	set_challenge()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func load_logic_challenges(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		var json_as_text: String = FileAccess.get_file_as_string(file_path)
		var json_as_dict: Dictionary = JSON.parse_string(json_as_text)
		logic_challenges = json_as_dict["challenges"]
	else:
		print("File does not exist")
		
func set_challenge() -> void:
	var elements: Array      = logic_challenges[challenge_index]["elements"]
	var next_elements: Array = logic_challenges[challenge_index]["missing-elements"]
	
	element1.text = elements[0]
	element2.text = elements[1]	
	element3.text = elements[2]	
	element4.text = elements[3]	
	element5.text = elements[4]	
	element6.text = elements[5]	
	
	next1.text = next_elements[0]
	next2.text = next_elements[1]
	next3.text = next_elements[2]
	
	correct_next = logic_challenges[challenge_index]["correct-missing-element"]
	
func set_challenge_index() -> void:
	match level:
		Level.EASY:
			challenge_index = 0
		Level.MEDIUM:
			challenge_index = 1
		Level.HARD:
			challenge_index = 2
		_:
			challenge_index = -1

func _on_next_element_1_button_up() -> void:
	if next1.text == correct_next:
		won_game()
	else:
		lose_game()


func _on_next_element_2_button_up() -> void:
	if next2.text == correct_next:
		won_game()
	else:
		lose_game()


func _on_next_element_3_button_up() -> void:
	if next3.text == correct_next:
		won_game()
	else:
		lose_game()
