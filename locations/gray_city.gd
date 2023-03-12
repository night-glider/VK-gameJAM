extends Spatial


onready var point_cast := $PointCast 
var bounding_box:AABB
onready var player_obj := $player
var boss_path:Array

func _ready():
	bounding_box = $city.get_aabb()
	for point in $boss_path.get_children():
		boss_path.append(point.global_translation + Vector3(0, 17, 0))
	apply_game_mode()

func apply_game_mode():
	add_child(Globals.current_mode)

func get_random_point_up():
	point_cast.cast_to = Vector3(0,-200, 0)
	var pos := Vector3(0, 50, 0)
	while true:
		pos.x = bounding_box.position.x + rand_range(0, bounding_box.size.x)
		pos.z = bounding_box.position.z + rand_range(0, bounding_box.size.z)
		point_cast.global_transform.origin = pos
		point_cast.force_raycast_update()
		if point_cast.is_colliding():
			return point_cast.get_collision_point()

func get_random_point_side():
	point_cast.cast_to = Vector3(0,0,-1000)
	var pos := Vector3(0, 50, 0)
	while true:
		pos.x = bounding_box.position.x + rand_range(0, bounding_box.size.x)
		pos.y = 10 + rand_range(0, bounding_box.size.y)
		point_cast.global_transform.origin = pos
		point_cast.force_raycast_update()
		if point_cast.is_colliding():
			return point_cast.get_collision_point()


