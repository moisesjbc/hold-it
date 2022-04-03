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


func _on_go_to_main_menu_button_pressed():
	if visible == true and get_tree() != null:
		get_tree().paused = false
		get_tree().change_scene("res://gui/main_menu/main_menu.tscn")
