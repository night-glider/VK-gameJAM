extends Spatial

const active_color = Color.yellow
const default_color = Color.white

var mouse_delta := Vector2.ZERO
onready var master_volume = SaveManager.get_var("master", 5)
onready var sound_volume = SaveManager.get_var("sound", 10)
onready var music_volume = SaveManager.get_var("music", 10)


func toggle_pause():
	$Camera.current = not $Camera.current
	visible = $Camera.current
	$Camera/crosshair.visible = visible
	$Camera.rotation = Vector3.ZERO
	SaveManager.save_to_disk()

func _ready():
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	$master/Label.text = str(master_volume)
	$music/Label.text = str(music_volume)
	$sound/Label.text = str(sound_volume)
	$sens/Label.text = str(Globals.sensitivity)
	
	visible = false
	$Camera/crosshair.visible = visible

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
	
	if not visible:
		return
	
	if $Camera/RayCast.is_colliding():
		var obj:Node = $Camera/RayCast.get_collider()
		if obj.is_in_group("button3D"):
			obj.hovered = true
		
		if Input.is_action_just_pressed("pick"):
			obj.press()
	
	
	$Camera.rotation_degrees.y -= mouse_delta.x * Globals.sensitivity * 0.02
	$Camera.rotation_degrees.x -= mouse_delta.y * Globals.sensitivity * 0.02
	$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x, -90, 90)
	
	mouse_delta = Vector2.ZERO

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative

func _on_continue_pressed():
	toggle_pause()

func _on_master_up_pressed():
	master_volume = clamp(master_volume + 1, 0, 10)
	SaveManager.set_var("master", master_volume)
	Globals.change_bus_volume("Master", master_volume)
	$master/Label.text = str(master_volume)

func _on_master_down_pressed():
	master_volume = clamp(master_volume - 1, 0, 10)
	SaveManager.set_var("master", master_volume)
	Globals.change_bus_volume("Master", master_volume)
	$master/Label.text = str(master_volume)

func _on_music_up_pressed():
	music_volume = clamp(music_volume + 1, 0, 10)
	SaveManager.set_var("music", music_volume)
	Globals.change_bus_volume("Music", music_volume)
	$music/Label.text = str(music_volume)

func _on_music_down_pressed():
	music_volume = clamp(music_volume - 1, 0, 10)
	SaveManager.set_var("music", music_volume)
	Globals.change_bus_volume("Music", music_volume)
	$music/Label.text = str(music_volume)

func _on_sound_up_pressed():
	sound_volume = clamp(sound_volume + 1, 0, 10)
	SaveManager.set_var("sound", sound_volume)
	Globals.change_bus_volume("Sound", sound_volume)
	$sound/Label.text = str(sound_volume)

func _on_sound_down_pressed():
	sound_volume = clamp(sound_volume - 1, 0, 10)
	SaveManager.set_var("sound", sound_volume)
	Globals.change_bus_volume("Sound", sound_volume)
	$sound/Label.text = str(sound_volume)

func _on_exit_pressed():
	get_tree().quit()


func _on_sens_up_pressed():
	Globals.sensitivity = clamp(Globals.sensitivity + 1, 1, 10)
	SaveManager.set_var("sensitivity", Globals.sensitivity)
	$sens/Label.text = str(Globals.sensitivity)


func _on_sens_down_pressed():
	Globals.sensitivity = clamp(Globals.sensitivity - 1, 1, 10)
	SaveManager.set_var("sensitivity", Globals.sensitivity)
	$sens/Label.text = str(Globals.sensitivity)
