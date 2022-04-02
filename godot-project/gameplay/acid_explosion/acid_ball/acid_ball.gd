extends KinematicBody2D

var player
var speed = 1600
var velocity = Vector2.ZERO

func _ready():
	velocity = position.normalized()


func _process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		queue_free()
		if collision.collider.is_in_group("poops"):
			collision.collider.divide()


func _on_visibility_notifier_screen_exited():
	queue_free()
