extends Control

var can_take_gems = true

func can_drop_data(position, data):
	if(can_take_gems):
		return true

func drop_data(position, data):
	pass_gem(data[0])
	data[1].change_item(0)
	can_take_gems = false
	

func pass_gem(in_gem):
	get_parent().use_gem(in_gem)
	pass