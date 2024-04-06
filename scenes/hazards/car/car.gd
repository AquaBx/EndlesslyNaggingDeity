extends StaticBody2D

const CAR_SPEED = 50
var direction = 1  # 1 is for right

func _physics_process(delta):
	var velocity = direction * CAR_SPEED * Vector2(1, 0)
	position += velocity * delta

func _on_lifespan_timeout():
	queue_free()
