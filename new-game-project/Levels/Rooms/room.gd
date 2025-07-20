extends Node2D

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
	
	if GlobalTimer.totalTime >= 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/end_game.tscn")
	
	if TaskSpawner.Completed and GlobalTimer.totalTime < 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
