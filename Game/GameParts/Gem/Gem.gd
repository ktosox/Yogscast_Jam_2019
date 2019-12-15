extends RigidBody2D

const init_speed = 320

export var item_ID : int

func _ready():
	test_random()
	var direction = Vector2(randf()-0.5,randf()-0.5)
	apply_impulse(Vector2(),direction*init_speed)
	


func _on_click_detector_pressed():
	if(GM.currentInventory.add_item(item_ID)):
		self.queue_free()

func update_image():
	$image.texture = load("res://Resources/REXARD/GemsIcons/GemsIcons_png/"+String(item_ID)+".PNG")

func test_random():
	randomize()
	item_ID = randi()%40+1
	update_image()
	