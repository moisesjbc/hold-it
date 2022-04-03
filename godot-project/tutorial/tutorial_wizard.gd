extends Node2D

var current_step_index = -1
var current_step

func _ready():
	next_step()
	
func set_instructions(instructions, press_enter_to_continue=false):
	if press_enter_to_continue:
		instructions += "\nPress [ENTER] to continue"
	get_parent().find_node('instructions_label', true).text = instructions

func next_step():
	if current_step:
		current_step.visible = false
	
	if current_step_index:
		current_step_index += 1
		current_step = get_child(current_step_index)
		if current_step.instructions:
			set_instructions(current_step.instructions, current_step.press_enter_to_continue)
	else:
		get_tree().change_scene("res://gameplay/main/main.tscn")
	
	if current_step:
		current_step.visible = true

func _input(event):
	if event is InputEventKey and event.scancode == KEY_ENTER:
		next_step()
