extends Node

var player
signal set_state

func init():
	player.connect('player_stopped', self, '_on_player_stopped')

func exit():
	player.disconnect('player_stopped', self, '_on_player_stopped')

func _on_player_stopped():
	emit_signal('set_state', 'idle')
