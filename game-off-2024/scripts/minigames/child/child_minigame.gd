extends "res://scripts/minigames/minigame.gd"

# Player node
@onready var player: Node2D = $Player
# Obstacle scene
@onready var obstacle_scene: PackedScene = preload("res://scenes/minigames/child/rock.tscn")
# Finish line scene
@onready var finish_line_scene: PackedScene = preload("res://scenes/minigames/child/finish_line.tscn")

# Time range for random spawning
var spawn_time_min: float
var spawn_time_max: float
# Current timer
var spawn_timer: float = 0.0
var win_timer: float = 20.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_spawn_rates()
			
	spawn_timer = randf_range(spawn_time_min, spawn_time_max)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer -= delta
	win_timer -= delta
	
	# If the spawn timer runs out, spawn an obstacle 
	if spawn_timer <= 0:
		spawn_object(obstacle_scene, Vector2(300, 90))
		spawn_timer = randf_range(spawn_time_min, spawn_time_max)
	# If the win timer runs out, spawn a finish line
	if win_timer <= 0:
		spawn_object(finish_line_scene, Vector2(300, 0))
		win_timer = INF
		
func spawn_object(object_scene: PackedScene, position: Vector2):
	var object: Area2D = object_scene.instantiate()
	object.position = position
	add_child(object)
			
func set_spawn_rates() -> void:
	match level:
		Level.EASY:
			spawn_time_min = 2.0
			spawn_time_max = 4.0
		Level.MEDIUM:
			spawn_time_min = 1.0
			spawn_time_max = 2.0
		Level.HARD:
			spawn_time_min = 0.5
			spawn_time_max = 1.0
		_:
			pass
