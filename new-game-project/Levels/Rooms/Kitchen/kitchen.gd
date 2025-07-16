extends Rooms

@export var trashPos: Vector2 = Vector2.ZERO
@export var dishesPos: Vector2 = Vector2.ZERO

var trashPath = preload("res://Entities/Task Objects/take_trash_out.tscn")
var dishesPath = preload("res://Entities/Task Objects/dishes.tscn")
var trash
var dishes

func _ready() -> void:
	if !TaskSpawner.TrashCompleted:
		trash = trashPath.instantiate()
		trash.position = trashPos
		add_child(trash)
	
	if !TaskSpawner.DishesCompleted:
		dishes = dishesPath.instantiate()
		dishes.position = dishesPos
		add_child(dishes)
