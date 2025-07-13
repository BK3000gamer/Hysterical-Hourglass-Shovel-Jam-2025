extends Node2D
class_name Objects

var dragging = false
var offset: Vector2

func _physics_process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
