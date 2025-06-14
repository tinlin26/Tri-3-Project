extends Sprite2D

@export var margin: Vector2 = Vector2(140, 60)  # Distance from top-right (X: right, Y: down)

func _ready():
	var screen_size = get_viewport().get_visible_rect().size
	position = Vector2(screen_size.x - margin.x, margin.y)
