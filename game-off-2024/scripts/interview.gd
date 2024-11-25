extends Node2D

@onready var dialogue_manager: Node         = $DialogueManager
@onready var text_box: CanvasLayer          = $TextBox
@onready var minigame_viewport: SubViewport = $MinigamePanel/SubViewportContainer/SubViewport

const Minigame = preload("res://scripts/minigames/minigame.gd")

var character_scene: PackedScene
var minigame_scene: PackedScene

var level: Minigame.Level = Minigame.Level.EASY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	text_box.set_text(dialogue_manager.get_line())
	dialogue_manager.next_line()
	instantiate_character()
	instantiate_minigame(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the viewport currently has a child
	if minigame_viewport.has_node("Minigame"):
		var minigame: Node2D = minigame_viewport.get_node("Minigame")
		
		print("Minigame state:", minigame.game_state)
		# Check if the minigame ended
		if minigame.is_game_over():
			# Delete the previous minigame
			minigame.free()
			# Move to the next level
			level = Minigame.next_level(level)
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
	print("Minigame Viewport", minigame_viewport.get_children())
	minigame_viewport.add_child(minigame)
	print("Minigame Viewport", minigame_viewport.get_children())
	minigame.start_game()
