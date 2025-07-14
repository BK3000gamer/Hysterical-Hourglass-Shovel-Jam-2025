extends Area2D

var seed: int
var collided: bool = false
var initPos: float

func _ready() -> void:
	initPos = global_position.x
	randomize()
	reset()

func reset():
	seed = randi() % 5
	global_position.x = initPos + seed * 96


func _on_body_entered(body: Node2D) -> void:
	collided = true
