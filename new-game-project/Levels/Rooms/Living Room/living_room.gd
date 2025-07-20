extends Node2D

@export var pictureFramePos: Vector2 = Vector2.ZERO
@export var pictureFrameRot: float

var pictureFramePath = preload("res://Entities/Task Objects/straighten_picture_frames.tscn")
var pictureFrame

func _ready() -> void:
	if !TaskSpawner.PictureFrameCompleted:
		pictureFrame = pictureFramePath.instantiate()
		pictureFrame.position = pictureFramePos
		pictureFrame.rotation_degrees = pictureFrameRot
		add_child(pictureFrame)

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
	
	if GlobalTimer.totalTime == 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/end_game.tscn")
	
	if TaskSpawner.Completed and GlobalTimer.totalTime < 1020:
		get_tree().change_scene_to_file("res://Levels/Cut Scene/failed.tscn")
