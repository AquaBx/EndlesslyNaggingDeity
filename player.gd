extends CharacterBody2D

const SPEED = 3500
const FRICTION = 10
const SEUIL = 349

var m_object:Object

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
	
	if Input.is_action_just_pressed("interact") and m_object:
		m_object.action()

func _on_action_zone_body_entered(body):
	if body.has_method("action") and body.has_method("glow"):
		m_object = body
		m_object.glow()

func _on_action_zone_body_exited(body):
	if m_object != null:
		m_object.unglow()
	m_object = null
