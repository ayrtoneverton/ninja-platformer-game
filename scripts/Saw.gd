extends Sprite

func _process(delta):
	rotate(-5 * delta)

func _on_Saw_body_entered(body):
	if body.is_in_group("player"):
		global.killed()
