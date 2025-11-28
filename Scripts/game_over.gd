extends Control

func _ready() -> void:
	get_tree().paused = true

func _on_menu_button_pressed() -> void:
	GameManager.lives_count = 3
	GameManager.kiwi_count = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	visible = false
	queue_free()
	
func _on_restart_button_pressed() -> void:
	GameManager.lives_count = 3
	GameManager.kiwi_count = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Nivel1.tscn")
	queue_free()

func _on_exit_button_pressed() -> void:
	get_tree().quit()
