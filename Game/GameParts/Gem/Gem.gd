extends RigidBody2D

const init_speed = 320


func _ready():
	var direction = Vector2(randf()-0.5,randf()-0.5)
	apply_impulse(Vector2(),direction*init_speed)
	


func _on_click_detector_pressed():
	print("gem coloected!")
	pass # Replace with function body.
