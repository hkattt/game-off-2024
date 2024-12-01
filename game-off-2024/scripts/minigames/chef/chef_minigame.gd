extends "res://scripts/minigames/minigame.gd"

@onready var tutorial_text: Label = $TutorialText

@onready var chicken_scene: PackedScene   = preload("res://scenes/minigames/chef/chicken.tscn")
@onready var coffee_scene: PackedScene    = preload("res://scenes/minigames/chef/coffee.tscn")
@onready var croissant_scene: PackedScene = preload("res://scenes/minigames/chef/croissant.tscn")
@onready var donut_scene: PackedScene     = preload("res://scenes/minigames/chef/donut.tscn")
@onready var ice_cream_scene: PackedScene = preload("res://scenes/minigames/chef/ice_cream.tscn")
@onready var pizza_scene: PackedScene     = preload("res://scenes/minigames/chef/pizza.tscn")

@onready var food_scenes: Array = [
	chicken_scene, 
	coffee_scene, 
	croissant_scene, 
	donut_scene, 
	ice_cream_scene, 
	pizza_scene
]

var win_timer: float = 20.0
var food_timer: float
var food_spawn_rate: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if level != Level.EASY:
		tutorial_text.visible = false
		
	set_spawn_rate()
	food_timer = food_spawn_rate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !tutorial_text.visible:
		food_timer -= delta 
		win_timer  -= delta
	
	if food_timer <= 0 && win_timer > 2:
		spawn_food()
		food_timer = food_spawn_rate
		
	if win_timer <= 0:
		SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
		won_game()

func set_spawn_rate() -> void:
	match level:
		Level.EASY: 
			food_spawn_rate = 3.0
		Level.MEDIUM:
			food_spawn_rate = 2.0
		Level.HARD:
			food_spawn_rate = 1.0
		Level.COMPLETE:
			pass

func spawn_food() -> void:
	var random_index: int = randi() % food_scenes.size()
	var food_scene: PackedScene = food_scenes[random_index]
	var food: Node2D = food_scene.instantiate()
	food.position = Vector2(randf_range(25.0, 275.0), -50.0)
	add_child(food)
