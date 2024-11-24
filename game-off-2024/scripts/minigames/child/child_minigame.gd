extends "res://scripts/minigames/minigame.gd"

# Player node
@onready var player: Node2D = $Player
# Obstacle scene
@onready var obstacle_scene: PackedScene = preload("res://scenes/minigames/child/rock.tscn")

# Time range for random spawning
var spawn_time_min: float
var spawn_time_max: float
# Current timer
var spawn_timer: float = 0.0
# Game difficulty
var current_difficulty: Difficulty

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_spawn_rates()
			
	spawn_timer = randf_range(spawn_time_min, spawn_time_max)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer -= delta
	
	# If the timer runs out, spawn an obstacle 
	if spawn_timer <= 0:
		spawn_obstacle()
		spawn_timer = randf_range(spawn_time_min, spawn_time_max)
		
	if player.is_dead():
		lose_game()
		
func spawn_obstacle():
	var obstacle: Area2D = obstacle_scene.instantiate()
	obstacle.position = Vector2(300, 90)
	add_child(obstacle)
			
func set_spawn_rates() -> void:
	match current_difficulty:
		Difficulty.EASY:
			spawn_time_min = 2.0
			spawn_time_max = 4.0
		Difficulty.MEDIUM:
			spawn_time_min = 0.0
			spawn_time_max = 0.25
		Difficulty.HARD:
			spawn_time_min = 0.0
			spawn_time_max = 0.25
