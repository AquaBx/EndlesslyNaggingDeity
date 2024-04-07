extends StaticBody2D

static var car_speed = 400
var direction = 1  # 1 is for right

func _physics_process(delta):
	%Car.play_drive_animation()
	var velocity = direction * car_speed * Vector2(1, 0)
	position += velocity * delta

func _on_lifespan_timeout():
	queue_free()
