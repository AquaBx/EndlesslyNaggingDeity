extends Node2D


func _on_interior_detect_area_entered(area):
	%Exterior.visible = false
	%Interior.visible = true
	area.get_parent().setLighten(true)

func _on_interior_detect_area_exited(area):
	%Exterior.visible = true
	%Interior.visible = false
	area.get_parent().setLighten(false)



func _on_player_death():
	pass # Replace with function body.
