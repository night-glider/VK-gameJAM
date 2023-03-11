extends KinematicBody

signal died

export var run_speed := 3.0
export var jump_force := 3.0
export var pick_jump_force = 6.0

onready var pickaxe = $"%pickaxe"
const pick_sound = preload("res://sounds/test_sound.ogg")


var mouse_delta := Vector2.ZERO
var velocity := Vector3.ZERO
var knockback := Vector3.ZERO
var snap := Vector3.DOWN
var input := Vector3.ZERO
var speed := run_speed
var pick_point := Vector3.ZERO
var has_pickaxe := true
var pickaxe_throwed := false
var stamina := 1.0


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

func apply_knockback(vel:Vector3):
	if current_state == "PICKED":
		restore_pickaxe()
		pickaxe.reset()
	knockback = vel

func remove_pickaxe():
	pickaxe.reparent(get_parent())
	
	has_pickaxe = false

func remove_pickaxe_obj(obj:Spatial):
	pickaxe.reparent(obj)
	
	has_pickaxe = false

func restore_pickaxe():
	pickaxe.reset()
	pickaxe.reparent($Camera)
	
	pickaxe.translation = Vector3(0.111, -0.088, -0.278)
	pickaxe.rotation = Vector3.ZERO
	
	has_pickaxe = true

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
	stamina = 1
	apply_gravity()
	if Input.is_action_pressed("jump"):
		velocity.y = jump_force
		snap = Vector3.ZERO

func run_state():
	stamina = 1
	var velocity_target = input * speed
	velocity.x = velocity_target.x
	velocity.z = velocity_target.z
	apply_gravity()
	if Input.is_action_pressed("jump"):
		velocity.y = jump_force
		snap = Vector3.ZERO

func in_air_state():
	apply_gravity()
	var velocity_target = input * speed
	velocity.x = lerp(velocity.x, velocity_target.x, 0.05)
	velocity.z = lerp(velocity.z, velocity_target.z, 0.05)
	
	if not has_pickaxe:
		return
	if stamina <= 0:
		return
	if Input.is_action_pressed("pick"):
		if $Camera/RayCast.is_colliding():
			pick_point = $Camera/RayCast.get_collision_point()
			var pick_object = $Camera/RayCast.get_collider()
			#remove_pickaxe()
			remove_pickaxe_obj(pick_object)
			pickaxe.pick_point(pick_point)
			current_state = "PICKED"
			Globals.play_sound(pick_sound)
			stamina -= 0.34

func slide_state():
	var current_direction = Vector3(velocity.x, 0, velocity.z).normalized()
	current_direction.x = lerp(current_direction.x, input.x, 0.02)
	current_direction.z = lerp(current_direction.z, input.z, 0.02)
	#velocity.x = lerp(velocity.x, velocity_target.x, 0.005)
	#velocity.z = lerp(velocity.z, velocity_target.z, 0.005)
	
	pickaxe.rotation_degrees.z = lerp(pickaxe.rotation_degrees.z, 30, 0.1)
	
	velocity = current_direction * (speed+1)
	apply_gravity()
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		snap = Vector3.ZERO
		velocity.y *= 0.8
		velocity.x *= 3
		velocity.z *= 3

func picked_state():
	#velocity = global_transform.origin.direction_to(pick_point)
	velocity = global_transform.origin.direction_to(pickaxe.global_transform.origin) * 2
	
	if Input.is_action_just_released("jump"):
		velocity = -$Camera.global_transform.basis.z * pick_jump_force
		current_state = "IN_AIR"
		restore_pickaxe()
		$Camera.translation = Vector3(0,0.25,0)
	
	if Input.is_action_pressed("jump"):
		$Camera.translation = lerp($Camera.translation, $Camera.transform.basis.z *0.25, 0.1)

func camera_animations():
	rotation_degrees.y -= mouse_delta.x * Globals.sensitivity * 0.02
	$Camera.rotation_degrees.x -= mouse_delta.y * Globals.sensitivity * 0.02
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
	
	if velocity.y < -3:
		$Camera.h_offset = lerp($Camera.h_offset,randf() * velocity.y * 0.002,0.5)
		$Camera.v_offset = lerp($Camera.v_offset,randf() * velocity.y * 0.002,0.5)
	else:
		$Camera.h_offset = lerp($Camera.h_offset, 0, 0.1)
		$Camera.v_offset = lerp($Camera.v_offset, 0, 0.1)
	
	if current_state != "PICKED" and has_pickaxe and Input.is_action_pressed("aim"):
		$Camera.fov = lerp($Camera.fov, 50, 0.05)
	else:
		if current_state == "SLIDE":
			$Camera.fov = lerp($Camera.fov, 85, 0.1)
		else:
			$Camera.fov = lerp($Camera.fov, 70, 0.1)
	
	mouse_delta = Vector2.ZERO

func gui_3D_process():
	if $Camera/RayCastGUI.is_colliding():
		var obj:Node = $Camera/RayCastGUI.get_collider()
		if obj.is_in_group("button3D"):
			obj.hovered = true
			if Input.is_action_just_pressed("pick"):
				obj.press()

func death_process():
	if global_transform.origin.y < -15:
		get_tree().reload_current_scene()

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pickaxe.owner_obj = self

func _physics_process(delta):
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
	if knockback != Vector3.ZERO:
		snap = Vector3.ZERO
		velocity += knockback
		knockback = Vector3.ZERO
	move_and_slide_with_snap(velocity, snap, Vector3.UP, true)

func _process(delta):
	$aim.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	camera_animations()
	gui_3D_process()
	death_process()
	
	if $Camera/RayCast.is_colliding():
		$aim.visible = true
	
	if pickaxe.state == pickaxe.THROW_AT_OBJECT:
		var dist = global_transform.origin.distance_to( pickaxe.global_transform.origin )
		if dist < 1:
			var knock = pickaxe.global_transform.origin.direction_to(global_transform.origin)
			apply_knockback(knock + Vector3.UP)
			restore_pickaxe()
			pickaxe.reset()
			has_pickaxe = true
			pickaxe_throwed = false
	
	if pickaxe_throwed:
		if Input.is_action_just_pressed("pick"):
			pickaxe.throw_at_owner()
	
	if current_state != "PICKED" and has_pickaxe:
		if Input.is_action_pressed("aim"):
			$aim.visible = true
			if Input.is_action_just_pressed("pick"):
				remove_pickaxe()
				pickaxe.throw_velocity(-$Camera.global_transform.basis.z*0.2)
				pickaxe_throwed = true
	
	
	$run_particles.emitting = current_state in ["RUN"]
	
	
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if current_state != "SLIDE":
		pickaxe.rotation_degrees.z = lerp(pickaxe.rotation_degrees.z, 0, 0.1)
	
	
	$stamina_bar.value = lerp($stamina_bar.value, stamina, 0.1)
	$Label.text = print_stats()


func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative
