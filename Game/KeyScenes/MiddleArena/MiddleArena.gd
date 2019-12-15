extends Navigation2D

var enemyDudeScene = load("res://GameParts/Enemies/Enemy_Dude.tscn")

var current_wave = 1

func _ready():
	pass

func addEnemyDude(pos):
	var start = get_closest_point(pos)
	var newDude = enemyDudeScene.instance()
	newDude.global_position = Vector2()
	$Enemy_Layer.add_child(newDude)
	var target = get_closest_point(GM.currentBase.position)
	var path = get_simple_path(start,target,true)
	newDude.move(path)


func spawn_wave():
	var tartget_loc = random_loc()
	for x in GM.difficulty*2 + 3:
		addEnemyDude(tartget_loc + Vector2((randf()-0.5)*150,(randf()-0.5)*150))
	$Overlay/Wave.text = "WAVE " + String(current_wave)
	current_wave +=1
	$Overlay/WaveAnimator.play("show")

func random_loc():
	match randi()%3:
		0:
			return $Enemy_Layer/Spawn1.global_position
		1:
			return $Enemy_Layer/Spawn2.global_position
		2:
			return $Enemy_Layer/Spawn3.global_position

func _on_TimerWave_timeout():
	spawn_wave()
	GM.difficulty+=0.5
	pass # Replace with function body.
