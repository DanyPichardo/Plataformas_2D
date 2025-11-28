extends CharacterBody2D

var PLAYER_SPEED := 120
var PLAYER_DIRECCION := 0.0
var JUMP := 250
const GRAVITY := 9
var is_bouncing := false
var win_mode := false
var win_jump_timer := 0.0
var win_jump_interval := 0.6

func _physics_process(_delta: float) -> void:
	PLAYER_DIRECCION = Input.get_axis("move_left","move_right")
	velocity.x = PLAYER_DIRECCION * PLAYER_SPEED
	
	if PLAYER_DIRECCION != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
		
	$AnimatedSprite2D.flip_h = PLAYER_DIRECCION < 0 if PLAYER_DIRECCION != 0 else $AnimatedSprite2D.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= JUMP
	
	if !is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity.y += GRAVITY
		
	move_and_slide()
	
	if is_bouncing:
		return
	else:
		for i in range(get_slide_collision_count()):
			var collision = get_slide_collision(i)
			var collider = collision.get_collider()
			
			if collider.is_in_group("enemy"):
				var normal = collision.get_normal()
				
				if normal.y > -0.5:
					die()
					
	if win_mode:
		PLAYER_SPEED = 0
		win_jump_timer += _delta
		if win_jump_timer >= win_jump_interval:
			win_jump_timer = 0.0
			velocity.y = -JUMP

func die():
	GameManager.decrease_lives()
	queue_free()
		
func bounce():
	is_bouncing = true
	velocity.y = -200
	call_deferred("disable_bounce")

func disable_bounce():
	await get_tree().create_timer(0.2).timeout
	is_bouncing = false
	
func win_jump():
	win_mode = true
	velocity.y = -JUMP
