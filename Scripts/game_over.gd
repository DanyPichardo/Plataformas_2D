extends Control

func _ready() -> void:
	get_tree().paused = true
	$Button.pressed.connect(_on_restart_button_pressed)
	
func _on_restart_button_pressed():
	GameManager.lives = 3
	GameManager.kiwi_count = 0
	
	get_tree().paused = false
	
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/Nivel1.tscn")
	
