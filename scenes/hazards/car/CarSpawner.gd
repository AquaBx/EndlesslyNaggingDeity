extends Node2D

@export var player : CharacterBody2D
const SPAWNER_LENGTH = 100

signal player_death

func spawn_car():
	var new_car = preload("res://scenes/hazards/car/car.tscn").instantiate()
	new_car.get_node("Area2D").body_entered.connect(car_touched_player)
	new_car.position = Vector2(0, 0)
	print(global_position, new_car.position)
	
	var dir = [-1, 1].pick_random()  # determine if the car goes to the left or right
	print(dir)
	new_car.direction = dir

	var ctrans = get_canvas_transform()
	if dir == 1:
		new_car.position.y += 20
		#new_car.global_position.x = player.global_position.x - 20
	else:
		#new_car.global_position.x = player.global_position.x + 20
		new_car.position.x += SPAWNER_LENGTH
		new_car.scale.x *= -1
	print(new_car.global_position)
	add_child(new_car)

func car_touched_player(body):
	player_death.emit("les voitures c'est vraiment pô nice ! \n Ainsi Dieu Surpprima les voitures")
	queue_free()
