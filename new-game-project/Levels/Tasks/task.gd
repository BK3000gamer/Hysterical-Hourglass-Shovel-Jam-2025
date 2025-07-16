extends Node2D
class_name Tasks

@export var dialogKey: String = ""

func _ready() -> void:
	SignalBus.emit_signal("display_dialog", dialogKey)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):	
		SignalBus.emit_signal("display_dialog", dialogKey)
