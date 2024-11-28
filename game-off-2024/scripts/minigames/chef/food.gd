extends Node2D

var gravity: int = 50
var velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	position.y += gravity * delta
	
	if position.y > 400:
		queue_free()
