extends MarginContainer

const CHARACTER_READ_RATE: float = 0.05

@onready var start_symbol: Label = $MarginContainer/HBoxContainer/Start
@onready var text: Label         = $MarginContainer/HBoxContainer/Text

@onready var tween: Tween = create_tween()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func hide_text_box() -> void:
	start_symbol.text = ""
	text.text         = ""
	hide()
	
func show_text_box() -> void:
	start_symbol.text = "*"
	show()

func set_text(new_text: String) -> void:
	text.text = new_text
	text.visible_ratio = 0.0
	show_text_box()
	
	tween.stop()
	tween = create_tween()
	tween.tween_property(text, "visible_ratio", 1.0, len(new_text) * CHARACTER_READ_RATE)	
