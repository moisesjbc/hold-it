extends KinematicBody2D

var speed = 150
var velocity = Vector2(0, 1)
var poop_scene
var damage = 10
signal poop_reached_bottom
var main


func _ready():
	$collision_shape.disabled = true
	poop_scene = load("res://gameplay/poop/poop.tscn")
	connect('poop_reached_bottom', main, '_on_poop_reached_bottom')

func _process(delta):
	translate(velocity * speed * delta)
	if global_position.y > 700:
		emit_signal('poop_reached_bottom', damage)
		queue_free()

func divide():
	var top_poop = poop_scene.instance()
	top_poop.main = main
	top_poop.damage = damage * 0.33
	for child in top_poop.get_children():
		if child.name != 'collision_timer':
			child.scale.y = 0.5 * $sprite.scale.y
			child.scale.x = 0.5 * $sprite.scale.x
	get_parent().add_child(top_poop)
	top_poop.global_position = $ref_points/top_point.global_position

	var bottom_poop = poop_scene.instance()
	bottom_poop.main = main
	bottom_poop.damage = damage * 0.33
	for child in bottom_poop.get_children():
		if child.name != 'collision_timer':
			child.scale.y = 0.5 * $sprite.scale.y
			child.scale.x = 0.5 * $sprite.scale.x
	get_parent().add_child(bottom_poop)
	bottom_poop.global_position = $ref_points/bottom_point.global_position

	queue_free()


func _on_collision_timer_timeout():
	$collision_shape.disabled = false
