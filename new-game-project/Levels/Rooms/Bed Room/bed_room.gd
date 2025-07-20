extends Node2D

@export var foldClothesPos: Vector2 = Vector2.ZERO
@export var foldClothesRot: float

var foldClothesPath = preload("res://Entities/Task Objects/fold_clothes.tscn")
var foldClothes

func _ready() -> void:
	if !TaskSpawner.FoldClothesCompleted:
		foldClothes = foldClothesPath.instantiate()
		foldClothes.position = foldClothesPos
		foldClothes.rotation_degrees = foldClothesRot
		add_child(foldClothes)

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
	
	if GlobalTimer.totalTime == 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/end_game.tscn")
	
	if TaskSpawner.Completed and GlobalTimer.totalTime < 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
