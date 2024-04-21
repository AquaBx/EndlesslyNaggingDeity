extends Area2D

var day = true

@onready var dialogue = get_node("/root/World/CanvasLayer2/DialogueCenter")

func _on_body_entered(body):
	if day:
		dialogue.play_dialogue("dieu", "entered_dog_area")
	else:
		queue_free()
