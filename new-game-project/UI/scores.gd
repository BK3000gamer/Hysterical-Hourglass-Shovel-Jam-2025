extends CanvasLayer

var score: int = 0
@onready var label = $Label

@export var time: int = 0
@export var scoreMultiplier: int = 0
@export var autoFinish: bool = false
@export var finishScore: int = 0
@export var timedScore: bool = false
@export var timedScoreMultiplier: int = 0
@export_file("*.tscn") var room: String

func _ready() -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.start(1)
	timer.one_shot = false
	timer.timeout.connect(timerTimeout)

func timerTimeout():
	time -= 1

func finish(parent: String):
	if parent == "Computer Desktop":
		TaskSpawner.ComputerDesktopCompleted = true
	elif parent == "Dishes":
		TaskSpawner.DishesCompleted = true
	elif parent == "Fold Clothes":
		TaskSpawner.FoldClothesCompleted = true
	elif parent == "Holy Water":
		TaskSpawner.HolyWaterCompleted = true
	elif parent == "Indoor Obelisk":
		TaskSpawner.IndoorObeliskCompleted = true
	elif parent == "Straighten Picture Frames":
		TaskSpawner.PictureFrameCompleted = true
	elif parent == "Take Trash Out":
		TaskSpawner.TrashCompleted = true
	elif parent == "Walk Lizard":
		TaskSpawner.WalkLizardCompleted = true
	GlobalTimer.totalTime += score * scoreMultiplier
	GlobalTimer.time = 60
	GlobalTimer.timer.one_shot = false
	GlobalTimer.timer.start()
	get_tree().change_scene_to_file(room)

func _process(delta: float) -> void:
	label.text = '%02d\n%02d' % [time, score]
	if time == 0:
		finish(get_parent().name)
	
	if autoFinish and score == finishScore:
		if timedScore:
			GlobalTimer.totalTime += time * timedScoreMultiplier
		finish(get_parent().name)
