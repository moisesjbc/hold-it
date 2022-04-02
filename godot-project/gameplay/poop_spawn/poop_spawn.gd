extends Path2D

var poop_scene = preload("res://gameplay/poop/poop.tscn")

func _on_spawn_timer_timeout():
	var poop = poop_scene.instance()
	$path_follow.set_offset(randi())
	poop.global_position = $path_follow.global_position
	poop.main = get_parent()
	$poops.add_child(poop)
