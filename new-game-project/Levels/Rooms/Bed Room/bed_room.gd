extends Rooms

@export var foldClothesPos: Vector2 = Vector2.ZERO
@export var foldClothesRot: float

var foldClothesPath = preload("res://Entities/Task Objects/fold_clothes.tscn")
var foldClothes

func _ready() -> void:
	if !TaskSpawner.FoldClothesCompleted:
		foldClothes = foldClothesPath.instantiate()
		foldClothes.position = foldClothesPos
		foldClothes.rotation_degrees = foldClothesRot
		add_child(foldClothes)
