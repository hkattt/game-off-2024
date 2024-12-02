extends CharacterBody2D

const GRAVITY: int = 1000
const JUMP_VELOCITY: int = -300

@onready var tutorial_text: Label

func _ready() -> void:
	tutorial_text = get_parent().get_node("TutorialText")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		tutorial_text.visible = false
		velocity.y = JUMP_VELOCITY
		SoundManager.play_sound(SoundManager.Sound.JUMP, 10.0)

	move_and_slide()
