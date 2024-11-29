extends Node2D

var gravity: int = 50
var velocity: Vector2 = Vector2.ZERO

var minigame: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	minigame = get_parent()
	
func _physics_process(delta: float) -> void:
	position.y += gravity * delta
	
	if position.y > 100:
		queue_free()
		minigame.lose_game()
		SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
