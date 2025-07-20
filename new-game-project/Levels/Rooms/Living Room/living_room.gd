extends Rooms

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
