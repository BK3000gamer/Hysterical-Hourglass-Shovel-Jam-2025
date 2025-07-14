extends CharacterBody2D

@export var speed: float = 100

@onready var bar = $"../TextureProgressBar"

var timeout: bool = false

func _ready() -> void:
	randomize()
	var timer = Timer.new()
	add_child(timer)
	timer.one_shot = false
	timer.wait_time = 1
	timer.start()
	timer.timeout.connect(timerTimeout)

func timerTimeout():
	timeout = true

func _physics_process(delta: float) -> void:	
	if timeout:
		speed = randf() * (150 - 50) + 50
	
	velocity.y = -speed
	move_and_slide()

func _input(event: InputEvent) -> void:	
	if Input.is_action_just_pressed("ui_accept"):
		position.y += 12
