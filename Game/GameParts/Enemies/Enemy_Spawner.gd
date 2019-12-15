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


func spawn_wave(ammount):
	for x in ammount:
		get_parent().addEnemyDude(random_loc() + Vector2((randf()-0.5)*50,(randf()-0.5)*50))
	pass

func _on_TimerTest_timeout():
	print("boop")
	spawn_dude()
	pass # Replace with function body.


func _on_TimerWave_timeout():
	spawn_wave(GM.difficulty*2 + 3)
	GM.difficulty+=1
	pass # Replace with function body.
