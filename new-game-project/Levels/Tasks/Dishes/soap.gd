extends Node2D

@onready var scoreCounter = $"../../Scores"

var clickPos: Array= []
var drawMask: Image
var drawTexture: ImageTexture
const areaCentre = Vector2(960, 625)
const areaRadius = 400
const resolution = 256
var localPos

func _ready() -> void:
	drawMask = Image.create(resolution, resolution, false, Image.FORMAT_L8)
	drawMask.fill(Color.BLACK)
	drawTexture = ImageTexture.create_from_image(drawMask)

func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		localPos = get_global_mouse_position() - areaCentre
		if localPos.length() < areaRadius:
			clickPos.append(localPos)
			paint_to_mask(localPos)
			queue_redraw()
	elif Input.is_action_just_pressed("ui_accept"):
		var filled = is_area_filled()
		if filled:
			clickPos.clear()
			scoreCounter.score += 1
			drawMask.fill(Color.BLACK)
			drawTexture.update(drawMask)
			filled = false
			queue_redraw()

func paint_to_mask(local_pos: Vector2):
	var img = drawMask
	
	var centre = (localPos / areaRadius) * (resolution / 2.0) + Vector2(resolution/2, resolution/2)
	var radius = int(50.0 / areaRadius * (resolution / 2.0))
	
	for y in range(centre.y - radius, centre.y + radius):
		for x in range(centre.x - radius, centre.x + radius):
			var pos = Vector2(x, y)
			if pos.distance_to(centre) < radius and x >= 0 and y >= 0 and x < resolution and y < resolution:
				img.set_pixel(x, y, Color(1,1,1))
	
	drawTexture.set_image(img)

func is_area_filled(threshold_percent := 0.9) -> bool:
	var img = drawMask
	var white_pixel_count = 0
	var total_pixels = 0

	for y in resolution:
		for x in resolution:
			var px = Vector2(x - resolution/2, y - resolution/2)
			if px.length() < resolution/2:  # Inside the circle area
				total_pixels += 1
				if img.get_pixel(x, y).r > 0.5:
					white_pixel_count += 1
	
	return white_pixel_count / float(total_pixels) >= threshold_percent	

func _draw() -> void:
	for point in clickPos:
		draw_circle(point, 50, Color.WHITE, true)
