extends CharacterBody2D

var is_dead = false

@export var speed := 50
@export var activation_distance := 400

var direction := -1
var active := false

func _ready():
	$HitboxTop.body_entered.connect(_on_top_hit)

func _physics_process(delta):
	if not active:
		var player = get_tree().get_first_node_in_group("Player")
		if player and player.global_position.distance_to(global_position) < activation_distance:
			active = true
		if not active:
			return
	
	if is_dead:
		return
		
	velocity.x = direction * speed
	move_and_slide()
	
	if direction == -1 and $Wall_Left.is_colliding():
		direction = 1
		$AnimatedSprite2D.flip_h = false
	elif direction == 1 and $Wall_Right.is_colliding():
		direction = -1
		$AnimatedSprite2D.flip_h = true

func _on_top_hit(body):
	print("Detectado arriba: ", body)
	if is_dead:
		return
		
	if body.is_in_group("Player"):
		die()
		body.bounce()
		
func die():
	is_dead = true
	queue_free()
