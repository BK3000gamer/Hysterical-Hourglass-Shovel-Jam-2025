extends Node

@onready var total_time : int = 0

var timer = Timer.new()
var m = 0
var s = 0

func _ready() -> void:
	process_mode =Node.PROCESS_MODE_ALWAYS
	add_child(timer)
	timer.one_shot = false
	timer.start(1)
	timer.timeout.connect(_on_global_timer_timeout)

func _on_global_timer_timeout():
	total_time += 1
	m = int(total_time / 60)
	s = total_time - m * 60
