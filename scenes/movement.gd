extends CharacterBody2D

@export var speed = 50  # pixels per second
@onready var sprite = $AnimatedSprite2D

var last_direction = ""

func _physics_process(_delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		sprite.play("walk_back")
		last_direction = "up"
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		sprite.play("walk_front")
		last_direction = "down"
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		sprite.play("walk_left")
		last_direction = "left"
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		sprite.play("walk_right")
		last_direction = "right"
	if direction == Vector2.ZERO:
		if last_direction == "up":
			sprite.play("idle_back")
		if last_direction == "down":
			sprite.play("idle_front")
		if last_direction == "left":
			sprite.play("idle_left")
		if last_direction == "right":
			sprite.play("idle_right")

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
