extends CharacterBody2D

var color : int
@onready var scoreCounter = $"../Scores"
@onready var cursor = $"../Cursor"
@onready var sprite = $Sprite2D
var flying: bool = false
var fired: bool = false
var height:float = 0

func _ready() -> void:
	reset()

func _physics_process(delta: float) -> void:
	sprite.position.y = -height
	var target = position - cursor.mouseDir * 250
	if cursor.pulled and !cursor.dragging:
		velocity.y = -cursor.mouseDir.y * cursor.force * 3
		velocity.x = -cursor.mouseDir.x * cursor.force * 3
		cursor.pulled = false
		flying = true
	
	if flying:
		fired = true
		height = min(height + 30, 500)
		if height == 500:
			flying = false
	else:
		height = max(height - 30, 0)
	
	if fired and height == 0:
		reset()
	move_and_slide()
	
	if position.y < 0 or position.x < 0 or position.x > 1920:
		reset()

func _on_area_2d_area_entered(area: Area2D) -> void:
	print ("collided")
	if area.color == color:
		scoreCounter.score += 1
	reset()

func reset():
	randomize()
	color = randi() % 5
	position = Vector2(960,800)
	velocity = Vector2.ZERO
	height = 0
	flying = false
	fired = false
