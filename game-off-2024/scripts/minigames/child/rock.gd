extends Area2D

var speed: float = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x < 0:
		queue_free()

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.kill()
		queue_free()
