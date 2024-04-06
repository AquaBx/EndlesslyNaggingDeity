extends Node2D



func _on_timer_timeout():
	var new_car = preload("res://Hazards/Car/car.tscn").instantiate()
	add_child(new_car)



func _on_area_2d_body_entered(body):
	const gdeath = preload("res://death/generic_death.tscn")
	var deathOverlay = gdeath.instantiate()
	deathOverlay.show_overlay()
	add_child(deathOverlay)
	
	await get_tree().create_timer(5.0).timeout
	
	queue_free()
