extends Panel

@onready var character_name = $CharacterName

func set_character_name(name: String) -> void:
	character_name.text = name
