extends CenterContainer

signal restart_game


func display():
	if get_tree():
		get_tree().paused = true
		visible = true

func _on_restart_game_button_pressed():
	if get_tree():
		get_tree().paused = false
		visible = false
		emit_signal('restart_game')
