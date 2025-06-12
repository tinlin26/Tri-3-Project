extends Node2D

var player_in_area = false
var appleCount = 0

func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			appleCount+=1
			print("Apples: " + str(appleCount))
		


func _on_pickable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true



func _on_pickable_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
