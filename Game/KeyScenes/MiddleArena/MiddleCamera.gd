extends Camera2D

var current_Zoom = 0
var zoom_CD = true

var move_vector = Vector2()

func _ready():
	GM.currentCamera = self

var scroll_speed = 900.0

func _input(event):
	if(event.is_action("MW_down") and zoom_CD):
		if(current_Zoom == -3):
			return
		else:
			current_Zoom -=1
			$ZoomAnimator.play("Zoom"+String(current_Zoom))
			zoom_CD = false
			$TimerZoomCD.start()
	if(event.is_action("MW_up") and zoom_CD):
		if(current_Zoom == 3):
			return
		else:
			current_Zoom +=1
			$ZoomAnimator.play("Zoom"+String(current_Zoom))
			zoom_CD = false
			$TimerZoomCD.start()

func _physics_process(delta):
	move_vector = Vector2()
	if(Input.is_action_pressed("ui_right") and global_position.x<limit_right):
		move_vector += Vector2(1,0)
	if(Input.is_action_pressed("ui_left") and global_position.x>limit_left):
		move_vector += Vector2(-1,0)
	if(Input.is_action_pressed("ui_up") and global_position.y>limit_top):
		move_vector += Vector2(0,-1)
	if(Input.is_action_pressed("ui_down") and global_position.y<limit_bottom):
		move_vector += Vector2(0,1)

	position += delta * move_vector * scroll_speed


func _on_TimerZoomCD_timeout():
	zoom_CD = true
