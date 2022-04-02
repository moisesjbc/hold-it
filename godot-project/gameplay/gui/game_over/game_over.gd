extends CenterContainer

signal restart_game


func display():
	visible = true
	get_tree().paused = true

func _on_restart_game_button_pressed():
	visible = false
	get_tree().paused = false
	emit_signal('restart_game')
