extends Node2D

var dragging: bool = false
var pulled: bool = false
var offset: Vector2
var force: float
var mouse = get_global_mouse_position()
var mouseDir = Vector2(960,700).direction_to(mouse)

func _physics_process(delta: float) -> void:
	mouse = get_global_mouse_position()
	mouseDir = Vector2(960,800).direction_to(mouse)
	var length = Vector2(960,800).distance_to(mouse)
	if dragging:
		pulled = true
		if length < 250:
			position = get_global_mouse_position() - offset
			force = length
		else:
			position = mouseDir * 250 + Vector2(960,800)
			force = 250
	else:
		position = Vector2(960,800)
		force = 0

func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false
