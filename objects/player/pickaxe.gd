extends Spatial

var point_to_pick:Vector3
var throw_velocity:Vector3
var owner_obj:Spatial
var rotatation_speed:float
enum {
	DEFAULT,
	PICK_POINT,
	THROW_VELOCITY,
	THROW_AT_OBJECT,
}
var state = DEFAULT

func pick_point(pos:Vector3):
	point_to_pick = pos
	state = PICK_POINT

func throw_velocity(vel:Vector3):
	change_rotation(-0.25)
	throw_velocity = vel
	state = THROW_VELOCITY
	$Area.monitoring = true

func throw_at_owner():
	reset()
	change_rotation(0.25)
	state = THROW_AT_OBJECT

func change_rotation(rot:float):
	rotatation_speed = rot

func reset():
	rotatation_speed = 0
	$MeshInstance3.rotation_degrees = Vector3(0, 180, 0)
	state = DEFAULT
	$Area.set_deferred("monitoring", false)

func _process(delta):
	$MeshInstance3.rotate_x(rotatation_speed)
	
	if state == PICK_POINT:
		global_transform.origin = lerp(global_transform.origin, point_to_pick, 0.1)
	
	if state == THROW_VELOCITY:
		global_transform.origin += throw_velocity
	
	if state == THROW_AT_OBJECT:
		global_transform.origin = lerp(global_transform.origin, owner_obj.global_transform.origin, 0.075)
		


func _on_Area_body_entered(body:CollisionObject):
	if body.is_in_group("player"):
		return
	if body.is_in_group("hittable"):
		body.hit()
		throw_at_owner()
		return
	reset()
