extends Node2D

@export var desktopPos: Vector2 = Vector2.ZERO
@export var desktopRot: float

var desktopPath = preload("res://Entities/Task Objects/computer_desktop.tscn")
var desktop

func _ready() -> void:
	if !TaskSpawner.ComputerDesktopCompleted:
		desktop = desktopPath.instantiate()
		desktop.position = desktopPos
		desktop.rotation_degrees = desktopRot
		add_child(desktop)

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
	
	if GlobalTimer.totalTime == 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/end_game.tscn")
	
	if TaskSpawner.Completed and GlobalTimer.totalTime < 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
