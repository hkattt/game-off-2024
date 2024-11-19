extends CanvasLayer

const CHARACTER_READ_RATE: float = 0.05

@onready var text_box_container: MarginContainer = $TextBoxContainer
@onready var start_symbol: Label                 = $TextBoxContainer/MarginContainer/HBoxContainer/Start
@onready var text: Label                         = $TextBoxContainer/MarginContainer/HBoxContainer/Text

var tween: Tween = create_tween()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text("This is a fairly long message, I wonder how it will handle this?")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func hide_text_box() -> void:
	start_symbol.text = ""
	text.text         = ""
	text_box_container.hide()
	
func show_text_box() -> void:
	start_symbol.text = "*"
	text_box_container.show()

func set_text(new_text) -> void:
	text.text = new_text
	text.visible_ratio = 0.0
	show_text_box()
	tween.tween_property(text, "visible_ratio", 1.0, len(text.text) * CHARACTER_READ_RATE)
	
