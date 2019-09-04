extends Area2D

func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		global.next_level()
