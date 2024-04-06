extends Node2D

func _ready():
	%Interact.visible = false

func action():
	$Node2D/AnimationPlayer.play("pickup")
	
func glow():
	%Interact.visible = true
	
func unglow():
	%Interact.visible = false
