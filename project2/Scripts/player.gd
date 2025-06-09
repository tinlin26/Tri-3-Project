extends CharacterBody2D

const speed = 100
var current_dir = "none";
var cut = false;
@onready var Walking = $Walking;

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		cut = false;
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		cut = false;
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		cut = false;
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		cut = false;
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_select"):
		cut = true;
		play_anim(2)
	else:
		cut = false;
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	 
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D2
	

	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
			if Walking.is_playing() == false:
				Walking.play()
		elif movement == 0:
			anim.play("side_idle")
		elif movement == 2:
			anim.play("side_cutting")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
			if Walking.is_playing() == false:
				Walking.play()
		elif movement == 0:
			anim.play("side_idle")
		elif movement == 2:
			anim.play("side_cutting")
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
			if Walking.is_playing() == false:
				Walking.play()
		elif movement == 0:
			anim.play("front_idle")
		elif movement == 2:
			anim.play("front_cutting")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
			if Walking.is_playing() == false:
				Walking.play()
		elif movement == 0:
			anim.play("back_idle")
		elif movement == 2:
			anim.play("back_cutting")
