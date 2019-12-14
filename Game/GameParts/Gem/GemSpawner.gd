extends Node2D

var gemScene = load("res://GameParts/Gem/Gem.tscn")


func spawn_gem():
	var newGem = gemScene.instance()
	newGem.global_position = global_position
	get_parent().add_child(newGem)
	pass

func _on_TimerSpawn_timeout():
	spawn_gem()
	pass # Replace with function body.
