extends Spatial

const enemy = preload("res://objects/enemy.tscn")

func _ready():
	randomize()
	$AnimationPlayer.play("default")


func _on_enemy_destroyed():
	var spawn_locations:Array = $enemy_spawns.get_children()
	var pos = spawn_locations[randi() % spawn_locations.size()].get_random_point()
	var new_enemy = enemy.instance()
	new_enemy.connect("destroyed", self, "_on_enemy_destroyed")
	add_child(new_enemy)
	new_enemy.global_transform.origin = pos
