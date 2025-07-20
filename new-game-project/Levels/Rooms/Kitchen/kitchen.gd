extends Rooms

@export var dishesPos: Vector2 = Vector2.ZERO
@export var dishesRot: float

var dishesPath = preload("res://Entities/Task Objects/dishes.tscn")
var dishes

func _ready() -> void:
	
	if !TaskSpawner.DishesCompleted:
		dishes = dishesPath.instantiate()
		dishes.position = dishesPos
		dishes.rotation_degrees = dishesRot
		add_child(dishes)
