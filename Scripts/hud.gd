extends CanvasLayer

@onready var label = $HBoxContainer/Count

func _ready():
	GameManager.kiwi_count_changed.connect(update_counter)
	
func update_counter(new_count):
	label.text = str(new_count)
