extends Node2D

@export var player : CharacterBody2D
const SPAWNER_LENGTH = 100

func spawn_car():
	var new_car = preload("res://hazards/car/car.tscn").instantiate()
	new_car.get_node("Area2D").body_entered.connect(death)
	new_car.position = Vector2(0, 0)
	print(global_position, new_car.position)
	
	var dir = [-1, 1].pick_random()  # determine if the car goes to the left or right
	print(dir)
	new_car.direction = dir
	print(player.position)
	var ctrans = get_canvas_transform()
	if dir == 1:
		new_car.position.y += 20
		#new_car.global_position.x = player.global_position.x - 20
	else:
		#new_car.global_position.x = player.global_position.x + 20
		new_car.position.x += SPAWNER_LENGTH
		new_car.scale = Vector2(-1, 1)
	print(new_car.global_position)
	add_child(new_car)



func death(body):
	
	const gdeath = preload("res://death/generic_death.tscn")
	var deathOverlay = gdeath.instantiate()
	deathOverlay.show_overlay()
	add_child(deathOverlay)
	
	await get_tree().create_timer(5.0).timeout
	
	queue_free()
