extends StaticBody2D

signal played_ded_echaff




func _on_echaf_echauff_tombe(str):
	
	played_ded_echaff.emit(str)
	await get_tree().create_timer(1).timeout
	queue_free()


func _on_echaf_set_foreground():
	self.z_index = 10
