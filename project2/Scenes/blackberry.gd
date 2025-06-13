extends Node2D

var player_in_area = false
var blackCount = 0

func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			blackCount+=1
			print("Blackberries: " + str(blackCount))
		


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
