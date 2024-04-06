extends StaticBody2D

const CAR_SPEED = 100


func _physics_process(delta):
	var velocity = CAR_SPEED * Vector2(1, 0)
	position += velocity * delta

func _on_lifespan_timeout():
	queue_free()
