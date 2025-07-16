extends Rooms

@export var desktopPos: Vector2 = Vector2.ZERO

var desktopPath = preload("res://Entities/Task Objects/computer_desktop.tscn")
var desktop

func _ready() -> void:
	if !TaskSpawner.ComputerDesktopCompleted:
		desktop = desktopPath.instantiate()
		desktop.position = desktopPos
		add_child(desktop)
