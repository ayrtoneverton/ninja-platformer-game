extends Area2D

func _on_Box_body_entered(body):
	if body.is_in_group("player"):
		global.up_box()
		self.queue_free()
