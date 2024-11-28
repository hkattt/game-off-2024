extends Area2D

@onready var death_sound: AudioStreamPlayer2D = $DeathSound

var minigame: Node2D

var speed: float = 200

func _ready() -> void:
	minigame = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x < 0:
		queue_free()

func _on_body_entered(body):
	if body is CharacterBody2D:
		death_sound.play()
		minigame.lose_game()
		queue_free()
