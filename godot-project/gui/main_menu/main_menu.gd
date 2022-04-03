extends Control

func _ready():
	randomize()
	get_tree().paused = false
	
	if OS.get_name() == "HTML5":
		$margin_container/vbox_container/buttons_container/exit_button.visible = false

func _on_play_button_pressed():
	get_tree().change_scene("res://gameplay/main/main.tscn")


func _on_credits_menu_button_pressed():
	get_tree().change_scene("res://gui/credits_menu/credits_menu.tscn")


func _on_how_to_play_button_pressed():
	get_tree().change_scene("res://gui/how_to_play_menu/how_to_play_menu.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
