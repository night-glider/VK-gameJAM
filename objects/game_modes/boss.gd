extends Spatial

const boss = preload("res://objects/boss.tscn")

onready var map_obj:Spatial = get_parent()
var time:=0.0

func _ready():
	pass
	var new_boss = boss.instance()
	map_obj.add_child(new_boss)
	new_boss.init(map_obj.player_obj, map_obj.boss_path)
	new_boss.connect("destroyed", self, "victory")

func victory():
	$Label3D.text = "ПОБЕДА!\n" + "ВРЕМЯ: " + str(round(time))
	$Label3D.visible = true
	$game_end.start()

func _process(delta):
	time+=delta

func _on_game_end_timeout():
	get_tree().change_scene("res://locations/main.tscn")
