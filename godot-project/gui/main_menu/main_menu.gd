extends Control

func _ready():
	get_tree().paused = false

func _on_play_button_pressed():
	get_tree().change_scene("res://gameplay/main/main.tscn")


func _on_credits_menu_button_pressed():
	get_tree().change_scene("res://gui/credits_menu/credits_menu.tscn")
