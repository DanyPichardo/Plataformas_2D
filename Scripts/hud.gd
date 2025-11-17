extends CanvasLayer

@onready var kiwi_label = $HBoxContainer/KiwisCount
@onready var lives_label = $HBoxContainer/LivesCount

func _ready():
	GameManager.kiwi_count_changed.connect(update_kiwi_counter)
	GameManager.lives_changed.connect(update_lives_counter)
	
func update_kiwi_counter(new_count):
	kiwi_label.text = str(new_count)
	
func update_lives_counter(new_lives):
	print(new_lives)
	lives_label.text = str(new_lives)
