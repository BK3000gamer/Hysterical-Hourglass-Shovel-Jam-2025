extends Node2D
class_name CutScenes

@export var dialogKey: String = ""
@export var dialogLine: int
@export_file("*.tscn") var nextScene: String

func _ready() -> void:
	SignalBus.emit_signal("display_dialog", dialogKey)
	GlobalTimer.timer.one_shot = true

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and dialogLine > 0:
		SignalBus.emit_signal("display_dialog", dialogKey)
		dialogLine -= 1

func _process(delta: float) -> void:
	if dialogLine == 0:
		GlobalTimer.timer.one_shot = false
		GlobalTimer.timer.start()
		get_tree().change_scene_to_file(nextScene)
