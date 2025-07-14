extends Node2D

var trashPath = preload("res://Levels/Tasks/Take Trash Out/trash.tscn")
var timer: Timer

@export var speed: float
@export var speedMultiplier: float
@export var interval: float
@export var intervalMultiplier: float

func _ready() -> void:
	randomize()
	timer = Timer.new()
	add_child(timer)
	timer.one_shot = false
	timer.wait_time = interval
	timer.start()
	timer.timeout.connect(timerTimeout)

func timerTimeout():
	var trash = trashPath.instantiate()
	trash.pos = global_position
	trash.speed = speed
	trash.type = randi() % 3
	get_parent().add_child(trash)
	timer.wait_time = timer.wait_time * intervalMultiplier
	speed = speed * speedMultiplier
	global_position.x = randf()*(1920)
	if trash.position.y > 1080:
		trash.queue_free()
