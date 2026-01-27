extends CharacterBody2D

var speed := 300
var jump_force := -4000
var gravity := 10000


func _physics_process(delta: float) -> void:
	
	velocity = Vector2.ZERO
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	velocity.x *= speed
	
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = jump_force
	
	move_and_slide()
