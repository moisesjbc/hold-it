extends MarginContainer

func _ready():
	_set_value(0)


func _on_player_food_streak_changed(new_value):
	_set_value(new_value)


func _set_value(new_value):
	var text_color = Color.red 
	if new_value >= 3:
		text_color = Color.green
	
	$panel/label.text = 'Streak: ' + str(new_value)
	$panel/label.add_color_override("font_color", text_color)
