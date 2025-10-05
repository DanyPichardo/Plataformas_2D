extends Camera2D

func _ready():
	top_level = true
	global_position.y = 130
	
func _process(delta: float):
	global_position.x = get_parent().global_position.x
