extends Spatial

const enemy = preload("res://objects/enemy.tscn")
const turret = preload("res://objects/turret.tscn")
const turret_base = preload("res://objects/turret_base.tscn")
onready var map_obj:Spatial = get_parent()
var score_to_win:=1000
var turret_count:=10
var score := 0
var time_passed := 0.0

func _ready():
	var new_enemy = enemy.instance()
	add_child(new_enemy)
	new_enemy.global_transform.origin = map_obj.get_random_point_up()
	new_enemy.connect("destroyed", self, "_on_enemy_destroyed")
	
	for i in turret_count:
		var new_turret_base = turret_base.instance()
		var new_turret = turret.instance()
		map_obj.add_child(new_turret)
		map_obj.add_child(new_turret_base)
		new_turret.init(map_obj.player_obj)
		new_turret.global_translation = map_obj.get_random_point_up() + Vector3(0,2.25,0)
		new_turret_base.global_translation = new_turret.global_translation

func _process(delta):
	time_passed += delta

func _on_enemy_destroyed():
	var new_enemy = enemy.instance()
	add_child(new_enemy)
	new_enemy.global_transform.origin = map_obj.get_random_point_up()
	new_enemy.connect("destroyed", self, "_on_enemy_destroyed")
	
	score+=100
	$Label3D.text = "ОЧКИ: " + str(score)
	
	if score >= score_to_win:
		var new_record = max(SaveManager.get_var("race_record", 0), (score / time_passed))
		SaveManager.set_var("race_record", new_record)
		SaveManager.save_to_disk()
		get_tree().change_scene("res://locations/main.tscn")
