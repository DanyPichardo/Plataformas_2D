extends Area2D

signal kiwiCollected

func _on_body_entered(body: Node2D):
	if body.get_name() == "Player":
		emit_signal("kiwiCollected")
		queue_free()
