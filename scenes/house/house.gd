extends Node2D


func _on_interior_detect_area_entered(area):
	%Exterior.visible = false
	%Interior.visible = true

func _on_interior_detect_area_exited(area):
	%Exterior.visible = true
	%Interior.visible = false
