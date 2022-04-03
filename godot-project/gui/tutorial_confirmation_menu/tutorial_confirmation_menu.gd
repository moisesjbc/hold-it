extends Control


func _on_no_button_pressed():
	get_tree().change_scene("res://gameplay/main/main.tscn")


func _on_yes_button_pressed():
	get_tree().change_scene("res://tutorial/tutorial.tscn")
