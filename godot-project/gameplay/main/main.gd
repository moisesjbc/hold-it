extends Node2D


func _ready():
	$walls/left_wall/player.main_scene = self


func _on_player_player_out_of_screen():
	$GUI/game_over.display()


func _on_game_over_restart_game():
	get_tree().reload_current_scene()


func _on_poop_reached_bottom(damage):
	$GUI/dump_bar.add_poop_damage(damage)


func _on_dump_bar_dump_bar_full():
	$GUI/game_over.display()
