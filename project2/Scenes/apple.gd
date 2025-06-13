extends Node2D

var player_in_area = false
var appleCount = 0
var inventory_canvas: Node = null

func _ready():
	# Update with your actual CanvasLayer path (copy from editor if unsure)
	inventory_canvas = get_node("../CanvasLayer")

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("e"):
		appleCount += 1
		print("Apples picked:" + str(appleCount))
		
		if inventory_canvas:
			inventory_canvas.update_apple_count(appleCount)

func _on_pickable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true



func _on_pickable_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
