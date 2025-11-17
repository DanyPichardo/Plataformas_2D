extends Node

signal kiwi_count_changed(new_count)
signal lives_changed(new_lives)

var kiwi_count: int = 0
var lives_count: int = 3
	
func add_kiwi():
	kiwi_count += 1
	emit_signal("kiwi_count_changed", kiwi_count)
	
func decrease_lives():
	lives_count -= 1
	if lives_count <= 0:
		get_tree().paused = true
		var game_over_scene = load("res://Scenes/game_over.tscn").instantiate()
		get_tree().root.add_child(game_over_scene)
	else:
		kiwi_count = 0
		emit_signal("kiwi_count_changed", kiwi_count)
		emit_signal("lives_changed", lives_count)
		get_tree().reload_current_scene()
