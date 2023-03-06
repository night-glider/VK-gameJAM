extends KinematicBody

var mouse_delta := Vector2.ZERO

var run_speed := 3.0

var velocity := Vector3.ZERO
var snap := Vector3.DOWN
var input := Vector3.ZERO
var speed := run_speed

var states := {
	"IDLE" : {
		"func" : "idle_state"
	},
	"RUN" : {
		"func" : "run_state"
	},
	"IN_AIR": {
		"func" : "in_air_state"
	},
	"SLIDE": {
		"func": "slide_state"
	}
}
var current_state := "IDLE"

func print_stats():
	var result = "Состояние: {0}\nСкорость: {1}\nНа полу: {2}"
	result = result.format([current_state, speed, is_on_floor()])
	return result

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#обнуление необходимых переменных
	snap = Vector3.DOWN
	input = Vector3.ZERO
	velocity.x = 0
	velocity.z = 0
	
	if Input.is_action_pressed("move_forward"):
		input -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		input += transform.basis.z
	if Input.is_action_pressed("move_left"):
		input -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		input += transform.basis.x
	
	input = input.normalized()
	
	if is_on_floor():
		velocity.y = -0.1
	else:
		velocity.y -= 0.1
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = 5
		snap = Vector3.ZERO
	
	#определение состояний
	current_state = "IDLE"
	if input.length_squared() != 0:
		current_state = "RUN"
	if not is_on_floor():
		current_state = "IN_AIR"
	if is_on_floor() and input.length_squared() != 0 and Input.is_action_pressed("crouch"):
		current_state = "SLIDE"
	
	
	velocity += input * speed
	
	move_and_slide_with_snap(velocity, snap, Vector3.UP, true)

func _process(delta):
	$Particles.emitting = current_state == "RUN"
	
	if Input.is_action_just_pressed("restart"):
		translation = Vector3.ZERO
	
	rotation_degrees.y -= mouse_delta.x * 0.1
	$Camera.rotation_degrees.x -= mouse_delta.y * 0.1
	$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x, -90, 90)
	
	
	if current_state in ["RUN", "IN_AIR"]:
		$Camera.rotation_degrees.z = lerp($Camera.rotation_degrees.z, mouse_delta.x * 0.1, 0.1) 
	else:
		$Camera.rotation_degrees.z = lerp($Camera.rotation_degrees.z, 0, 0.1)
	
	if current_state == "SLIDE":
		$Camera.translation.y = lerp($Camera.translation.y, -0.25, 0.1)
		$Camera.rotation_degrees.z = lerp($Camera.rotation_degrees.z, -10, 0.1)
	else:
		$Camera.translation.y = lerp($Camera.translation.y, 0.25, 0.1)
		$Camera.rotation_degrees.z = lerp($Camera.rotation_degrees.z, 0, 0.1)
	
	$Label.text = print_stats()
	
	mouse_delta = Vector2.ZERO

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative

