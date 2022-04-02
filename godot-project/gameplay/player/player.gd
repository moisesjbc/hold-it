extends KinematicBody2D

var speed = 0
var velocity
var main_scene
signal player_stopped
var last_parent = null
signal player_out_of_screen
var changing_parent = false

func _ready():
	last_parent = get_parent()

func move_to(target_pos):
	speed = 1500
	velocity = (target_pos - global_position).normalized()
	atach_to_new_parent(main_scene)

func stop(new_parent):
	speed = 0
	atach_to_new_parent(new_parent)
	emit_signal('player_stopped')
	
func atach_to_new_parent(new_parent):
	changing_parent = true
	last_parent = get_parent()
	if last_parent.is_in_group('poops'):
		last_parent.divide()
	var _global_position = global_position
	get_parent().remove_child(self)
	new_parent.add_child(self)
	global_position = _global_position
	changing_parent = false

func _physics_process(delta):
	if speed > 0:
		var collision = move_and_collide(velocity * speed * delta)
		if collision and collision.collider != last_parent:
			stop(collision.collider)


func _on_visibility_notifier_screen_exited():
	if not changing_parent:
		emit_signal('player_out_of_screen')
