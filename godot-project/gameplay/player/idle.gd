extends Node

var player
signal set_state

enum HorizontalShootingDirection {
	LEFT
	RIGHT
}

var can_shoot = false

var valid_shooting_horizontal_direction

func init():
	$ref_shooting_line.visible = true
	valid_shooting_horizontal_direction = _get_shooting_horizontal_direction(player.get_parent().global_position, player.global_position)
	
func exit():
	$ref_shooting_line.visible = false
	
func input(event):
	if event is InputEventMouseButton and not event.pressed and can_shoot:
		player.move_to(event.position)
		emit_signal('set_state', 'flying')

func update(delta):
	$ref_shooting_line.points = [player.global_position, get_viewport().get_mouse_position()]
	var shooting_horizontal_direction = _get_shooting_horizontal_direction(player.global_position, get_viewport().get_mouse_position())
	can_shoot = (valid_shooting_horizontal_direction == shooting_horizontal_direction)
	if can_shoot:
		$ref_shooting_line.default_color = Color.green
	else:
		$ref_shooting_line.default_color = Color.red

func _get_shooting_horizontal_direction(src_position, dst_position):
	if src_position.x < dst_position.x:
		return HorizontalShootingDirection.RIGHT
	else:
		return HorizontalShootingDirection.LEFT
