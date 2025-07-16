extends Rooms

@export var foldClothesPos: Vector2 = Vector2.ZERO

var foldClothesPath = preload("res://Entities/Task Objects/fold_clothes.tscn")
var foldClothes

func _ready() -> void:
	if !TaskSpawner.FoldClothesCompleted:
		foldClothes = foldClothesPath.instantiate()
		foldClothes.position = foldClothesPos
		add_child(foldClothes)
