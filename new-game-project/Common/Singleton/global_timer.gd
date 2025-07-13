extends Node

@onready var total_time : int = 480

var h = 0
var m = 0

func _ready() -> void:
	process_mode =Node.PROCESS_MODE_ALWAYS

func _process(delta: float) -> void:
	h = int(total_time / 60)
	m = total_time - h * 60
