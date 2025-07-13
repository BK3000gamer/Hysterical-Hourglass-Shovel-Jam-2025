extends CanvasLayer

@onready var label = $Label

func _process(delta: float) -> void:
	var h :int = GlobalTimer.h
	var m :int = GlobalTimer.m
	label.text = '%02d:%02d' % [h, m]
