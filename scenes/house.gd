extends Node2D

signal first_exit
var has_exited = false
var almost_destroyed = false

func _on_interior_detect_area_entered(area):
	%Exterior.visible = false
	%Interior.visible = true
	area.get_parent().set_day(true)
	area.get_parent().hide_zone()
	

func _on_interior_detect_area_exited(area):
	if not almost_destroyed:
		if not has_exited:
			first_exit.emit()
			has_exited = true
		%Exterior.visible = true
		%Interior.visible = false
		area.get_parent().set_day(false or %Exterior.get_node("ExtWalls").material.get_shader_parameter("day"))
		area.get_parent().show_zone()

func set_day(c:bool):
	if c :
		%Exterior.get_node("ExtWalls").material.set_shader_parameter("day",true)
	else:
		%Exterior.get_node("ExtWalls").material.set_shader_parameter("day",false)

func _on_player_death():
	pass # Replace with function body.
	
func door_glow():
	print("House: door_glow")
	$Door.s_glow()
