extends KinematicBody2D

var speed = 1000
var velocity = Vector2.ZERO


func _ready():
	velocity = position.normalized()


func _process(delta):
	move_and_collide(velocity * speed * delta)


func _on_visibility_notifier_screen_exited():
	queue_free()
