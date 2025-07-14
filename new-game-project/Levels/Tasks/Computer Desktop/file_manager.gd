extends Node2D

var folders: Array
var collided: bool = false
@onready var file = $"../File"
@onready var bin = $"../Recycling Bin"

func _physics_process(delta: float) -> void:
	for child in get_parent().get_children():
		if child.is_in_group("folders"):
			if child.collided:
				collided = true
	
	if bin.collided:
		collided = true
	
	if collided:
		for child in get_parent().get_children():
			if child.is_in_group("folders"):
				collided = false
				child.collided = false
				bin.collided = false
				child.reset()
		
		file._ready()
		bin._ready()
