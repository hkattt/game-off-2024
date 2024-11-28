extends CharacterBody2D

# Movement speed
var speed = 200.0

func _physics_process(delta) -> void:
	var input_vector = Vector2.ZERO  # No movement by default
	
	# Move right
	if Input.is_action_pressed("ui_right"):  
		input_vector.x += 1
	# Move left
	if Input.is_action_pressed("ui_left"):  
		input_vector.x -= 1

	# Normalize to prevent faster diagonal movement and scale by speed
	velocity = input_vector * speed
	
	# Use move_and_slide to handle movement and collisions
	move_and_slide()

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	area.queue_free()
