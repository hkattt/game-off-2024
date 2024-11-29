extends Node2D

enum InterviewState {
	RUNNING,
	COMPLETE
}

@onready var text_box: MarginContainer      = $TextBox
@onready var character_name: Label          = $CharacterName
@onready var minigame_viewport: SubViewport = $MinigamePanel/SubViewportContainer/SubViewport

const Minigame = preload("res://scripts/minigames/minigame.gd")

var character_scene: PackedScene
var minigame_scene: PackedScene

var dialogue_manager: Node2D

var interview_state: InterviewState = InterviewState.RUNNING
var level: Minigame.Level = Minigame.Level.EASY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	dialogue_manager = get_parent().get_node("DialogueManager")
	character_name.text = dialogue_manager.get_character()
	text_box.set_text(dialogue_manager.get_opening_line())
	instantiate_character()
	instantiate_minigame(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the viewport currently has a child
	if minigame_viewport.has_node("Minigame"):
		var minigame: Node2D = minigame_viewport.get_node("Minigame")		
		
		# Check if the game ended
		if minigame.is_over():
			# Check if the player won the game
			if minigame.is_won():
				text_box.set_text(dialogue_manager.get_positive_line())
				dialogue_manager.next_positive_line()
			# Check if the player lost the game
			elif minigame.is_lost():
				text_box.set_text(dialogue_manager.get_negative_line())
				dialogue_manager.next_negative_line()
				
			# Delete the previous minigame
			minigame.free()
			# Move to the next level
			level = Minigame.next_level(level)
			# Check if all the levels have been played
			if level == Minigame.Level.COMPLETE:
				# Sleep for 5 seconds
				await get_tree().create_timer(5).timeout
				interview_state = InterviewState.COMPLETE 
			else:	
				# Instantiate the next level
				instantiate_minigame(level)		
				
func set_character(character_scene_path: String):
	# Load the character scene
	character_scene = load(character_scene_path) as PackedScene
	# Check if the scene exists
	if !character_scene:
		print("Failed to load character scene from:", character_scene_path)
		
func instantiate_character():
	# Create an instance of the character scene
	var character: Node2D = character_scene.instantiate()
	# Rename the node
	character.name = "Character"
	# Position the character
	character.position = Vector2(100.0, 70.0)
	# Add the character as a child node
	add_child(character)
		
func set_minigame(minigame_scene_path: String):
	# Load the minigame scene
	minigame_scene = load(minigame_scene_path) as PackedScene
	# Check if the scene exists
	if !minigame_scene:
		print("Failed to load minigame scene from:", minigame_scene_path)
		
func instantiate_minigame(level: Minigame.Level):
	# Create an instance of the minigame scene
	var minigame: Node2D = minigame_scene.instantiate()
	# Rename the node
	minigame.name = "Minigame"
	# Set the level
	minigame.set_level(level)
	# Add the minigame node as a child node of the minigame viewport
	minigame_viewport.add_child(minigame)
	minigame.start_game()
	
func is_over() -> bool:
	return interview_state == InterviewState.COMPLETE
