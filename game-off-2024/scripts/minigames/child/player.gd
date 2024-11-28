extends CharacterBody2D

const GRAVITY: int = 1000
const JUMP_VELOCITY: int = -300

@onready var jump_sound: AudioStreamPlayer2D  = $JumpSound

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	move_and_slide()
