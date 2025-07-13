extends Node2D

@export_file("*.tscn") var task: String

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file(task)
