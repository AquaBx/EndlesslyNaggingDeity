extends CharacterBody2D

const SPEED = 3500
const FRICTION = 10
const SEUIL = 349

func _physics_process(delta):
	var direction = Input.get_vector("left","right","forward","backward")
	
	if direction.x != 0.0:
		%Dino.scale.x = int(direction.x > 0)*2 -1
	
	var acceleration = direction * SPEED \
					 - velocity * FRICTION
					
	velocity += acceleration * delta
	if velocity.length() < 10:
		velocity = Vector2(0,0)
	
	if velocity.length() != 0 :
		%Dino.play_walk_animation()
	else :
		%Dino.play_idle_animation()
	
	move_and_slide()
	
	if Input.is_action_just_pressed("interact"):
		var collisioned_objects = %ActionZone.get_overlapping_bodies()
		if collisioned_objects.size() > 0:
			for object in collisioned_objects:
				if object.has_method("action"):
					object.action()
					break
