extends Node

signal kiwi_count_changed(new_count)
signal lives_chanes
var kiwi_count: int = 0

func add_kiwi():
	kiwi_count += 1
	emit_signal("kiwi_count_changed", kiwi_count)
	
