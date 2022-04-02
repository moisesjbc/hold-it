extends KinematicBody2D

var speed = 300
var velocity = Vector2(0, 1)
var poop_scene

func _ready():
	$collision_shape.disabled = true
	poop_scene = load("res://gameplay/poop/poop.tscn")

func _process(delta):
	translate(velocity * speed * delta)

func divide():
	var top_poop = poop_scene.instance()
	for child in top_poop.get_children():
		if child.name != 'collision_timer':
			child.scale.y = 0.5 * $sprite.scale.y
	get_parent().add_child(top_poop)
	top_poop.global_position = $ref_points/top_point.global_position

	var bottom_poop = poop_scene.instance()
	for child in bottom_poop.get_children():
		if child.name != 'collision_timer':
			child.scale.y = 0.5 * $sprite.scale.y
	get_parent().add_child(bottom_poop)
	bottom_poop.global_position = $ref_points/bottom_point.global_position

	queue_free()


func _on_collision_timer_timeout():
	$collision_shape.disabled = false
