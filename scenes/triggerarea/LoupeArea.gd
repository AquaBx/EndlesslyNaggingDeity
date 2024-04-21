extends Area2D
@onready var dialogue = get_node("/root/World/CanvasLayer2/DialogueCenter")

func _on_body_entered(body):
	dialogue.play_dialogue("dieu", "entered_loupe_area")
	queue_free()
