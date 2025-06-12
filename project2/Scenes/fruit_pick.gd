extends Node2D

var player_in_area = false
var lemonCount = 0

func _process(delta):
	pass
	#if player_in_area:
		#if Input.is_action_just_pressed("ui_select"):
			#count += 1
			#print(count)
			

#func _on_lemon_treeentered(body: Node2D) -> void:
	#pass
#
#
#func _on_pickable_area_body_exited(body: Node2D) -> void:
	#if body.has_method("player"):
		#player_in_area = false # Replace with function body.

#func _on_collision_shape_2d_2_tree_entered() -> void:
	#lemonCount += 1
	#print(lemonCount)
#
#func _on_collision_shape_2d_3_tree_entered() -> void:
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.
#
#func _on_collision_shape_2d_4_tree_entered() -> void:
	#lemonCount += 1
	#print(lemonCount) # Replace with function body.


func _on_lemon_pickable_area_tree_entered() -> void:
	lemonCount += 1
	print(lemonCount) # Replace with function body.
