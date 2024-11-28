extends "res://scripts/minigames/minigame.gd"

@onready var symptom1: Label = $"MarginContainer/VBoxContainer/SymptomHBoxContainer/Symptom 1"
@onready var symptom2: Label = $"MarginContainer/VBoxContainer/SymptomHBoxContainer/Symptom 2"
@onready var symptom3: Label = $"MarginContainer/VBoxContainer/SymptomHBoxContainer/Symptom 3"

@onready var diagnosis1: Button = $"MarginContainer/VBoxContainer/DiagnosisHBoxContainer/Diagnosis 1"
@onready var diagnosis2: Button = $"MarginContainer/VBoxContainer/DiagnosisHBoxContainer/Diagnosis 2"
@onready var diagnosis3: Button = $"MarginContainer/VBoxContainer/DiagnosisHBoxContainer/Diagnosis 3"

@onready var correct_sound: AudioStreamPlayer2D = $CorrectSound
@onready var wrong_sound: AudioStreamPlayer2D   = $WrongSound

var diagnostic_challenges: Array = []
var correct_diagnosis: String
var challenge_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_challenge_index()
	
	load_diagnostic_challenges("res://assets/minigames/doctor/diagnostic-challenge.json")
	
	set_challenge()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func load_diagnostic_challenges(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		var json_as_text: String = FileAccess.get_file_as_string(file_path)
		var json_as_dict: Dictionary = JSON.parse_string(json_as_text)
		diagnostic_challenges = json_as_dict["challenges"]
	else:
		print("File does not exist")
		
func set_challenge() -> void:
	var symtoms: Array = diagnostic_challenges[challenge_index]["symptoms"]
	var diagnoses: Array = diagnostic_challenges[challenge_index]["diagnoses"]
	
	symptom1.text = symtoms[0]
	symptom2.text = symtoms[1]	
	symptom3.text = symtoms[2]	
	
	diagnosis1.text = diagnoses[0]
	diagnosis2.text = diagnoses[1]
	diagnosis3.text = diagnoses[2]
	
	correct_diagnosis = diagnostic_challenges[challenge_index]["correct-diagnosis"]
	
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

func _on_diagnosis_1_button_up() -> void:
	check_guess(diagnosis1)

func _on_diagnosis_2_button_up() -> void:
	check_guess(diagnosis2)

func _on_diagnosis_3_button_up() -> void:
	check_guess(diagnosis3)

func check_guess(button: Button) -> void:
	if button.text == correct_diagnosis:
		correct_sound.play()
		won_game()
	else:
		wrong_sound.play()
		lose_game()
