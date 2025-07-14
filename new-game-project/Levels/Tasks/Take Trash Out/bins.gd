extends Area2D

@export var type: types

@onready var scoreCounter = $"../Scores"
var dragging: bool = false
var offset: float

enum types {
	RECYCLE,
	GENERAL,
	ORGANIC
}

func _physics_process(delta: float) -> void:
	if dragging:
		position.x = get_global_mouse_position().x - offset

func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position().x - global_position.x

func _on_button_button_up() -> void:
	dragging = false
	
func _on_body_entered(body: Node2D) -> void:
	if body.type == type:
		scoreCounter.score += 1
	body.queue_free()
