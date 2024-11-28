extends CharacterBody2D

# Movement speed
var speed = 200.0

func _physics_process(delta):
	var input_vector = Vector2.ZERO  # No movement by default
	
	if Input.is_action_pressed("ui_right"):  # Move right
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):  # Move left
		input_vector.x -= 1

	# Normalize to prevent faster diagonal movement and scale by speed
	velocity = input_vector * speed
	
	# Use move_and_slide to handle movement and collisions
	move_and_slide()
