extends Node2D

@export var indoorObeliskPos: Vector2 = Vector2.ZERO
@export var hollyWaterPos: Vector2 = Vector2.ZERO

var indoorObeliskPath = preload("res://Entities/Task Objects/indoor_obelisk.tscn")
var hollyWaterPath = preload("res://Entities/Task Objects/holy_water.tscn")
var indoorObelisk
var hollyWater

func _ready() -> void:
	if !TaskSpawner.IndoorObeliskCompleted:
		indoorObelisk = indoorObeliskPath.instantiate()
		indoorObelisk.position = indoorObeliskPos
		add_child(indoorObelisk)
	
	if !TaskSpawner.HolyWaterCompleted:
		hollyWater = hollyWaterPath.instantiate()
		hollyWater.position = hollyWaterPos
		add_child(hollyWater)

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
	
	if GlobalTimer.totalTime == 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/end_game.tscn")
	
	if TaskSpawner.Completed and GlobalTimer.totalTime < 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
