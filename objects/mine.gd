extends StaticBody

const explosion := preload("res://objects/turret_explosion.tscn")
const trigger_distance := 1.5
var target:Spatial

func init(tar):
	target = tar

func trigger():
	var new_explosion = explosion.instance()
	get_parent().add_child(new_explosion)
	new_explosion.global_translation = global_translation
	queue_free()

func hit():
	trigger()

func _process(delta):
	if not target:
		return
	
	if target.global_translation.distance_to(global_translation) < trigger_distance:
		var vel = global_translation.direction_to(target.global_translation) * 50
		vel.y = 5
		target.apply_knockback(vel)
		trigger()
