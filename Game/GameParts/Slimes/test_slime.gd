extends RigidBody2D

var target_pos

var is_moving = false

func _ready():
	doSomething()

func use_gem(in_gem):
	$Sprite/AnimationPlayer.stop()
	applied_force = Vector2()
	linear_velocity = Vector2()
	$TimerBored.stop()
	if(in_gem%2 == 0):
		$Sprite.modulate = Color(1.0,0.0,0.0)
	else:
		$Sprite.modulate = Color(1.0,1.0,0.0)
	pass

func doSomething():
	applied_force = Vector2((randf()-0.5)*300,(randf()-0.5)*300)
	pass


func _on_TimerBored_timeout():
	doSomething()
	$TimerBored.start(randi()%4)
	pass # Replace with function body.
