extends CanvasLayer

var kiwis = 0

func _ready():
	$CollectedText.text = var_to_str(kiwis)
	pass
