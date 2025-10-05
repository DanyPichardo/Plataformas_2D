extends Control

@onready var slider = $VBoxContainer/VolumeSlide
@onready var fs_checkbox = $VBoxContainer/Fullscreen
@onready var return_button = $VBoxContainer/Return
@onready var mainMenu = $"../ContainerMenu"

func _ready():
	slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	fs_checkbox.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	
func _on_volume_slide_value_changed(value: float):
	var db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db)
	
func _on_fullscreen_toggled(toggled_on: bool):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func _on_return_pressed():
	visible = false;
	
