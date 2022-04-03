extends CenterContainer

signal resume_game_pressed
signal main_menu_pressed


func display():
	visible = true
	get_tree().paused = true

func unpause():
	get_tree().paused = false
	visible = false


func _on_resume_button_pressed():
	unpause()
	emit_signal('resume_game_pressed')


func _on_button_pressed():
	unpause()
	emit_signal('main_menu_pressed')
