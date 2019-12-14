extends Control

var can_take_gems = true

func can_drop_data(position, data):
	if(can_take_gems):
		return true

func drop_data(position, data):
	print("gem: ",data[0])
	data[1].change_item(0)
	

func pass_gem():
	#a refence to the parnt of this node will go here
	pass