extends RigidBody2D

@export var projectile_scene: PackedScene

var speed = 100
var angular_speed = PI

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_shoot_timer_timeout():
	# shoot_projectile()
	$ShootTimer.start()
