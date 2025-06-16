extends Node2D

var player_in_area = false
var potatoCount = 0
var inventory_canvas: Node = null

func _ready():
	inventory_canvas = get_node("../CanvasLayer")
	
	
func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("space_pick"):
		potatoCount += 1
		print("Potatoes picked:" + str(potatoCount))
		
		if inventory_canvas:
			inventory_canvas.update_potato_count(potatoCount)

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
