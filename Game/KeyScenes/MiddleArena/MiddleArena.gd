extends Navigation2D

var enemyDudeScene = load("res://GameParts/Enemies/Enemy_Dude.tscn")

func _ready():
	addEnemyDude($TEST.global_position + Vector2(randf()*5,randf()*5))
	addEnemyDude($TEST.global_position + Vector2(randf()*5,randf()*5))
	addEnemyDude($TEST.global_position + Vector2(randf()*5,randf()*5))
	addEnemyDude($TEST.global_position + Vector2(randf()*5,randf()*5))

func addEnemyDude(pos):
	var start = get_closest_point(pos)
	var newDude = enemyDudeScene.instance()
	newDude.global_position = Vector2()
	add_child(newDude)
	var target = get_closest_point(GM.currentBase.position)
	var path = get_simple_path(start,target,true)
	newDude.move(path)