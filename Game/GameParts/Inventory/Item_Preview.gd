extends Control

var item_source

func setTexture(tex):
	$Item.texture = tex
	

func _exit_tree():
	item_source.drag_ended()