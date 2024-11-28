extends Node2D

@onready var child_button       = $MarginContainer/VBoxContainer/BottomHBoxContainer/ChildButton
@onready var doctor_button      = $MarginContainer/VBoxContainer/BottomHBoxContainer/DoctorButton
@onready var chef_button        = $MarginContainer/VBoxContainer/TopHBoxContainer/ChefButton
@onready var scientist_button   = $MarginContainer/VBoxContainer/TopHBoxContainer/ScientistButton

const victory_scene: PackedScene = preload("res://scenes/victory.tscn")
const lose_scene: PackedScene    = preload("res://scenes/lose.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_child_button_button_up() -> void:
	get_tree().change_scene_to_packed(victory_scene)

func _on_doctor_button_button_up() -> void:
	get_tree().change_scene_to_packed(lose_scene)

func _on_chef_button_button_up() -> void:
	get_tree().change_scene_to_packed(lose_scene)

func _on_scientist_button_button_up() -> void:
	get_tree().change_scene_to_packed(lose_scene)
