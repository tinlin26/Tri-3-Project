extends Node2D

var strawCount = 0
var player_in_area = false
var inventory_canvas: Node = null

func _ready():
	# Update with your actual CanvasLayer path (copy from editor if unsure)
	inventory_canvas = get_node("../CanvasLayer")

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("e"):
		strawCount += 1
		print("Strawberries picked:", strawCount)
		
		if inventory_canvas:
			inventory_canvas.update_strawberry_count(strawCount)

func _on_pickable_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true

func _on_pickable_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
