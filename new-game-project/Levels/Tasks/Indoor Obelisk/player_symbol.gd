extends Sprite2D

@onready var array = $"../Array"
var tex1  = preload("res://Levels/Tasks/Indoor Obelisk/Up.png")
var tex2  = preload("res://Levels/Tasks/Indoor Obelisk/Down.png")
var tex3  = preload("res://Levels/Tasks/Indoor Obelisk/Left.png")
var tex4  = preload("res://Levels/Tasks/Indoor Obelisk/Right.png")

@export var index: int

func _process(delta: float) -> void:
	if array.input[index] == 0:
		modulate.a = 0.0
	elif array.input[index] == 1:
		modulate.a = 1.0
		texture = tex1
	elif array.input[index] == 2:
		modulate.a = 1.0
		texture = tex2
	elif array.input[index] == 3:
		modulate.a = 1.0
		texture = tex3
	elif array.input[index] == 4:
		modulate.a = 1.0
		texture = tex4
