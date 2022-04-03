extends Node2D

var player

func _ready():
	for acid_ball in $acid_balls.get_children():
		acid_ball.player = player
	$explosion_sound.play()
