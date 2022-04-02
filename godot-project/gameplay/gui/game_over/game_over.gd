extends CenterContainer

signal restart_game


func display():
	if visible == false and get_tree() != null:
		get_tree().paused = true
		visible = true

func _on_restart_game_button_pressed():
	if visible == true and get_tree() != null:
		get_tree().paused = false
		visible = false
		emit_signal('restart_game')
