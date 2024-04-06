extends Node2D



func _on_timer_timeout():
	var new_car = preload("res://Hazards/Car/car.tscn").instantiate()
	new_car.get_node("Area2D").body_entered.connect(death)
	add_child(new_car)



func death(body):
	
	const gdeath = preload("res://death/generic_death.tscn")
	var deathOverlay = gdeath.instantiate()
	deathOverlay.show_overlay()
	add_child(deathOverlay)
	
	await get_tree().create_timer(5.0).timeout
	
	queue_free()
