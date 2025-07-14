extends CharacterBody2D

var pos: Vector2
@onready var sprite = $Sprite2D
var speed: float
var type: int

func _ready() -> void:
	global_position = pos

func _physics_process(delta: float) -> void:
	velocity.y = speed
	move_and_slide()
	
	if  type == 0:
		sprite.modulate = Color(1, 0, 0)
	elif type == 1:
		sprite.modulate = Color(0, 0, 1)
	elif  type == 2:
		sprite.modulate = Color(0, 1, 0)
