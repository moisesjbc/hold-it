extends Path2D

var poop_scene = preload("res://gameplay/poop/poop.tscn")
var min_food_speed = 150
var max_food_speed = 200
var spawn_time = 1.5
var player

func _ready():
	player = get_parent().find_node('player', true)

func _on_spawn_timer_timeout():
	var poop = poop_scene.instance()
	$path_follow.set_offset(randi())
	poop.global_position = $path_follow.global_position
	poop.main = get_parent()
	poop.player = player
	poop.speed = min_food_speed + (max_food_speed - min_food_speed) * randf()
	$poops.add_child(poop)
	$spawn_timer.start(spawn_time)


func _on_difficulty_timer_timeout():
	min_food_speed += 50
	max_food_speed += 50
	if spawn_time > 0.2:
		spawn_time -= 0.1
