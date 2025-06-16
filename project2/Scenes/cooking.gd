extends Node

# Inventory (you can change these amounts)
var lemons = 0
var peaches = 0
var tomatoes = 0
var carrots = 0
var lemon_tracker
var peach_tracker
var tomato_tracker
var carrot_tracker
var noodlesCount = 0
var player_in_area = false
var menu_shown = false

#Ingredients for each Recipe 
const LEMONS_REQUIRED = 2
const PEACHES_REQUIRED = 2
const NOODLES_TOMATOES_REQUIRED = 1
const NOODLES_CARROTS_REQUIRED = 3

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
	tomato_tracker = get_node("/root/World/Tomato_patch")
	carrot_tracker = get_node("/root/World/Carrot_patch")
	print("Lemons available at start: ", lemon_tracker.lemonCount)
	print("Peaches available at start: ", peach_tracker.peachCount)
	print("Tomatoes available at start: ", tomato_tracker.tomatoCount)
	print("Carrots available at start: ", carrot_tracker.carrotCount)

func update_ingredients():
	lemons = lemon_tracker.lemonCount
	peaches = peach_tracker.peachCount
	tomatoes = tomato_tracker.tomatoCount
	carrots = carrot_tracker.carrotCount
	print("Lemons available: ", lemons)
	print("Peaches available: ", peaches)
	print("Tomatoes available: ", tomatoes)
	print("Carrots available: ", carrots)
	
func _process(delta):
	if Input.is_key_pressed(KEY_P) and KEY_P not in keys_pressed:
		keys_pressed.append(KEY_P)
	if Input.is_key_pressed(KEY_L) and KEY_L not in keys_pressed:
		keys_pressed.append(KEY_L)
	if Input.is_key_pressed(KEY_T) and KEY_T not in keys_pressed:
		keys_pressed.append(KEY_T)
	if Input.is_key_pressed(KEY_C) and KEY_C not in keys_pressed:
		keys_pressed.append(KEY_C)
	if Input.is_key_pressed(KEY_M) and KEY_M not in keys_pressed:
		keys_pressed.append(KEY_M)

	if player_in_area and KEY_M in keys_pressed and not menu_shown:
		menu_shown = true
		$"../Menuscreen".show()
	elif player_in_area and KEY_M in keys_pressed and menu_shown:
		menu_shown = false
		$"../Menuscreen".hide()

	# Craft pie
	if player_in_area and KEY_P in keys_pressed and KEY_L in keys_pressed and not crafted:
		if can_make_lemon_peach_pie():
			make_lemon_peach_pie()
		else:
			print("Not enough ingredients for pie!")
		crafted = true

	# Craft noodles
	if player_in_area and KEY_T in keys_pressed and KEY_C in keys_pressed and not crafted:
		if can_make_noodles():
			make_noodles()
		else:
			print("Not enough ingredients for soup!")
		crafted = true

	# Remove released keys
	for key in [KEY_P, KEY_L, KEY_T, KEY_C, KEY_M]:
		if not Input.is_key_pressed(key):
			keys_pressed.erase(key)

	# Allow crafting again if no keys are being held
	if keys_pressed.size() == 0:
		crafted = false

func can_make_lemon_peach_pie() -> bool:
	return lemon_tracker.lemonCount >= LEMONS_REQUIRED and peach_tracker.peachCount >= PEACHES_REQUIRED

func can_make_noodles() -> bool:
	return tomato_tracker.tomatoCount >= NOODLES_TOMATOES_REQUIRED and carrot_tracker.carrotCount >= NOODLES_CARROTS_REQUIRED

func make_lemon_peach_pie():
	lemon_tracker.lemonCount -= LEMONS_REQUIRED
	peach_tracker.peachCount -= PEACHES_REQUIRED
	pieCount += 1
	print("Lemon Peach Pie Created!")
	print("Remaining: %d lemons, %d peaches" % [lemon_tracker.lemonCount, peach_tracker.peachCount])
	
	inventory_canvas.update_lemon_count(lemon_tracker.lemonCount)
	inventory_canvas.update_peach_count(peach_tracker.peachCount)
	inventory_canvas.update_pie_count(pieCount)
	
func make_noodles():
	tomato_tracker.tomatoCount -= NOODLES_TOMATOES_REQUIRED
	carrot_tracker.carrotCount -= NOODLES_CARROTS_REQUIRED
	noodlesCount += 1
	print("🥣 Noodles crafted!")
	print("Remaining: %d tomatoes, %d carrots" % [tomato_tracker.tomatoCount, carrot_tracker.carrotCount])
	
	inventory_canvas.update_tomato_count(tomato_tracker.tomatoCount)
	inventory_canvas.update_carrot_count(carrot_tracker.carrotCount)
	inventory_canvas.update_noodles_count(noodlesCount)
