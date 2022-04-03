extends Control

var current_step_index = -1

func _ready():
	set_current_step_index(0)

func set_current_step_index(new_step_index):
	$previous_button.visible = new_step_index > 0
	
	if new_step_index == ($steps.get_child_count() - 1):
		$next_buton.text = 'Exit'
	else:
		$next_buton.text = 'Next >'

	if current_step_index > -1:
		$steps.get_child(current_step_index).visible = false
		
	current_step_index = new_step_index
	$steps.get_child(current_step_index).visible = true


func _on_next_buton_pressed():
	if current_step_index == ($steps.get_child_count() - 1):
		get_tree().change_scene("res://gui/main_menu/main_menu.tscn")
	else:
		set_current_step_index(current_step_index + 1)



func _on_previous_button_pressed():
	set_current_step_index(current_step_index - 1)
