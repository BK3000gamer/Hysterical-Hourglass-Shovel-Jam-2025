extends Node2D
class_name Tasks

@export var dialogKey: String = ""
@export var dialogLine: int

func _ready() -> void:
	SignalBus.emit_signal("display_dialog", dialogKey)
	GlobalTimer.timer.one_shot = true

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and dialogLine > 0:
		SignalBus.emit_signal("display_dialog", dialogKey)
		dialogLine -= 1
