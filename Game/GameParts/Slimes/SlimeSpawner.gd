extends Node2D

var slimeScene = load("res://GameParts/Slimes/test_slime.tscn")


func spawn_slime():
	var newSlime = slimeScene.instance()
	newSlime.global_position = global_position
	get_parent().add_child(newSlime)
	pass

func _on_TimerSpawn_timeout():
	spawn_slime()
	pass # Replace with function body.
