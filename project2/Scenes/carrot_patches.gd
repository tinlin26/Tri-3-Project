extends Node2D

var player_in_area = false
var carrotCount = 0
var inventory_canvas: Node = null

func _ready():
	inventory_canvas = get_node("../CanvasLayer")
	
	
func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("space_pick"):
		if randf_range(-10.0,10.0) < -5.0:
			carrotCount += 1
			print("Carrots picked:" + str(carrotCount))
		
		if inventory_canvas:
			inventory_canvas.update_carrot_count(carrotCount)

func _on_patch_1_zone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

func _on_patch_2_zone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true
		
func _on_patch_3_zone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

func _on_patch_1_zone_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		
func _on_patch_2_zone_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func _on_patch_3_zone_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
