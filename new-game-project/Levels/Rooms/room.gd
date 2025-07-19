extends Node2D
class_name Rooms

@export var dialogKey: String = ""

func _ready() -> void:
	SignalBus.emit_signal("display_dialog", dialogKey)

func _process(delta: float) -> void:
	if GlobalTimer.time == 0:
		print("timeout")
