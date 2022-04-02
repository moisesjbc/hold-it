extends Node

var player
signal set_state


func input(event):
	if event is InputEventMouseButton:
		player.move_to(event.position)
		emit_signal('set_state', 'flying')
