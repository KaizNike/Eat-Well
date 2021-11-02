extends KinematicBody

var vel := Vector3.ZERO
var speed = 250
var gravity = 150

func _physics_process(delta):
	var dir = get_dir()
	dir *= speed * delta
	dir.y -= gravity * delta
	move_and_slide(dir)
	
func get_dir() -> Vector3:
	return Vector3(
		Input.get_action_strength("move_up") - Input.get_action_strength("move_down"),
		0,
		-Input.get_action_strength("move_left") + Input.get_action_strength("move_right")
	)
