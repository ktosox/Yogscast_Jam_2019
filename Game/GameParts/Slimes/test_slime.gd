extends RigidBody2D

var target

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
	var where_to = Vector2(0,0)
	if(!is_instance_valid(target)):
		where_to = Vector2((randf()-0.5),(randf()-0.5))
	else:
		where_to = (target.global_position-global_position)/(abs(target.global_position.x)+abs(target.global_position.y))
	apply_impulse(Vector2(), where_to * 183500)
	


func _physics_process(delta):
	if (abs(rotation_degrees)>5):
		angular_velocity = delta * (-rotation) * 60

func _on_TimerBored_timeout():
	doSomething()
	$TimerBored.start(randf()*2)
	pass # Replace with function body.

func damange(source):
	target = source
	pass

func _on_test_slime_body_entered(body):
	if(body.get_collision_layer_bit(4)): #this is a bullet
		damange(body)
		body.pop()
	if(body.get_collision_layer_bit(3)): #this is a dude
		body.splat()