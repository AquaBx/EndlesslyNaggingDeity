extends Area2D


@export var player : CharacterBody2D

func _on_body_entered(body):
	if player != body:
		return
	
	await get_tree().create_timer(.5).timeout
	$"Door-placeholder".visible = false
	$"Door-open-placeolder".visible = true
	$"BloodSplash".visible = true
	player.frozen = true
	player.visible = false

	
