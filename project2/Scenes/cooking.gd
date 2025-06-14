extends Node

# Inventory (you can change these amounts)
var lemons = 0
var peaches = 0
var lemon_tracker
var peach_tracker
var player_in_area = false

# Crafting recipe requirement
const LEMONS_REQUIRED = 2
const PEACHES_REQUIRED = 2

var keys_pressed := []
var crafted := false
var inventory_canvas: Node = null
var pieCount = 0

func _on_cookable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true


func _on_cookable_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		crafted = false



func _ready():
	inventory_canvas = get_node("../CanvasLayer")
	lemon_tracker = get_node("/root/World/lemon")
	peach_tracker = get_node("/root/World/peach")
	print("Lemons available at start: ", lemon_tracker.lemonCount)
	print("Peaches available at start: ", peach_tracker.peachCount)

func update_lemons():
	lemons = lemon_tracker.lemonCount
	peaches = peach_tracker.peachCount
	print("Lemons available: ", lemons)
	print("Peaches available: ", peaches)
	
func _process(delta):
	#lemons = lemon_tracker.lemonCount
	#peaches = peach_tracker.peachCount
	if Input.is_key_pressed(KEY_P) and "P" not in keys_pressed:
		keys_pressed.append("P")
		
	if Input.is_key_pressed(KEY_L) and "L" not in keys_pressed:
		keys_pressed.append("L")
	
	# Craft only if enough resources and not already crafted
	if player_in_area:
		if "P" in keys_pressed and "L" in keys_pressed and not crafted:
			if can_make_lemon_peach_pie():
				make_lemon_peach_pie()
				crafted = true
			else:
				print("Not enough ingredients!")
				crafted = true  # prevent multiple crafts


	# Reset when keys are released
	if not Input.is_key_pressed(KEY_P) and "P" in keys_pressed:
		keys_pressed.erase("P")
		
	if not Input.is_key_pressed(KEY_L) and "L" in keys_pressed:
		keys_pressed.erase("L")
		
	# Reset crafted flag
	if "P" not in keys_pressed and "L" not in keys_pressed:
		crafted = false

func can_make_lemon_peach_pie() -> bool:
	return lemon_tracker.lemonCount >= LEMONS_REQUIRED and peach_tracker.peachCount >= PEACHES_REQUIRED

func make_lemon_peach_pie():
	lemon_tracker.lemonCount -= LEMONS_REQUIRED
	peach_tracker.peachCount -= PEACHES_REQUIRED
	pieCount += 1
	print("Lemon Peach Pie Created!")
	print("Remaining: %d lemons, %d peaches" % [lemon_tracker.lemonCount, peach_tracker.peachCount])
	
	inventory_canvas.update_lemon_count(lemon_tracker.lemonCount)
	inventory_canvas.update_peach_count(peach_tracker.peachCount)
	inventory_canvas.update_pie_count(pieCount)



	


#func _on_pickable_area_2_body_entered(body: Node2D) -> void:
	#if body.has_method("player"):
		#player_in_area = true # Replace with function body.
#
#
#func _on_pickable_area_2_body_exited(body: Node2D) -> void:
	#if body.has_method("player"):
		#player_in_area = false # Replace with function body.
