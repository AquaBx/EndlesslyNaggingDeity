extends Node2D

func play_idle_animation():
	$AnimationPlayer.play("idle")
	
func play_walk_animation():
	$AnimationPlayer.play("walk")
	
func play_drive_animation():
	$AnimationPlayer.play("drive")
	
func play_deathloupe_animation():
	$AnimationPlayer.play("deathloupe")

func play_animation_loop():
	$AnimationPlayer.play("pickup")
