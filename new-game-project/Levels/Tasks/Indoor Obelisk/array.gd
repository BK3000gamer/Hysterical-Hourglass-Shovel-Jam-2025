extends Node

@onready var scoreCounter = $"../Scores"
@onready var obelisk: Array = []
@onready var input: Array = []
var index = 0

func _ready() -> void:
	reset()

func _physics_process(delta: float) -> void:
	if !input[3] == 0:
		if obelisk == input:
			scoreCounter.score += 1
		reset()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("up"):
		input[index] = 1
		index += 1
	elif Input.is_action_just_pressed("down"):
		input[index] = 2
		index += 1
	elif Input.is_action_just_pressed("left"):
		input[index] = 3
		index += 1
	elif Input.is_action_just_pressed("right"):
		input[index] = 4
		index += 1

func reset():
	index = 0
	input = [0, 0, 0, 0]
	obelisk = [0, 0, 0, 0]
	randomize()
	var A = randi() % 4 + 1
	obelisk[0] = A
	var B = randi() % 4 + 1
	obelisk[1] = B
	var C = randi() % 4 + 1
	obelisk[2] = C
	var D = randi() % 4 + 1
	obelisk[3] = D
