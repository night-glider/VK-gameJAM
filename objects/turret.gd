extends StaticBody

var track_object:Spatial
var track_distance:int = 100

func init(obj):
	track_object = obj

func _process(delta):
	if track_object == null:
		return
	
	#global_transform.basis.z track_object.global_transform.origin
	look_at(track_object.global_transform.origin, Vector3.UP)
	#if global_transform.origin.distance_squared_to(track_object.global_transform.origin) < track_distance:
