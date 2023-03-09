extends StaticBody

const particles = preload("res://objects/particles/enemy_explosion.tscn")

func hit():
	Globals.spawn_particles(global_transform.origin, particles, 1)
	queue_free()
