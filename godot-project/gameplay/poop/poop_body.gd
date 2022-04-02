extends KinematicBody2D

var poop_scene

func _ready():
	poop_scene = load("res://gameplay/poop/poop.tscn")
	
func divide():
	print('DIVIDE')
	# TODO: Parametrize
	var offset_point = 0.5
	var top_poop = poop_scene.instance()
	print("top_poop", top_poop)
	top_poop.get_node('poop_body').scale.y = 0.5
	get_parent().add_child(top_poop)
	top_poop.global_position = $ref_points/top_point.global_position

	var bottom_poop = poop_scene.instance()
	bottom_poop.get_node('poop_body').scale.y = 0.5
	get_parent().add_child(bottom_poop)
	bottom_poop.global_position = $ref_points/bottom_point.global_position

	queue_free()
