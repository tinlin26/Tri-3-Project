extends Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = preload("res://Art/sprites/background/Screenshot 2025-06-15 at 10.18.12 PM.png")
	$"../CanvasLayer".hide()
		
func _process(delta):
	if Input.is_action_pressed("ui_select"):
		self.texture = null
		$"../CanvasLayer".show()
