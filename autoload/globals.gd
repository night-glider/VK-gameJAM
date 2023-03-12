extends Node
class_name globals

onready var sensitivity:int = SaveManager.get_var("sensitivity", 5)
var current_mode:=Spatial.new()

func _ready():
	var master_volume = SaveManager.get_var("master", 5)
	var sound_volume = SaveManager.get_var("sound", 10)
	var music_volume = SaveManager.get_var("music", 10)
	
	change_bus_volume("Master", master_volume)
	change_bus_volume("Sound", sound_volume)
	change_bus_volume("Music", music_volume)

func change_bus_volume(bus_name:String, volume:float):
	if volume == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index(bus_name), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index(bus_name), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_name), -40 + volume*4)

func play_sound(sound:AudioStream):
	var new_audio_player = AudioStreamPlayer.new()
	new_audio_player.bus = "Sound"
	new_audio_player.connect("finished", self, "_sound_finished", [new_audio_player])
	add_child(new_audio_player)
	new_audio_player.stream = sound
	new_audio_player.play()

func _sound_finished(audio_player:AudioStreamPlayer):
	audio_player.queue_free()

func spawn_particles(pos:Vector3, particles:PackedScene, life_time:float):
	var new_particles:CPUParticles = particles.instance()
	add_child(new_particles)
	new_particles.global_transform.origin = pos
	new_particles.emitting = true
	var new_timer = Timer.new()
	add_child(new_timer)
	new_timer.connect("timeout", self, "_particles_finished", [new_particles, new_timer])
	new_timer.start(life_time)
	
	

func _particles_finished(particles:CPUParticles, timer:Timer):
	particles.queue_free()
	timer.queue_free()
