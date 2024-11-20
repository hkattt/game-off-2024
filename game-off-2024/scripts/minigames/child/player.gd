extends CharacterBody2D

enum State {
	ALIVE,
	DEAD
}

const GRAVITY: int = 1000.0
const JUMP_VELOCITY: int = -300.0

# Player state - dead or alive
var state: State = State.ALIVE

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
func kill() -> void:
	state = State.DEAD

func is_dead() -> bool:
	return state == State.DEAD
