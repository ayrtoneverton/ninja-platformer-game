extends Node2D

onready var lifes = $Life/BG/Number
onready var boxes = $Box/BG/Number

func _process(delta):
	lifes.text = str(global.lifes)
	boxes.text = str(global.boxes)
