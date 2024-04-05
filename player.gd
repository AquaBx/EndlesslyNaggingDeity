extends CharacterBody2D

func _physics_process(delta):
	var direction = Input.get_vector("left","right","forward","backward")
	position += direction * 300 * delta
	move_and_slide()
