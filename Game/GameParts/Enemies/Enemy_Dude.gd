extends Path2D


var moving = false

var speed = 60

func move(path):
	curve.clear_points()
	$PathFollow2D.offset = 0
	for x in range(path.size()):
		curve.add_point(path[x])
	moving = true

func _physics_process(delta):
	if(moving):
		$PathFollow2D.offset += delta * speed
		if($PathFollow2D.unit_offset>=1):
			moving = false

func _on_collider_body_entered(body):
	pass # Replace with function body.
