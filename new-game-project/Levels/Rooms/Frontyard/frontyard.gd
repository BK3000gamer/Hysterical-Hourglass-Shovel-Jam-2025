extends Rooms

@export var walkLizardPos: Vector2 = Vector2.ZERO

var walkLizardPath = preload("res://Entities/Task Objects/walk_lizard.tscn")
var walkLizard

func _ready() -> void:
	if !TaskSpawner.WalkLizardCompleted:
		walkLizard = walkLizardPath.instantiate()
		walkLizard.position = walkLizardPos
		add_child(walkLizard)
