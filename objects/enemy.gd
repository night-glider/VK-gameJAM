extends StaticBody

signal destroyed
const particles = preload("res://objects/particles/enemy_explosion.tscn")

func hit():
	emit_signal("destroyed")
	Globals.spawn_particles(global_transform.origin, particles, 1)
	queue_free()
