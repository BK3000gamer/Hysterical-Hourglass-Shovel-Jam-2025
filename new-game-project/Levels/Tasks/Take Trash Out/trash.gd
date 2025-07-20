extends CharacterBody2D

var pos: Vector2
@onready var sprite = $Sprite2D
var speed: float
var type: int
var pizza = preload("res://Levels/Tasks/Take Trash Out/Pizza.png")
var leaves = preload("res://Levels/Tasks/Take Trash Out/Leaves.png")
var cardboard = preload("res://Levels/Tasks/Take Trash Out/Cardboard.png")

func _ready() -> void:
	global_position = pos

func _physics_process(delta: float) -> void:
	velocity.y = speed
	move_and_slide()
	
	if  type == 0:
		sprite.texture = cardboard
	elif type == 1:
		sprite.texture = pizza
	elif  type == 2:
		sprite.texture = leaves
