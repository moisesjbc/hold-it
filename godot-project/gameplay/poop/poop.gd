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
	instance_poop_at($ref_points/top_point)
	instance_poop_at($ref_points/bottom_point)
	queue_free()

func instance_poop_at(ref_point):
	var new_poop = poop_scene.instance()
	new_poop.main = main
	new_poop.damage = damage * 0.33
	new_poop.speed = speed
	for child in new_poop.get_children():
		if child.name != 'collision_timer':
			child.scale.y = 0.5 * $sprite.scale.y
			child.scale.x = 0.5 * $sprite.scale.x
	get_parent().add_child(new_poop)
	new_poop.global_position = ref_point.global_position


func _on_collision_timer_timeout():
	$collision_shape.disabled = false
