extends Area2D


@export var player : CharacterBody2D

func _on_body_entered(body):
	if player == body:
		$"Door-placeholder".visible = false
		$"Door-open-placeolder".visible = true
