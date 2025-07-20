extends Node2D

@export var walkLizardPos: Vector2 = Vector2.ZERO
@export var trashPos: Vector2 = Vector2.ZERO

var walkLizardPath = preload("res://Entities/Task Objects/walk_lizard.tscn")
var trashPath = preload("res://Entities/Task Objects/take_trash_out.tscn")
var walkLizard
var trash

func _ready() -> void:
	if !TaskSpawner.TrashCompleted:
		trash = trashPath.instantiate()
		trash.position = trashPos
		add_child(trash)
	
	if !TaskSpawner.WalkLizardCompleted:
		walkLizard = walkLizardPath.instantiate()
		walkLizard.position = walkLizardPos
		add_child(walkLizard)

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
	
	if GlobalTimer.totalTime == 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/end_game.tscn")
	
	if TaskSpawner.Completed and GlobalTimer.totalTime < 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
