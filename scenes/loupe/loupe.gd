extends Node2D

func _ready():
	%Interact.visible = false
	$Node2D.play_animation_loop()
	

func action():
	pass
	
func glow():
	%Interact.visible = true
	
func unglow():
	%Interact.visible = false

