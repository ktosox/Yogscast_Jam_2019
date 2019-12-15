extends RigidBody2D

var speed = 300

var source

func launch():
	var velocity = Vector2()
	velocity.x = sin(deg2rad(global_rotation_degrees))
	velocity.y = cos(deg2rad(global_rotation_degrees+180))
	apply_impulse(Vector2(), velocity * speed)

func pop():
	self.queue_free()

func _on_TimerTimeout_timeout():
	pop()
	pass # Replace with function body.
