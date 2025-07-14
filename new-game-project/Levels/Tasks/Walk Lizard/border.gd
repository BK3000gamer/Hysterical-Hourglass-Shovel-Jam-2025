extends Area2D

@onready var scoreCounter = $"../Scores"

func _ready() -> void:
	scoreCounter.score = 10

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		scoreCounter.score -= 1
		body.position.y = 540
