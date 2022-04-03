extends MarginContainer


func _ready():
	if get_parent().get_parent().name == 'how_to_play_menu':
		$timer.stop()

func _on_timer_timeout():
	$panel/timer_label.text = 'Time: ' + str(int($panel/timer_label.text) + 1)
