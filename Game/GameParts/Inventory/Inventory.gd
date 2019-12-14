extends Control

func _ready():
	GM.currentInventory = self

func find_free_slot():
	for x in $Layout.get_child_count() :
		if($Layout.get_child(x).item_ID == 0):
			return $Layout.get_child(x)
	return 0

func add_item(item_ID):
	var freeSlot = find_free_slot()
	if (freeSlot is int):
		$Warning/AnimationPlayer.play("New Anim")
		return false
	else:
		freeSlot.change_item(item_ID)
		return true