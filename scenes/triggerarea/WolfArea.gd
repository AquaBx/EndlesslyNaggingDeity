extends Area2D

var night = false
@onready var dialogue = get_node("/root/World/CanvasLayer2/DialogueCenter")

func _on_body_entered(body):
	if night :
		dialogue.play_dialogue("dieu", "entered_wolf_area")
		queue_free()
