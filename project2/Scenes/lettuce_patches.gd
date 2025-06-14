extends Node2D

var player_in_area = false
var lettuceCount = 0
var inventory_canvas: Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# Update with your actual CanvasLayer path (copy from editor if unsure)
	inventory_canvas = get_node("../CanvasLayer")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("e"):
		lettuceCount += 1
		print("Lettuces picked:" + str(lettuceCount))
		
		if inventory_canvas:
			inventory_canvas.update_lettuce_count(lettuceCount)

func _on_lettuce_1_zone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true
		
func _on_lettuce_2_zone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

func _on_lettuce_1_zone_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		
func _on_lettuce_2_zone_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
