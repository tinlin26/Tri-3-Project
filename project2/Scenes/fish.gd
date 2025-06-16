extends AnimatableBody2D

@export var swim_speed := 0.5
var player_in_area = false
var fishCount = 0
var inventory_canvas: Node = null

func _ready():
	$AnimationPlayer.play("swim_loop")
	$AnimationPlayer.speed_scale = swim_speed
	inventory_canvas = get_node("../CanvasLayer")

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("space_pick"):
		fishCount += 1
		print("Fish caught: " + str(fishCount))
		
		if inventory_canvas:
			inventory_canvas.update_fish_count(fishCount)
		

func _on_fish_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true

func _on_fish_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
