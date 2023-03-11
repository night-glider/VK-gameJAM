extends Spatial

var score_to_win:int = 10

var race_leaderboard = [
	{"nick":"nighty", "value":0.2},
	{"nick":"wuxhiff", "value":0.1},
	{"nick":"glkppr", "value":0.3}
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
	score_to_win = clamp(score_to_win -1, 5, 20)
	$race_mode/score.text = str(score_to_win)

func _on_score_up_pressed():
	score_to_win = clamp(score_to_win +1, 5, 20)
	$race_mode/score.text = str(score_to_win)

func _on_mode1_start_pressed():
	get_tree().change_scene("res://locations/gray_city.tscn")


func _on_enemy_destroyed():
	SaveManager.set_var("tutorial_completed", true)
	SaveManager.save_to_disk()
