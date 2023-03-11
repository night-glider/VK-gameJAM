tool
extends Spatial

var leg_target:=Vector3(1,-4,1)

func _ready():
	$Timer.start()

func _process(delta):
	$leg.translation = $leg.translation.move_toward(leg_target, 0.01)
	$leg/joint.look_at(global_transform.origin, Vector3.UP)


func _on_Timer_timeout():
	leg_target = Vector3(0,-4,0)
	leg_target.x = rand_range(-5,5)
	leg_target.z = rand_range(-5,5)
	
