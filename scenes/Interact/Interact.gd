extends Node2D


func _process(_delta):
	if Input.get_joy_name(0) != "":
		%BtnA.visible = true
		%BtnE.visible = false
	else:
		%BtnA.visible = false
		%BtnE.visible = true
	queue_redraw()
	

