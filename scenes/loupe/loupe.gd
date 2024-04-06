extends Node2D

func action():
	$Node2D/AnimationPlayer.play("pickup")
	
func glow():
	%Interact.visible = true
	
func unglow():
	%Interact.visible = false
