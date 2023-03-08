tool
extends Area

signal pressed

export var default_color := Color.white
export var active_color := Color.yellow
export var text := "Button3D" setget set_text
export var hitbox_scale := Vector3.ONE setget set_hitbox_scale
var hovered := false

func set_text(val):
	text = val
	$Label3D.text = val

func set_hitbox_scale(val):
	hitbox_scale = val
	$CollisionShape.scale = val

func press():
	emit_signal("pressed")

func _process(delta):
	if hovered:
		$Label3D.modulate = active_color
	else:
		$Label3D.modulate = default_color
	
	hovered = false
