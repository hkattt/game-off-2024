extends Node2D

@onready var obstacle_scene = preload("res://scenes/minigames/child/rock.tscn")

# Time range for random spawning
const SPAWN_TIME_MIN: float = 1.0
const SPAWN_TIME_MAX: float = 3.0

var spawn_timer: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer = randf_range(SPAWN_TIME_MIN, SPAWN_TIME_MAX)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer -= delta
	
	# If the timer runs out, spawn an obstacle 
	if spawn_timer <= 0:
		spawn_obstacle()
		
		spawn_timer = randf_range(SPAWN_TIME_MIN, SPAWN_TIME_MAX)
		
func spawn_obstacle():
	var obstacle = obstacle_scene.instantiate()
	
	obstacle.position = Vector2(350, 90)
	
	add_child(obstacle)
