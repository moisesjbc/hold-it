extends Node2D

var player

func _ready():
	for acid_ball in get_children():
		acid_ball.player = player
