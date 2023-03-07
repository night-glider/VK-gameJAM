extends Spatial

var point_to_pick:Vector3
var is_picking := false

func pick_point(pos:Vector3):
	point_to_pick = pos
	is_picking = true

func reset():
	is_picking = false

func _process(delta):
	if is_picking:
		global_transform.origin = lerp(global_transform.origin, point_to_pick, 0.1)
