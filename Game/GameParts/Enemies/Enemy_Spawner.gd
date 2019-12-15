extends Node2D


func spawn_dude():
	get_parent().addEnemyDude(random_loc())
	pass

func random_loc():
	match randi()%4:
		0:
			return $Loc1.global_position
		1:
			return $Loc2.global_position
		2:
			return $Loc3.global_position
		3:
			return $Loc4.global_position


func spawn_wave():
	var tartget_loc = random_loc()
	for x in GM.difficulty*2 + 3:
		get_parent().addEnemyDude(tartget_loc + Vector2((randf()-0.5)*150,(randf()-0.5)*150))

