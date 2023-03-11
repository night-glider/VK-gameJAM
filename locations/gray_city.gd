extends Spatial

const enemy = preload("res://objects/enemy.tscn")
const turret = preload("res://objects/turret.tscn")
onready var point_cast := $PointCast 
var bounding_box:AABB

func _ready():
	bounding_box = $city.get_aabb()
	
	for i in 10:
		var new_turret = turret.instance()
		add_child(new_turret)
		new_turret.init($player)
		new_turret.global_translation = get_random_point_up() + Vector3(0,3,0)

func _process(delta):
	$"moving platform".translation.z += 0.025

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

func _on_enemy_destroyed():
	var new_enemy = enemy.instance()
	add_child(new_enemy)
	new_enemy.global_transform.origin = get_random_point_up()
	new_enemy.connect("destroyed", self, "_on_enemy_destroyed")
