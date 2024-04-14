extends Node

@export var beholder_scene: PackedScene
@export var golem_scene: PackedScene

var springs = []
var golems = []

# Called when the node enters the scene tree for the first time.
func _ready():
	springs.append($DampedSpringJoint2D)
	golems.append($Golem)
	add_golem()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$DampedSpringJoint2D.position = $Player.position

	for n in range(springs.size()):
		if n == 0:
			springs[n].position = $Player.position
		else:
			springs[n].position = golems[n].position

	if $Player.velocity.length() > 0:
		$DampedSpringJoint2D.rotation_degrees = rad_to_deg(($Player.velocity * - 1).angle()) - 90

func add_golem():
	# make a new golem
	var golem = golem_scene.instantiate()

	# get springs length, should be 1 at the beginning and spring at position 0
	var springs_length = springs.size()

	# get golems length, should be 1 at the beginning and golem at position 0
	var golems_length = golems.size()

	# set golem position to the last golem position + 100
	golem.position = golems[golems_length - 1].position + Vector2(100, 0)
	add_child(golem)
	golems.append(golem)

	# make a new spring
	var spring = DampedSpringJoint2D.new()

	# set spring position to the last golem position
	spring.position = golems[golems_length - 1].position

	print(golems[golems_length - 1].position)
	# set spring node_a to the last golem
	spring.node_a = golems[golems_length - 1].get_path()

	# set spring node_b to the new golem
	spring.node_b = golems[golems_length].get_path()

	# add spring to the array
	springs.append(spring)
	
	add_child(spring)
