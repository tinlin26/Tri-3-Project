extends Node2D

var player_in_area = false
var veggieCount = 0
var inventory_canvas: Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# Update with your actual CanvasLayer path (copy from editor if unsure)
	inventory_canvas = get_node("../CanvasLayer")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("e"):
		veggieCount += 1
		print("Veggies picked:" + str(veggieCount))
		
		if inventory_canvas:
			inventory_canvas.update_veggie_count(veggieCount)

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
