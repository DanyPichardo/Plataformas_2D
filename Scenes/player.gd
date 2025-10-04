extends CharacterBody2D

var PLAYER_SPEED := 120
var PLAYER_DIRECCION := 0.0
var JUMP := 250
const GRAVITY := 9

func _physics_process(delta: float) -> void:
	PLAYER_DIRECCION = Input.get_axis("ui_left","ui_right")
	velocity.x = PLAYER_DIRECCION * PLAYER_SPEED
	
	if PLAYER_DIRECCION != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
		
	$AnimatedSprite2D.flip_h = PLAYER_DIRECCION < 0 if PLAYER_DIRECCION != 0 else $AnimatedSprite2D.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= JUMP
	
	if !is_on_floor():
		velocity.y += GRAVITY
	move_and_slide()
	
