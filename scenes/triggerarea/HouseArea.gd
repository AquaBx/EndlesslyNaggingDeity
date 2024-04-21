extends Area2D

var end = false
@onready var dialogue = get_node("/root/World/CanvasLayer2/DialogueCenter")

func _on_body_entered(body):
	if end :
		dialogue.play_dialogue("dieu", "entered_end_area")
		queue_free()
