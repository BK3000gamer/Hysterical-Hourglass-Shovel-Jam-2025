extends Sprite2D

@onready var array = $"../Array"
var tex1  = preload("res://Assets/Textures/Green/texture_09.png")
var tex2  = preload("res://Assets/Textures/Orange/texture_09.png")
var tex3  = preload("res://Assets/Textures/Purple/texture_09.png")
var tex4  = preload("res://Assets/Textures/Red/texture_09.png")

@export var index: int

func _process(delta: float) -> void:
	if array.obelisk[index] == 0:
		modulate.a = 0.0
	elif array.obelisk[index] == 1:
		texture = tex1
	elif array.obelisk[index] == 2:
		texture = tex2
	elif array.obelisk[index] == 3:
		texture = tex3
	elif array.obelisk[index] == 4:
		texture = tex4
