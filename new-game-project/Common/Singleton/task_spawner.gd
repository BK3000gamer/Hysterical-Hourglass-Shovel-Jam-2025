extends Node

var ComputerDesktopCompleted: bool = false
var DishesCompleted: bool = false
var FoldClothesCompleted: bool = false
var HolyWaterCompleted: bool = false
var IndoorObeliskCompleted: bool = false
var PictureFrameCompleted: bool = false
var TrashCompleted: bool = false
var WalkLizardCompleted: bool = false
var Completed: bool = false

func _process(delta: float) -> void:
	if ComputerDesktopCompleted and DishesCompleted and FoldClothesCompleted and HolyWaterCompleted and IndoorObeliskCompleted and PictureFrameCompleted and TrashCompleted and WalkLizardCompleted:
		Completed = true
