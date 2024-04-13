extends CharacterBody2D

@export var speed = 400
var angular_speed = 100.0
@export var golem_scene: PackedScene

func _ready():
	$GolemsPath.rotation_degrees = 180
	add_golem()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

	var current_angle = $GolemsPath.rotation
	var delta_angle = rad_to_deg(velocity.rotated(deg_to_rad(180)).angle() - current_angle)

	if delta_angle > 180:
			delta_angle -= 360
	elif delta_angle < - 180:
			delta_angle += 360

	var direction = sign(delta_angle)

	var rotation_amount = angular_speed * delta * direction

	if (velocity.length() > 0):
		if abs(delta_angle) > 1.0:
			$GolemsPath.rotate(deg_to_rad(rotation_amount))

func add_golem():
	var golem = golem_scene.instantiate()

	var golem_location = $GolemsPath/GolemLocation
	golem_location.progress_ratio = 0.75
	golem_location.add_child(golem)