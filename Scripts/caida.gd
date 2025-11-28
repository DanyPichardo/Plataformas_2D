extends Area2D


func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		GameManager.decrease_lives()
		body.queue_free()
