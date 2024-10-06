extends CharacterBody2D


@export var speed: float = 200
@export var attack_duration: float = 0.5  
@export var knowckbackPower: int = 1500

var direction: Vector2 = Vector2()
var is_attacking: bool = false
var attack_timer: float = 0.0



@onready var animated_sprite = $AnimatedSprite2D

func read_input():
	if is_attacking:
		return  

	velocity = Vector2()

	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
	elif Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)

	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
		animated_sprite.flip_h = true  
	elif Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1, 0)
		animated_sprite.flip_h = false  

	if velocity != Vector2():
		velocity = velocity.normalized() * speed
		animated_sprite.play("run")  
	else:
		animated_sprite.play("idle")  

func handle_attack(delta):
	if is_attacking:
		attack_timer -= delta  

		if attack_timer <= 0.0:
			is_attacking = false  
			animated_sprite.play("idle")  
		return

	if Input.is_action_just_pressed("attack"):
		is_attacking = true  
		attack_timer = attack_duration  
		animated_sprite.play("attack") 
		velocity = Vector2()  

func knockback(enemyVelocity: Vector2):
	var knockbackDirection = (enemyVelocity - velocity).normalized() * knowckbackPower
	velocity = knockbackDirection
	move_and_slide()

func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.name == "hitBox":
		knockback(area.get_parent().velocity)
		print_debug(area.get_parent().name)
		
func _physics_process(delta: float):
	handle_attack(delta)  

	if not is_attacking:
		read_input()  

	move_and_slide()
