extends Rooms

@export var indoorObeliskPos: Vector2 = Vector2.ZERO
@export var hollyWaterPos: Vector2 = Vector2.ZERO

var indoorObeliskPath = preload("res://Entities/Task Objects/indoor_obelisk.tscn")
var hollyWaterPath = preload("res://Entities/Task Objects/holy_water.tscn")
var indoorObelisk
var hollyWater

func _ready() -> void:
	if !TaskSpawner.IndoorObeliskCompleted:
		indoorObelisk = indoorObeliskPath.instantiate()
		indoorObelisk.position = indoorObeliskPos
		add_child(indoorObelisk)
	
	if !TaskSpawner.HolyWaterCompleted:
		hollyWater = hollyWaterPath.instantiate()
		hollyWater.position = hollyWaterPos
		add_child(hollyWater)
