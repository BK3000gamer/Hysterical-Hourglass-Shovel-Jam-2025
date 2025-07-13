extends CanvasLayer

var score: int = 0
@onready var label = $Label

func _process(delta: float) -> void:
	label.text = '%02d' % [score]
