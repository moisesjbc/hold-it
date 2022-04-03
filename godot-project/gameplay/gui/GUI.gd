extends CanvasLayer

signal restart_game
signal dump_bar_full


func _on_game_over_restart_game():
	emit_signal('restart_game')


func _on_dump_bar_dump_bar_full():
	emit_signal('dump_bar_full')


func _on_player_food_streak_changed(new_value):
	$streak_counter.set_value(new_value)
