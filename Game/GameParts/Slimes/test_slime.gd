extends RigidBody2D

var is_dead = false

var blueGems = [5,7,10,16,19,21,26,27]

var greenGems = [1,8,13,23,25,29,30,33,36,37,38,39]

var orangeGems = [2,3,4,17,32,34]

var redGems = [6,9,14,15,18,28,31,35,40]

var purpleGems = [11,12,20,22,24]

var target

var speed = 183500

var HP = 10

var is_moving = false

func _ready():
	doSomething()

func use_gem(in_gem):
	match gem_check(in_gem):
		1:
			redGem()
		2:
			blueGem()
		3:
			greenGem()
		4:
			orangeGem()
		5:
			purpleGem()

func redGem():
	pass
	HP = 300
	$Scaler/Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_red.png")
	$TimerBored.stop()
	$Scaler/Sprite/AnimationPlayer.play("rise_boom")

func blueGem():
	$Scaler/Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_blue.png")
	$TimerBored.stop()
	$Scaler/Sprite/AnimationPlayer.play("rise")
	pass

func greenGem():
	$Scaler/Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_grn.png")
	HP = 30
	$Scaler.scale *= Vector2(1.4,1.4)
	pass

func orangeGem():
	$Scaler/Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_orng.png")
	speed *= 1.5
	pass

func purpleGem():
	$Scaler/Sprite.texture = load("res://GameParts/Slimes/slime_spritesheet_prpl.png")
	die()
	pass

func doSomething():
	$Scaler/Sprite/AnimationPlayer.play("jump")
	
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
	apply_impulse(Vector2(), where_to * speed)
	


func _physics_process(delta):
	if (abs(rotation_degrees)>5):
		angular_velocity = delta * (-rotation) * 80

func _on_TimerBored_timeout():
	doSomething()
	$TimerBored.start(randf()*2)
	pass # Replace with function body.

func damange(source):
	target = source
	HP -=1
	if(HP < 0):
		if(!is_dead):
			die()
	pass

func explode():
	var all_targets = $Explosion.get_overlapping_areas()
	for x in all_targets.size():
		if(all_targets[x].get_collision_layer_bit( 3 )):
			all_targets[x]._on_Collider_body_entered(self)
	die()

func die():
	is_dead = true
	$TimerBored.stop()
	$Scaler/Sprite/AnimationPlayer.play("shrink")
	$CollisionShape2D.disabled = true
	$Gem_Taker.can_take_gems = false
	$TimerDead.start()
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

func _on_TimerDead_timeout():
	self.queue_free()
	pass # Replace with function body.
