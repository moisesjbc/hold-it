extends Node2D

func init():
	get_parent().get_parent().get_node('GUI').get_node('streak_counter').set_value(3)
