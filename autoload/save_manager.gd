extends Node
class_name save_manager

var config := ConfigFile.new()
const path = "user://save_data.cfg"
const section = "data"

func _ready():
	print("Загружаю конфиг файл...")
	config.load(path)
	for section in config.get_sections():
		print(section)
		for key in config.get_section_keys(section):
			print( "\t{0} = {1}".format([key, config.get_value(section, key)]) )

func get_var(var_name, default=null):
	return config.get_value(section, var_name, default)

func set_var(var_name, value):
	config.set_value(section, var_name, value)

func clear_data():
	config.clear()

func save_to_disk():
	config.save(path)
