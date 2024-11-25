extends Node2D

enum Character {
	Child,
	Chef,
	Scientist,
	Doctor,
	Artist
}

@onready var interview_scene: PackedScene = preload("res://scenes/interview.tscn")

var character: Character = Character.Child

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Path to character scene and minigame scene
	var character_scene_path: String = character_scene_path(character)
	var character_minigame_scene_path: String  = character_minigame_scene_path(character)
	
	print(character_scene_path)
	print(character_minigame_scene_path)
	
	# Create an instance of the inverview scene
	var interview = interview_scene.instantiate()
	
	interview.set_character(character_scene_path)
	interview.set_minigame(character_minigame_scene_path)
	add_child(interview)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func character_to_string(character: Character) -> String:
	match character:
		Character.Child:     return "child"
		Character.Chef:      return "chef"
		Character.Scientist: return "scientist"
		Character.Doctor:    return "doctor" 
		Character.Artist:    return "artist"
		_:                   return ""
		
func character_to_index(character: Character) -> int:
	match character:
		Character.Child:     return 0
		Character.Chef:      return 1
		Character.Scientist: return 2
		Character.Doctor:    return 3
		Character.Artist:    return 4
		_:                   return -1
	
func character_scene_path(character: Character) -> String:
	var character_string: String = character_to_string(character)
	return "res://scenes/minigames/" + character_string + "/" + character_string + ".tscn"
	
func character_minigame_scene_path(character: Character) -> String:
	var character_string: String = character_to_string(character)
	return "res://scenes/minigames/" + character_string + "/" + character_string + "_minigame.tscn"
