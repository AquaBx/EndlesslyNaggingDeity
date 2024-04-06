extends Node2D

var ejection_speed = 1

func _process(delta):
	%PathFollow2D.progress += 10*ejection_speed
	%PathFollow2D.progress = int(%PathFollow2D.progress)%802# length of progress
	%doll.rotation += 10*ejection_speed
	ejection_speed += 0.2*delta
