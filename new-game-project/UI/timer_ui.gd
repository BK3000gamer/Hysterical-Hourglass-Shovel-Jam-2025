extends CanvasLayer

@onready var label = $Label

func _process(delta: float) -> void:
	var m :int = GlobalTimer.m
	var s :int = GlobalTimer.s
	label.text = '%02d:%02d' % [m, s]
