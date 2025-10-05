extends Control

@onready var options_menu = $OptionsMenu
@onready var main_menu = $ContainerMenu

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Nivel1.tscn")
	
func _on_options_pressed():
	options_menu.visible = true
	main_menu.visible = false
	
func _on_exit_pressed():
	get_tree().quit()


func _on_return_pressed() -> void:
	main_menu.visible = true # Replace with function body.
