extends Node2D

func _ready():
	var button = 'Resume'
	var title = 'Pause'
	if global.level == 0:
		title = 'Welcome'
		button = 'Start'
	elif global.lifes == 0:
		title = 'Game Over'
		button = 'Retry'
	elif len(global.levels) == global.level:
		title = 'Winner'
		button = 'Retry'

	$Title/BG/Text.text = title
	$Start/BG/Text.text = button


func _on_Start_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed():
		if global.level == 0:
			global.next_level()
		elif global.lifes == 0 || len(global.levels) == global.level:
			global.init_game()
		else:
			global.show_level()

func _on_Exit_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed():
		get_tree().quit()
