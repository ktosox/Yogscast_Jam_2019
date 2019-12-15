extends RigidBody2D

var blueGems = [5,7,10,16,19,21,26,27]

var greenGems = [1,8,13,23,25,29,30,33,36,37,38,39]

var orangeGems = [2,3,4,17,32,34]

var redGems = [6,9,14,15,18,28,31,35,40]

var purpleGems = [11,12,20,22,24]

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
	match gem_check(in_gem):
		1:
			redGem()
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass

func redGem():
	pass

func blueGem():
	pass

func greenGem():
	pass

func orangeGem():
	pass

func purpleGem():
	pass

func doSomething():
	$Sprite/AnimationPlayer.play("jump")
	
	pass

func jump_to_random():
	var where_to = Vector2(0,0)
	if(!is_instance_valid(target)):
		where_to = Vector2((randf()-0.5),(randf()-0.5))
	else:
		#print("valid target is: ", target)
		var anglel = atan2(target.global_position.x- global_position.x,global_position.y-target.global_position.y)
		print(anglel)
		$test_arrow.rotation = anglel
		where_to.x = sin(anglel)
		where_to.y = -cos(anglel)
		print(where_to)
	apply_impulse(Vector2(), where_to * 183500)
	


func _physics_process(delta):
	if (abs(rotation_degrees)>5):
		angular_velocity = delta * (-rotation) * 80

func _on_TimerBored_timeout():
	doSomething()
	$TimerBored.start(randf()*2)
	pass # Replace with function body.

func damange(source):
	target = source
	pass

func _on_test_slime_body_entered(body):
	if(body.get_collision_layer_bit(4)): #this is a bullet
		damange(body.source)
		body.pop()
	if(body.get_collision_layer_bit(3)): #this is a dude
		body.splat()
		
func gem_check(gem):
	if(blueGems.has(gem)):
		return 2
	if(redGems.has(gem)):
		return 1
	if(greenGems.has(gem)):
		return 3
	if(orangeGems.has(gem)):
		return 4
	if(purpleGems.has(gem)):
		return 5