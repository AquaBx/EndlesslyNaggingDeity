extends Node2D

@export var player : CharacterBody2D
@export var CarSpawnWest : Marker2D
@export var CarSpawnEast : Marker2D

const SPAWNER_LENGTH = 100
const CAR: Resource = preload("res://scenes/hazards/car/car.tscn")
var new_car

signal player_death

func spawn_car():
	new_car = CAR.instantiate()

	new_car.get_node("Area2D").body_entered.connect(car_touched_player)
	
	var dir = [-1, 1].pick_random()  # determine if the car goes to the left or right
	new_car.direction = dir

	#var ctrans = get_canvas_transform()
	if dir == 1:
		new_car.global_position = CarSpawnWest.global_position
	else:
		new_car.global_position = CarSpawnEast.global_position
		new_car.scale.x *= -1
	add_child(new_car)

func car_touched_player(_body):
	new_car.car_speed = 0
	
	player.get_node("Dino").hide()
	var dino_doll = DINO_DOLL.instantiate()
	dino_doll.global_position = player.global_position
	add_sibling(dino_doll)
	await get_tree().create_timer(5).timeout
	dino_doll.queue_free()
	player_death.emit("les voitures c'est vraiment pô nice ! \n Ainsi Dieu Surpprima les voitures")
	await get_tree().create_timer(2).timeout
	queue_free()

const DINO_DOLL: Resource = preload("res://scenes/player/doll/dino_doll.tscn")
