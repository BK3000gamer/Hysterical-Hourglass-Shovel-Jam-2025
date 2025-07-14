extends Node2D

@onready var scoreCounter = $"../Scores"

@export var snapAngle: float = 0.05

var mouse = get_global_mouse_position()
var mouseDown: bool = false
var angle: float
var dragging: bool = false
var dragStartPos: Vector2
var dragOffset
var disabled: bool = false
var scored: bool = false

func _ready() -> void:
	randomize()
	angle = randf()*(PI+PI)-PI
	rotation = angle

func _input(event: InputEvent) -> void:
	var distance = position.distance_to(mouse)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			mouseDown = event.pressed
			if mouseDown:
				dragStartPos = event.position
				dragging = false
			else:
				dragging = false
	elif event is InputEventMouseMotion and mouseDown and !disabled and distance < 250:
		if dragStartPos.distance_to(event.position) > 5:
			dragging = true
			var mouseAngle = global_position.angle_to_point(mouse)
			dragOffset = rotation - mouseAngle

func is_near_zero(value: float, epsilon: float = snapAngle) -> bool:
	return abs(value) < epsilon

func _physics_process(delta: float) -> void:
	mouse = get_global_mouse_position()
	if dragging:
		var mouseAngle = global_position.angle_to_point(mouse)
		rotation = mouseAngle + dragOffset
	
	if is_near_zero(rotation):
		disabled = true
		rotation = 0
	else:
		disabled = false
	
	if !mouseDown and disabled and !scored:
		scored = true
		scoreCounter.score += 1
