extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
