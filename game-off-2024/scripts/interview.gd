extends Node2D

@onready var dialogue_manager: Node         = $DialogueManager
@onready var text_box: CanvasLayer          = $TextBox
@onready var minigame_viewport: SubViewport = $MinigamePanel/SubViewportContainer/SubViewport

const Minigame = preload("res://scripts/minigames/minigame.gd")

var character_scene: PackedScene
var minigame_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	text_box.set_text(dialogue_manager.get_line())
	dialogue_manager.next_line()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the viewport currently has a child
	if minigame_viewport.has_node("Minigame"):
		var minigame: Node2D = minigame_viewport.get_node("Minigame")
		# Check if the minigame ended
		if minigame.is_game_over():
			# TODO: We are setting the difficulty. But how do I make it actually use it?
			# I need to make the minigame restart with the new difficulty
			minigame.next_difficulty()
			
func set_character(character_scene_path: String):
	# Load the character scene
	var character_scene: PackedScene = load(character_scene_path) as PackedScene
	# Check if the scene exists
	if character_scene:
		# Create an instance of the character scene
		var character: Node2D = character_scene.instantiate()
		# Rename the node
		character.name = "Character"
		# Position the character
		character.position = Vector2(100.0, 70.0)
		# Add the character as a child node
		add_child(character)
	else:
		print("Failed to load character scene from:", character_scene_path)
		
func set_minigame(minigame_scene_path: String):
	# Load the minigame scene
	var minigame_scene: PackedScene = load(minigame_scene_path) as PackedScene
	# Check if the scene exists
	if minigame_scene:
		# Create an instance of the minigame scene
		var minigame: Node2D = minigame_scene.instantiate()
		# Rename the node
		minigame.name = "Minigame"
		# Add the minigame node as a child node of the minigame viewport
		minigame_viewport.add_child(minigame)
	else:
		print("Failed to load minigame scene from:", minigame_scene_path)
