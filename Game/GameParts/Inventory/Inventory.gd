extends Control

func _ready():
	print(find_free_slot())

func find_free_slot():
	for x in $Layout.get_child_count() :
		if($Layout.get_child(x).item_ID == 0):
			return $Layout.get_child(x)
	return 0

func add_item(item_ID):
	pass