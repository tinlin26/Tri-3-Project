extends Node2D

var player_in_area = false
var lemonCount = 0
var inventory_canvas: Node = null

func _ready():
	# Update with your actual CanvasLayer path (copy from editor if unsure)
	inventory_canvas = get_node("../CanvasLayer")
	print("My path is: ", get_path())

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("e"):
		lemonCount += 1
		print("Lemons picked:" + str(lemonCount))
		
		if inventory_canvas:
			inventory_canvas.update_lemon_count(lemonCount)

func _on_pickable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true



func _on_pickable_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false


#func _on_pickable_area_2_body_entered(body: Node2D) -> void:
	#if body.has_method("player"):
		#player_in_area = true # Replace with function body.
#
#
#func _on_pickable_area_2_body_exited(body: Node2D) -> void:
	#if body.has_method("player"):
		#player_in_area = false # Replace with function body.
