extends Node2D

#var player_in_lemonarea = false
#var player_in_blackarea = false
var lemon_overlap_count = 0
var black_overlap_count = 0
var lemonCount = 0
var blackCount = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if lemon_overlap_count > 0:
			lemonCount += 1
			print("Lemon: " + str(lemonCount))
		elif black_overlap_count > 0:
			blackCount += 1
			print("Black: " + str(blackCount))	
			#player_in_blackarea = false	
	
#func _on_pickable_area_body_exited(body: Node2D) -> void:
	#if body.has_method("player"):
		#player_in_area = false # Replace with function body.

func _on_collision_shape_2d_tree_entered() -> void:
	black_overlap_count += 1 # Replace with function body.

func _on_collision_shape_2d_2_tree_entered(body: Node2D) -> void:
	lemon_overlap_count += 1
	#if body.has_method("player"):
		#player_in_lemonarea = true
	#lemonCount += 1
	#print(lemonCount)

func _on_collision_shape_2d_3_tree_entered() -> void:
	lemon_overlap_count += 1
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.

func _on_collision_shape_2d_4_tree_entered() -> void:
	lemon_overlap_count += 1
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.

#
#func _on_lemon_pickable_area_tree_entered() -> void:
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.


func _on_collision_shape_2d_tree_exited(body: Node2D) -> void:
	black_overlap_count -= 1 # Replace with function body.

func _on_collision_shape_2d_2_tree_exited() -> void:
	lemon_overlap_count -= 1 # Replace with function body.
	
func _on_collision_shape_2d_3_tree_exited() -> void:
	lemon_overlap_count -= 1 # Replace with function body.

func _on_collision_shape_2d_4_tree_exited() -> void:
	lemon_overlap_count -= 1 # Replace with function body.
