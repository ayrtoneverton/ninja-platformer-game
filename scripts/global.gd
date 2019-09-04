extends Node

var levels = ['Menu', 'Level1', 'Level2', 'Level3']
var level = 0
var lifes = 3
var isKilled = false
var boxes = 0

func init_game():
	level = 1
	lifes = 3
	isKilled = false
	boxes = 0
	show_level()

func killed():
	lifes -= 1
	isKilled = true
	if lifes:
		get_tree().reload_current_scene()
	else:
		show_menu()

func next_level():
	level += 1
	if len(levels) == level:
		show_menu()
	else:
		show_level()

func show_menu():
	get_tree().change_scene('res://scenes/%s.tscn' % levels[0])

func show_level():
	get_tree().change_scene('res://scenes/%s.tscn' % levels[level])

func up_box():
	boxes += 1
