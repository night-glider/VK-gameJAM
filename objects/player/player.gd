extends KinematicBody

onready var pickaxe = $"%pickaxe"

var mouse_delta := Vector2.ZERO

var run_speed := 3.0
var jump_force := 3.0
var pick_jump_force = 6.0

var velocity := Vector3.ZERO
var snap := Vector3.DOWN
var input := Vector3.ZERO
var speed := run_speed
var pick_point := Vector3.ZERO


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
	},
	"PICKED": {
		"func": "picked_state"
	}
}
var current_state := "IDLE"

func print_stats():
	var result = "Состояние: {0}\nСкорость: {1}\nНа полу: {2}"
	result = result.format([current_state, stepify(velocity.length(), 0.1), is_on_floor()])
	return result

func state_calculate():
	if current_state != "PICKED":
		current_state = "IDLE"
		if input.length_squared() != 0:
			current_state = "RUN"
		if not is_on_floor():
			current_state = "IN_AIR"
		if is_on_floor() and input.length_squared() != 0 and Input.is_action_pressed("crouch"):
			current_state = "SLIDE"

func apply_gravity():
	if is_on_floor():
		velocity.y = -0.1
	else:
		velocity.y -= 0.1

func idle_state():
	velocity.x = 0
	velocity.z = 0
	apply_gravity()
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		snap = Vector3.ZERO

func run_state():
	var velocity_target = input * speed
	velocity.x = velocity_target.x
	velocity.z = velocity_target.z
	apply_gravity()
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		snap = Vector3.ZERO


func in_air_state():
	apply_gravity()
	var velocity_target = input * speed
	velocity.x = lerp(velocity.x, velocity_target.x, 0.05)
	velocity.z = lerp(velocity.z, velocity_target.z, 0.05)
	
	if velocity.y < -3:
		$Camera.h_offset = lerp($Camera.h_offset,randf() * velocity.y * 0.002,0.5)
		$Camera.v_offset = lerp($Camera.v_offset,randf() * velocity.y * 0.002,0.5)
	else:
		$Camera.h_offset = 0
		$Camera.v_offset = 0
	
	if Input.is_action_just_pressed("pick"):
		if $Camera/RayCast.is_colliding():
			print($Camera/RayCast.get_collision_normal())
			pick_point = $Camera/RayCast.get_collision_point()
			print(pick_point)
			var prev_transform = pickaxe.global_transform
			$Camera.remove_child(pickaxe)
			get_parent().add_child(pickaxe)
			pickaxe.global_transform = prev_transform
			pickaxe.pick_point(pick_point)
			current_state = "PICKED"

func slide_state():
	var current_direction = Vector3(velocity.x, 0, velocity.z).normalized()
	current_direction.x = lerp(current_direction.x, input.x, 0.02)
	current_direction.z = lerp(current_direction.z, input.z, 0.02)
	#velocity.x = lerp(velocity.x, velocity_target.x, 0.005)
	#velocity.z = lerp(velocity.z, velocity_target.z, 0.005)
	
	velocity = current_direction * (speed+1)
	apply_gravity()
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		snap = Vector3.ZERO
		velocity.y *= 0.8
		velocity.x *= 3
		velocity.z *= 3

func picked_state():
	velocity = global_transform.origin.direction_to(pick_point)
	
	if Input.is_action_just_released("jump"):
		velocity = -$Camera.global_transform.basis.z * pick_jump_force
		current_state = "IN_AIR"
		var prev_transform = pickaxe.global_transform
		pickaxe.reset()
		pickaxe.get_parent().remove_child(pickaxe)
		$Camera.add_child(pickaxe)
		pickaxe.translation = Vector3(0.111, -0.128, -0.239)
		pickaxe.rotation = Vector3.ZERO
		$Camera.translation = Vector3(0,0.25,0)
	
	if Input.is_action_pressed("jump"):
		$Camera.translation = lerp($Camera.translation, $Camera.transform.basis.z *0.25, 0.1)
	

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#обнуление необходимых переменных
	snap = Vector3.DOWN
	input = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		input -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		input += transform.basis.z
	if Input.is_action_pressed("move_left"):
		input -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		input += transform.basis.x
	
	input = input.normalized()
	
	var prev_state = current_state
	#определение состояний
	state_calculate()
	
	if prev_state == "IN_AIR" and current_state in ["IDLE", "RUN"]:
		$jump_particles.emitting = true
	
	call(states[current_state]["func"])

	
	move_and_slide_with_snap(velocity, snap, Vector3.UP, true)

func _process(delta):
	if $Camera/RayCast.is_colliding():
		$aim.visible = true
	else:
		$aim.visible = false
	
	$run_particles.emitting = current_state in ["RUN"]
	
	if Input.is_action_just_pressed("restart"):
		translation = Vector3.ZERO
	
	
	rotation_degrees.y -= mouse_delta.x * 0.1
	$Camera.rotation_degrees.x -= mouse_delta.y * 0.1
	$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x, -90, 90)
	
	
	if current_state in ["RUN", "IN_AIR", "SLIDE"]:
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

