extends MarginContainer



func _on_timer_timeout():
	$panel/timer_label.text = str(int($panel/timer_label.text) + 1)
