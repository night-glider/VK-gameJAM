extends Spatial

const race = preload("res://objects/game_modes/race.tscn")
const boss_mode = preload("res://objects/game_modes/boss.tscn")

var score_to_win:int = 500
var turret_count:int = 5

var race_leaderboard = [
	{"nick":"nighty", "value":4.23},
	{"nick":"wuxhiff", "value":1.12},
	{"nick":"glkppr", "value":3.31}
]

func sort_leaderboard(a, b):
	if a["value"] < b["value"]:
		return false
	else:
		return true

func _ready():
	if SaveManager.get_var("tutorial_completed", false):
		$player.rotation_degrees = Vector3.ZERO
	
	var race_record = SaveManager.get_var("race_record", 0)
	race_record = stepify(race_record, 0.01)
	race_leaderboard.append({"nick":"Я", "value":race_record})
	race_leaderboard.sort_custom(self, "sort_leaderboard")
	
	for elem in race_leaderboard:
		var result = ""
		for i in 10:
			if i > (len(elem["nick"])-1 ):
				result+= " "
			else:
				result+= elem["nick"][i]
		result += " " + str(elem["value"]) + "\n"
		$leaderboard/table.text += result

func _on_score_down_pressed():
	score_to_win = clamp(score_to_win - 100, 500, 2000)
	$race_mode/score.text = str(score_to_win)

func _on_score_up_pressed():
	score_to_win = clamp(score_to_win + 100, 500, 2000)
	$race_mode/score.text = str(score_to_win)

func _on_mode1_start_pressed():
	var new_race = race.instance()
	new_race.score_to_win = self.score_to_win
	new_race.turret_count = self.turret_count
	Globals.current_mode = new_race
	get_tree().change_scene("res://locations/gray_city.tscn")


func _on_enemy_destroyed():
	SaveManager.set_var("tutorial_completed", true)
	SaveManager.save_to_disk()

func _on_turret_up_pressed():
	turret_count = clamp(turret_count + 1, 0, 30)
	$race_mode/turret.text = str(turret_count)

func _on_turret_down_pressed():
	turret_count = clamp(turret_count - 1, 0, 30)
	$race_mode/turret.text = str(turret_count)


func _on_boss_start_pressed():
	var new_boss = boss_mode.instance()
	Globals.current_mode = new_boss
	get_tree().change_scene("res://locations/gray_city.tscn")
