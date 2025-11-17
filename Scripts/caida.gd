extends Area2D


func _on_body_entered(body: Node2D):
	if body.get_name() == "Player":
		GameManager.decrease_lives()
		body.queue_free()
