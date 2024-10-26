extends Control
@export var main_level : PackedScene

func _on_btn_play_pressed() -> void:
	#get_tree().change_scene_to_file("res://FlappyBird/Scenes/level.tscn")
	get_tree().change_scene_to_packed(main_level)


func _on_btn_quit_pressed() -> void:
	get_tree().quit()
