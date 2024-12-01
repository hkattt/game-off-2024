extends TextureButton

const main_menu: PackedScene = preload("res://scenes/screens/start_menu.tscn")

func _on_button_up() -> void:
	SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
	await FadeWindow.fade_out()
	get_tree().change_scene_to_packed(main_menu)
	await FadeWindow.fade_in()
