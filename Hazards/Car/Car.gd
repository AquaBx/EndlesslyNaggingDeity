extends CharacterBody2D



const CAR_SPEED = 400

func _physics_process(delta):
	velocity = CAR_SPEED * Vector2(1, 0)
	move_and_slide()

func _on_lifespan_timeout():
	queue_free()
