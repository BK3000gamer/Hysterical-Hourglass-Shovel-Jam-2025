extends Node2D

@export var dialogKey: String = ""
@export var dialogLine: int

var dialog = dialogLine

func _on_button_button_down() -> void:
	dialog = dialogLine
	SignalBus.emit_signal("display_dialog", dialogKey)
	GlobalTimer.timer.one_shot = true

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and dialog > 0:
		SignalBus.emit_signal("display_dialog", dialogKey)
		dialog -= 1
