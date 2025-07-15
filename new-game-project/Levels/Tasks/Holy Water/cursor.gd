extends CharacterBody2D

@onready var scoreCounter = $"../Scores"
@onready var range = $"../Range"

@export var speed: float = 100
@export var speedMultiplier: float = 1.1

var collided: bool = false

func _ready() -> void:
	reset()

func reset():
	position.y = 900
	collided = false
	speed = speed * speedMultiplier

func _physics_process(delta: float) -> void:
	if position.y >= 900:
		velocity.y = - speed
	elif position.y <= 200:
		velocity.y = speed
		
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if collided:
			velocity.y = 0
			scoreCounter.score += 1
		reset()
		range.reset()
