extends Node2D


func _ready():
	$walls/left_wall/player.main_scene = self


func _on_player_player_out_of_screen():
	$GUI/game_over.display()


func _on_game_over_restart_game():
	get_tree().reload_current_scene()
