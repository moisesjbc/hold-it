extends KinematicBody2D

var speed = 300
var velocity = Vector2(0, 1)


func _process(delta):
	move_and_collide(velocity * speed * delta)
 
