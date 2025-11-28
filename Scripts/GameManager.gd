extends Node

signal kiwi_count_changed(new_count)
signal lives_changed(new_lives)
signal win_game

var kiwi_count: int = 0
var lives_count: int = 3
var kiwi_goal: int = 10

func add_kiwi():
	kiwi_count += 1
	emit_signal("kiwi_count_changed", kiwi_count)
	if kiwi_count == kiwi_goal:
		emit_signal("win_game")
	
func decrease_lives():
	lives_count -= 1
	if lives_count == 0:
		get_tree().paused = true
		var game_over_scene = load("res://Scenes/game_over.tscn").instantiate()
		get_tree().root.call_deferred("add_child", game_over_scene)
	else:
		kiwi_count = 0
		emit_signal("kiwi_count_changed", kiwi_count)
		get_tree().call_deferred("reload_current_scene")
		
