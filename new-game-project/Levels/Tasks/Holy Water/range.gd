extends Area2D

@onready var cursor = $"../Cursor"

func _ready() -> void:
	reset()

func reset():
	randomize()
	position.y = randf() * (800 - 300) + 300
	scale.y = randf() * (2.5 - 1) + 1


func _on_body_entered(body: Node2D) -> void:
	if body == cursor:
		body.collided = true


func _on_body_exited(body: Node2D) -> void:
	if body == cursor:
		body.collided = false
