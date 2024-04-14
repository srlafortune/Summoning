extends Area2D

@export var projectile_scene: PackedScene

var speed = 100
var angular_speed = PI

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	rotation += angular_speed * delta

func shoot_projectile():
	var projectile = projectile_scene.instantiate()
	var velocity = Vector2(500.0, 0.0)
	projectile.linear_velocity = velocity

	add_child(projectile)

func _on_shoot_timer_timeout():
	# shoot_projectile()
	$ShootTimer.start()
