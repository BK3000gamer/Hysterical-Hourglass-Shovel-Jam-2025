extends Node

@onready var totalTime: int = 480
@onready var time: int = 120

var h = 0
var m = 0
var cm = 0
var cs = 0
var timer = Timer.new()

func _ready() -> void:
	process_mode =Node.PROCESS_MODE_ALWAYS
	
	add_child(timer)
	timer.start(1)
	timer.one_shot = false
	timer.timeout.connect(timerTimeout)

func timerTimeout():
	time -= 1

func _process(delta: float) -> void:
	h = int(totalTime / 60)
	m = totalTime - h * 60
	cm = int(time / 60)
	cs = time - cm * 60
