extends Control

@onready var recipe_slot_node : PackedScene = preload("res://Scenes/recipe_slot.tscn")

@export var recipes : Array[Recipe]

@export var recipe_countainer : VBoxContainer
