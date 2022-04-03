extends Node2D

var player

func _ready():
	get_tree().paused = false
	player = $player
	player.attach_to_new_parent(get_tree().get_root().get_node('walls').get_node('left_wall'))
	player.main_scene = self
	$poop_spawn.player = player


func _on_player_player_out_of_screen():
	if $GUI/game_over.visible == false:
		$GUI/game_over.display()


func _on_game_over_restart_game():
	get_tree().reload_current_scene()


func _on_poop_reached_bottom(damage):
	$GUI/dump_bar.add_poop_damage(damage)


func _on_dump_bar_dump_bar_full():
	$GUI/game_over.display()
