extends Node2D

@export var dishesPos: Vector2 = Vector2.ZERO
@export var dishesRot: float

var dishesPath = preload("res://Entities/Task Objects/dishes.tscn")
var dishes

func _ready() -> void:
	
	if !TaskSpawner.DishesCompleted:
		dishes = dishesPath.instantiate()
		dishes.position = dishesPos
		dishes.rotation_degrees = dishesRot
		add_child(dishes)

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
	
	if GlobalTimer.totalTime == 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/end_game.tscn")
	
	if TaskSpawner.Completed and GlobalTimer.totalTime < 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
