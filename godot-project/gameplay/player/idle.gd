extends Node

var player
signal set_state

enum HorizontalShootingDirection {
	LEFT
	RIGHT
}

var valid_shooting_horizontal_direction

func init():
	valid_shooting_horizontal_direction = _get_shooting_horizontal_direction(player.get_parent().global_position, player.global_position)

func input(event):
	var shooting_horizontal_direction = _get_shooting_horizontal_direction(player.global_position, event.position)
	if event is InputEventMouseButton and (valid_shooting_horizontal_direction == shooting_horizontal_direction):
		player.move_to(event.position)
		emit_signal('set_state', 'flying')

func _get_shooting_horizontal_direction(src_position, dst_position):
	if src_position.x < dst_position.x:
		return HorizontalShootingDirection.RIGHT
	else:
		return HorizontalShootingDirection.LEFT
