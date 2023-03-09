extends MeshInstance

func get_random_point()->Vector3:
	var result := Vector3.ZERO
	result.x = randf()
	result.y = randf()
	result.z = 0
	return to_global(result)

func _ready():
	visible = false
