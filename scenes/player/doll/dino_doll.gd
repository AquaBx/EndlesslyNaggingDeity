extends Node2D

var ejection_speed = 1

func _process(_delta):
	%PathFollow2D.progress += ejection_speed
	%PathFollow2D.progress = int(%PathFollow2D.progress) % 326 # length of progress
	%doll.rotation += 10*ejection_speed
