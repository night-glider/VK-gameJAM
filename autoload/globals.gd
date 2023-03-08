extends Node
class_name globals

func _ready():
	var master_volume = SaveManager.get_var("master", 10)
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
	new_audio_player.connect("finished", self, "sound_finished", [new_audio_player])
	add_child(new_audio_player)
	new_audio_player.stream = sound
	new_audio_player.play()

func sound_finished(audio_player:AudioStreamPlayer):
	audio_player.queue_free()
