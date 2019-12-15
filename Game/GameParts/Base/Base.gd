extends Node2D

var slimeScene = load("res://GameParts/Slimes/test_slime.tscn")

var HP = 100


func _ready():
	GM.currentBase = self
	

func spawn_slime():
	var newSlime = slimeScene.instance()
	newSlime.global_position = global_position + Vector2(0,5)
	get_parent().add_child(newSlime)
	pass

func _on_TimerSpawn_timeout():
	spawn_slime()
	pass # Replace with function body.

func damange():
	HP -=1
	if (HP<0):
		GM.lose_game()
	pass

func _on_HitBox_body_entered(body):
	if(body.get_collision_layer_bit(4)): #this is a bullet
		damange()
		body.pop()
	pass # Replace with function body.
