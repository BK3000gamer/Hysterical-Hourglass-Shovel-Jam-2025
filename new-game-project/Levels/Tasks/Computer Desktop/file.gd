extends CharacterBody2D

const tileSize: Vector2 = Vector2(96, 96)
var seed: Vector2
var tween: Tween
@onready var scoreCounter = $"../Scores"

func _ready() -> void:
	reset()
	

func _physics_process(delta: float) -> void:
	if !tween or !tween.is_running():
		if Input.is_action_pressed("up") and !$up.is_colliding():
			_move(Vector2(0, -1))
		elif Input.is_action_pressed("down") and !$down.is_colliding():
			_move(Vector2(0, 1))
		elif Input.is_action_pressed("left") and !$left.is_colliding():
			_move(Vector2(-1, 0))
		elif Input.is_action_pressed("right") and !$right.is_colliding():
			_move(Vector2(1, 0))

func _move(dir: Vector2):
	global_position += dir * tileSize
	$Sprite2D.global_position -= dir * tileSize
	
	if tween:
		tween.kill()
	
	tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property($Sprite2D, "global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)

func reset():
	randomize()
	seed.x = randi() % (13 - (7 - 1)) + 7
	seed.y = randi() % (8 - (3 - 1)) + 3
	global_position = seed * 96 + Vector2(48, 48)
	if tween:
		tween.kill()
	$Sprite2D.global_position = global_position
