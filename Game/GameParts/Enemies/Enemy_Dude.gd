extends Path2D

var bulletScene = load("res://GameParts/Enemies/Bullet.tscn")

var moving = false

var speed = 60

var dific = 1

var target

func move(path):
	curve = Curve2D.new()
	$PathFollow2D.offset = 0
	for x in range(path.size()):
		curve.add_point(path[x])
	moving = true

func _physics_process(delta):
	if(moving):
		$PathFollow2D.offset += delta * speed
		if($PathFollow2D.unit_offset>=1):
			moving = false

func splat():
	$PathFollow2D/dude.visible = false
	$PathFollow2D/splat.visible = true

func fire_bullet():
	var newBullet = bulletScene.instance()
	newBullet.global_position = $PathFollow2D.global_position
	newBullet.global_rotation = atan2(target.global_position.x- $PathFollow2D.global_position.x,$PathFollow2D.global_position.y-target.global_position.y) - rotation
	get_parent().add_child(newBullet)
	newBullet.source = $PathFollow2D
	newBullet.launch()
	pass

func attack():
	moving = false
	if (GM.difficulty <2):
		$FireAnimator.play("slow")
	else:
		$FireAnimator.play("fast")
	
	pass

func scan():
	var potentail_targets = $PathFollow2D/DetectionRange.get_overlapping_bodies()
	if(potentail_targets.size() == 0):
		moving = true
		$FireAnimator.stop()
	else:
		target = potentail_targets[0]

func _on_DetectionRange_body_entered(body):
	if(body.get_collision_layer_bit(1)): #this is a slime
		target = body
		attack()
	pass # Replace with function body.


func _on_Collider_body_entered(body):
	splat()
	$FireAnimator.stop()
	moving = false
	$TimerDeath.start()
	pass # Replace with function body.


func _on_TimerDeath_timeout():
	queue_free()
	pass # Replace with function body.


func _on_TimerReScan_timeout():
	if($FireAnimator.is_playing()==false and moving == false):
		scan()
	pass # Replace with function body.
