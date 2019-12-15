extends RigidBody2D

var target_pos

var is_moving = false

func _ready():
	match(randi()%5):
		0:
			$Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_blue.png")
		1:
			$Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_grn.png")
		2:
			$Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_red.png")
		3:
			$Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_orng.png")
		4:
			$Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_prpl.png")
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
	$Sprite/AnimationPlayer.play("jump")
	pass

func jump_to_random():
	apply_impulse(Vector2(), Vector2((randf()-0.5),(randf()-0.5)) * 3500)

func _physics_process(delta):
	if (abs(rotation_degrees)>5):
		angular_velocity = delta * (-rotation) * 60

func _on_TimerBored_timeout():
	doSomething()
	$TimerBored.start(randf()*2)
	pass # Replace with function body.

func damange():
	print("ouch")
	pass

func _on_test_slime_body_entered(body):
	if(body.get_collision_layer_bit(4)): #this is a bullet
		damange()
		body.pop()
	if(body.get_collision_layer_bit(3)): #this is a dude
		body.splat()