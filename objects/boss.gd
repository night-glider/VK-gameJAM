extends KinematicBody

signal destroyed
const mine = preload("res://objects/mine.tscn")
const explosion = preload("res://objects/turret_explosion.tscn")
var target_obj := Spatial
var active = false
var my_path:Array
var target_point := Vector3.ZERO
var hp := 3

func init(obj, path):
	target_obj = obj
	my_path = path
	translation = my_path[0]
	target_point = my_path[randi() % my_path.size()]
	active = true
	
	for i in 40:
		var pos = Vector3(rand_range(-1,1), rand_range(-1,1), rand_range(-1,1))
		pos = pos.normalized()
		pos *= 10
		var new_mine = mine.instance()
		add_child(new_mine)
		new_mine.translation = pos
		new_mine.init(target_obj)

func _ready():
	pass

func _process(delta):
	if not active:
		return
	translation = translation.move_toward(target_point, 0.01)
	if translation.distance_squared_to(target_point) < 1:
		target_point = my_path[randi() % my_path.size()]
	$mill.rotation_degrees.z += 0.1
	$mill.rotation_degrees.y += 0.02
	$wall1.global_transform = $mill/w1.global_transform
	$wall2.global_transform = $mill/w2.global_transform
	$wall3.global_transform = $mill/w3.global_transform
	$wall4.global_transform = $mill/w4.global_transform





func _on_weakpoint_destroyed():
	hp -= 1
	if hp <= 0:
		emit_signal("destroyed")
		queue_free()
	
	var knockback = translation.direction_to(target_obj.translation)*100
	knockback.y = 5
	target_obj.apply_knockback( knockback )
	$weakpoint.rotation = Vector3(randf()*PI, randf()*PI, randf()*PI)
	
	for i in 10:
		var pos = Vector3(rand_range(-1,1), rand_range(-1,1), rand_range(-1,1))
		pos = pos.normalized()
		pos *= 10
		var new_explosion = explosion.instance()
		add_child(new_explosion)
		new_explosion.translation = pos
		new_explosion.scale = Vector3.ONE * rand_range(1,2)
