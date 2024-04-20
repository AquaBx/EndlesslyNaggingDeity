extends StaticBody2D

signal plant_cut
var is_cut = false
signal end_game

func _ready():
	%Interact.visible = false
	$Node2D/AnimationPlayer.play("idle")
	$Interact/AnimationPlayer.play("idle")

func glow():
	if not is_cut:
		%Interact.show()
		$Node2D.hide()
		$Interact/AnimationPlayer.play("idle")

func unglow():
	%Interact.hide()
	$Node2D.show()
	$Node2D/AnimationPlayer.play("idle")
	%Interact.visible = false

func action(player):
	is_cut = true
	unglow()
	end_game.emit()
	
func scale_up():
	$Node2D.scale += Vector2(0.1,0.1)
