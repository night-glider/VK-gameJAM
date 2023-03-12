extends StaticBody
const particles = preload("res://objects/particles/enemy_explosion.tscn")
const explosion = preload("res://objects/turret_explosion.tscn")
var track_object:Spatial
var track_distance:int = 1000
var track_pos := Vector3.ZERO

var obj_visible := false

func init(obj):
	track_object = obj

func is_obj_visible():
	if track_object == null:
		return false
	
	if not global_transform.origin.distance_squared_to(track_object.global_transform.origin) < track_distance:
		return false
	
	$RayHolder.look_at(track_object.global_transform.origin, Vector3.UP)
	$RayHolder/RayCast.force_raycast_update()
	var collider = $RayHolder/RayCast.get_collider()
	if collider == null:
		return false
	if collider != track_object:
		return false
	
	$head/pointer.visible = true
	$head/pointer.scale.z = global_translation.distance_to( track_object.global_translation ) + 10

	track_pos = lerp(track_pos, track_object.global_translation + Vector3(0,0.25,0), 0.025)
	
	$head.look_at( track_pos, Vector3.UP )
	return true

func _ready():
	track_pos = global_translation + Vector3(0,0,-1)

func _process(delta):
	$head/pointer.visible = false
	obj_visible = is_obj_visible()
	if obj_visible == false:
		$Timer.stop()
		return
	if $Timer.is_stopped():
		$Timer.start()
	

func hit():
	Globals.spawn_particles(global_translation, particles, 1)
	queue_free()

func _on_Timer_timeout():
	if not obj_visible:
		return
	$head/pointer/RayCast.force_raycast_update()
	if not $head/pointer/RayCast.is_colliding():
		return
	var new_explosion = explosion.instance()
	get_parent().add_child(new_explosion)
	new_explosion.global_translation = $head/pointer/RayCast.get_collision_point()
	$AudioStreamPlayer3D.play()
	if new_explosion.global_translation.distance_to(track_object.global_translation) > 2:
		return
	var vel = global_translation.direction_to(track_object.global_translation)
	vel *= 20
	vel.y = 5
	track_object.apply_knockback(vel)
