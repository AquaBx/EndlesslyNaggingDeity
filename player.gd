extends CharacterBody2D


const SPEED = 2000
const FRICTION = 8

func _physics_process(delta):
	var direction = Input.get_vector("left","right","forward","backward")
	
	var acceleration = direction * SPEED \
					 - velocity * FRICTION
					
	velocity += acceleration * delta
	move_and_slide()
