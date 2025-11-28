extends Control

@onready var main_menu = $ContainerMenu

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Nivel1.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
