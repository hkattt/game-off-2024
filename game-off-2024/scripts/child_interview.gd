extends Node2D

@onready var dialogue_manager: Node = $DialogueManager
@onready var text_box: CanvasLayer  = $TextBox

var character_index: int = 0
var character_dialogue: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character_dialogue = dialogue_manager.dialogues[0]
	text_box.set_text(character_dialogue["lines"][0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
