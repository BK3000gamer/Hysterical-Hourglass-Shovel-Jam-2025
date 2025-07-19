extends CanvasLayer

@onready var label = $Label

func _process(delta: float) -> void:
	var h: int = GlobalTimer.h
	var m: int = GlobalTimer.m
	var cm: int = GlobalTimer.cm
	var cs: int = GlobalTimer.cs
	label.text = '%02d:%02d\n%02d:%02d' % [h, m, cm, cs]
