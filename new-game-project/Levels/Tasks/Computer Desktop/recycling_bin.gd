extends Area2D

var seed: Vector2
@onready var fileManager = $"../File Manager"
@onready var scoreCounter = $"../Scores"
var collided: bool = false

func _ready() -> void:
	reset()

func _physics_process(delta: float) -> void:
	for folder in fileManager.folders:
		if folder.global_position == global_position:
			reset()

func reset():
	randomize()
	seed.x = randi() % 2
	seed.y = randi() % 11
	global_position.y = 48 + seed.y * 96
	if seed.x == 0:
		global_position.x = 48
	else:
		global_position.x = 1872.0

func _on_body_entered(body: Node2D) -> void:
	scoreCounter.score += 1
	collided = true
