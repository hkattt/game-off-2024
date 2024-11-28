extends "res://scripts/minigames/minigame.gd"

@onready var chicken_scene: PackedScene   = preload("res://scenes/minigames/chef/chicken.tscn")
@onready var coffee_scene: PackedScene    = preload("res://scenes/minigames/chef/coffee.tscn")
@onready var croissant_scene: PackedScene = preload("res://scenes/minigames/chef/croissant.tscn")
@onready var donut_scene: PackedScene     = preload("res://scenes/minigames/chef/donut.tscn")
@onready var ice_cream_scene: PackedScene = preload("res://scenes/minigames/chef/ice_cream.tscn")
@onready var pizza_scene: PackedScene     = preload("res://scenes/minigames/chef/pizza.tscn")

@onready var food_scenes: Array = [chicken_scene, coffee_scene, croissant_scene, donut_scene, ice_cream_scene, pizza_scene]

var food_timer = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	food_timer -= delta 
	
	if food_timer <= 0:
		spawn_food()
		food_timer = 5.0

func spawn_food() -> void:
	var random_index: int = randi() % food_scenes.size()
	var food_scene: PackedScene = food_scenes[random_index]
	var food: Node2D = food_scene.instantiate()
	food.position = Vector2(randf_range(25.0, 275.0), -50.0)
	add_child(food)
	
