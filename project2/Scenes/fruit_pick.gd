extends Node2D

var player_in_lemonarea = false
var player_in_blackarea = false
var lemonCount = 0
var blackCount = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if player_in_blackarea == true:
			blackCount += 1
			print("Black: " + str(blackCount))	
		elif player_in_lemonarea == true:
			lemonCount += 1
			print("Lemon: " + str(lemonCount))
			
			#player_in_blackarea = false	
	
#func _on_pickable_area_body_exited(body: Node2D) -> void:
	#if body.has_method("player"):
		#player_in_area = false # Replace with function body.

func _on_collision_shape_2d_tree_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method1")
		player_in_blackarea = true # Replace with function body.

func _on_collision_shape_2d_2_tree_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method2")
		player_in_lemonarea = true
	#if body.has_method("player"):
		#player_in_lemonarea = true
	#lemonCount += 1
	#print(lemonCount)

func _on_collision_shape_2d_3_tree_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method3")
		player_in_lemonarea = true
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.

func _on_collision_shape_2d_4_tree_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method4")
		player_in_lemonarea = true
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.

#
#func _on_lemon_pickable_area_tree_entered() -> void:
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.


func _on_collision_shape_2d_tree_exited(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method5")
		player_in_blackarea = false # Replace with function body.

func _on_collision_shape_2d_2_tree_exited(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method6")
		player_in_lemonarea = false # Replace with function body.
	
func _on_collision_shape_2d_3_tree_exited(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method7")
		player_in_lemonarea = false # Replace with function body.

func _on_collision_shape_2d_4_tree_exited(body: Node2D) -> void:
	if body.has_method("player"):
		print("Method8")
		player_in_lemonarea = true # Replace with function body.
