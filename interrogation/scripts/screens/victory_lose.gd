extends Node2D

const end_scene_path: String = "res://scenes/screens/end.tscn"

func _on_next_button_button_up() -> void:
	SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
	await FadeWindow.fade_out()
	get_tree().change_scene_to_file(end_scene_path)
	await FadeWindow.fade_in()
