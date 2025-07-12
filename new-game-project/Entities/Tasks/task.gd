extends Node2D
class_name Tasks

@export var dialogKey = ""

func _on_button_button_down() -> void:
	SignalBus.emit_signal("display_dialog", dialogKey)
