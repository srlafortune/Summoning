extends CharacterBody2D

@export var speed = 400

func _ready():
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")

	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.animation = "right"
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.animation = "left"
	if Input.is_action_pressed("up"):
		$AnimatedSprite2D.animation = "up"
	if Input.is_action_pressed("down"):
		$AnimatedSprite2D.animation = "down"

	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()