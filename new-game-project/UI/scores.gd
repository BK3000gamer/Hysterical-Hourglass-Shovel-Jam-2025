extends CanvasLayer

var score: int = 0
@onready var label = $Label

@export var time: int = 0
@export var scoreMultiplier: int = 0
@export_file("*.tscn") var room: String

func _ready() -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.start(1)
	timer.one_shot = false
	timer.timeout.connect(timerTimeout)

func timerTimeout():
	time -= 1

func _process(delta: float) -> void:
	label.text = '%02d\n%02d' % [time, score]
	if time == 0:
		GlobalTimer.total_time += score * scoreMultiplier
		get_tree().change_scene_to_file(room)
