extends KinematicBody2D

var speed = 150
var velocity = Vector2(0, 1)
var poop_scene
var damage = 10
signal poop_reached_bottom
var main
var player


func _ready():
	poop_scene = load("res://gameplay/poop/poop.tscn")
	connect('poop_reached_bottom', main, '_on_poop_reached_bottom')

func _process(delta):
	translate(velocity * speed * delta)
	if global_position.y > 700:
		emit_signal('poop_reached_bottom', damage)
		queue_free()

func divide():
	var top_poop = instance_poop_at($ref_points/top_point)
	var bottom_poop = instance_poop_at($ref_points/bottom_point)

	if player.get_parent() == self:
		if player.global_position.distance_to(top_poop.global_position) < player.global_position.distance_to(bottom_poop.global_position):
			player.attach_to_new_parent(top_poop, false)
		else:
			player.attach_to_new_parent(bottom_poop, false)
	
	queue_free()

func instance_poop_at(ref_point):
	var new_poop = poop_scene.instance()
	new_poop.main = main
	new_poop.damage = damage * 0.33
	new_poop.speed = speed
	new_poop.player = player
	for child in new_poop.get_children():
		if child.name != 'collision_timer':
			child.scale.y = 0.5 * $sprite.scale.y
			child.scale.x = 0.5 * $sprite.scale.x
	get_parent().add_child(new_poop)
	new_poop.global_position = ref_point.global_position
	return new_poop


func _on_collision_timer_timeout():
	$collision_shape.disabled = false
