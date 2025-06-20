extends CanvasLayer

@onready var strawberry_label = $InventoryPanel/InventoryBoxes5/Strawberry/StrawberryCountLabel
@onready var apple_label = $InventoryPanel/InventoryBoxes/Apple/AppleCountLabel
@onready var blueberry_label = $InventoryPanel/InventoryBoxes8/Blueberry/BlueberryCountLabel
@onready var blackberry_label = $InventoryPanel/InventoryBoxes7/Blackberry/BlackberryCountLabel
@onready var lemon_label = $InventoryPanel/InventoryBoxes4/Lemon/LemonCountLabel
@onready var peach_label = $InventoryPanel/InventoryBoxes6/Peach/PeachCountLabel
@onready var pie_label = $InventoryPanel/InventoryBoxes3/Pie/PieCountLabel
@onready var carrot_label = $InventoryPanel/InventoryBoxes2/Carrot/CarrotCountLabel
@onready var tomato_label = $InventoryPanel/InventoryBoxes9/Tomato/TomatoCountLabel
@onready var noodles_label = $InventoryPanel/InventoryBoxes10/Noodles/NoodlesCountLabel
@onready var fish_label = $InventoryPanel/InventoryBoxes11/Fish/FishCountLabel
@onready var potato_label = $InventoryPanel/InventoryBoxes12/Potato/PotatoCountLabel

var strawberry_count = 0
var apple_count = 0
var blueberry_count = 0
var blackberry_count = 0
var lemon_count = 0
var peach_count = 0
var pie_count = 0
var carrot_count = 0
var tomato_count = 0
var noodles_count = 0
var fish_count = 0
var potato_count = 0

func _ready():
	print("InventoryCanvas is ready.")

func update_strawberry_count(new_count: int):
	strawberry_count = new_count
	strawberry_label.text = str(strawberry_count)

func update_apple_count(new_count: int):
	apple_count = new_count
	apple_label.text = str(apple_count)

func update_blueberry_count(new_count: int):
	blueberry_count = new_count
	blueberry_label.text = str(blueberry_count)

func update_blackberry_count(new_count: int):
	blackberry_count = new_count
	blackberry_label.text = str(blackberry_count)

func update_lemon_count(new_count: int):
	lemon_count = new_count
	lemon_label.text = str(lemon_count)

func update_peach_count(new_count: int):
	peach_count = new_count
	peach_label.text = str(peach_count)
	
func update_pie_count(new_count: int):
	pie_count = new_count
	pie_label.text = str(pie_count)
	
func update_carrot_count(new_count: int):
	carrot_count = new_count
	carrot_label.text = str(carrot_count)
	
func update_tomato_count(new_count: int):
	tomato_count = new_count
	tomato_label.text = str(tomato_count)
	
func update_noodles_count(new_count: int):
	noodles_count = new_count
	noodles_label.text = str(noodles_count)
	
func update_fish_count(new_count: int):
	fish_count = new_count
	fish_label.text = str(fish_count)

func update_potato_count(new_count: int):
	potato_count = new_count
	potato_label.text = str(potato_count)
