extends CanvasLayer

@onready var kiwi_label = $HBoxContainer/KiwisCount
@onready var lives_label = $HBoxContainer/LivesCount
@onready var win_label = $WinLabel
@onready var menu_button = $ExitButton

func _ready():
	GameManager.kiwi_count_changed.connect(update_kiwi_counter)
	GameManager.lives_changed.connect(update_lives_counter)
	GameManager.win_game.connect(win)
	
	update_lives_counter(GameManager.lives_count)
	update_kiwi_counter(GameManager.kiwi_count)

func win():
	win_label.visible = true
	menu_button.visible = true
	animate_win_label()
	get_tree().paused = true
	
func animate_win_label():
	var tween = create_tween()
	tween.set_loops()
	
	tween.tween_property(win_label, "scale", Vector2(1.4,1.4), 0.4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(win_label, "scale", Vector2(1,1), 0.4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
func update_kiwi_counter(new_count):
	kiwi_label.text = str(new_count)
	
func update_lives_counter(new_lives):
	print(new_lives)
	lives_label.text = str(new_lives)
	
func _on_exit_button_pressed() -> void:
	GameManager.lives_count = 3
	GameManager.kiwi_count = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	visible = false
	queue_free()
