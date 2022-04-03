extends KinematicBody2D

var speed = 0
var velocity
var main_scene
signal player_stopped
var last_parent = null
signal player_out_of_screen
var changing_parent = false
var acid_explosion_scene = preload("res://gameplay/acid_explosion/acid_explosion.tscn")
var food_streak = 0
var last_attached_parent_was_food: bool = false
signal food_streak_changed

func _ready():
	last_parent = get_parent()
	if get_parent().name != 'main':
		$state_machine.disabled = true

func move_to(target_pos):
	speed = 1500
	velocity = (target_pos - global_position).normalized()
	attach_to_new_parent(main_scene)
	$jump_sound.play()

func stop(new_parent):
	speed = 0
	attach_to_new_parent(new_parent)
	emit_signal('player_stopped')
	
func attach_to_new_parent(new_parent):
	changing_parent = true

	last_parent = get_parent()
	var _global_position = global_position
	get_parent().remove_child(self)
	new_parent.add_child(self)
	global_position = _global_position
	
	
	if last_parent.is_in_group('poops'):
		last_parent.divide()
	if new_parent.name != 'main':
		if new_parent.is_in_group('poops') and last_attached_parent_was_food:
			food_streak += 1
			if food_streak > 2:
				create_acid_explosion()
		else:
			food_streak = 0
		emit_signal('food_streak_changed', food_streak)
	
		last_attached_parent_was_food = new_parent.is_in_group('poops')
		
	changing_parent = false


func _physics_process(delta):
	if speed > 0:
		var collision = move_and_collide(velocity * speed * delta)
		if collision and collision.collider != last_parent:
			stop(collision.collider)
			

func create_acid_explosion():
	var acid_explosion = acid_explosion_scene.instance()
	acid_explosion.player = self
	main_scene.add_child(acid_explosion)
	acid_explosion.global_position = global_position


func _on_visibility_notifier_screen_exited():
	if not changing_parent:
		emit_signal('player_out_of_screen')
		

