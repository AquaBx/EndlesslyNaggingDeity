extends CharacterBody2D

const SPEED = 1000
const FRICTION = 5
const SEUIL = 349

var m_object:Object
var frozen: bool = false
var colliding_objects = []

func _physics_process(delta):
	if(self.frozen): return
	
	var direction = Input.get_vector("left","right","forward","backward")
	
	if direction.x != 0.0:
		%Dino.scale.x = int(direction.x > 0)*2 -1
		%ActionZone.scale.x = int(direction.x > 0)*2 -1
	
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
	
	colliding_objects.sort_custom(custom_sort_function)
	if(colliding_objects.size() != 0):
		if m_object != null:
			m_object.unglow()
		m_object = colliding_objects[0]
		m_object.glow()
	
	if Input.is_action_just_pressed("interact") and m_object:
		m_object.action(self)

func custom_sort_function(a, b):
	return a.transform.origin.distance_squared_to(self.position) < b.transform.origin.distance_squared_to(self.position)

func _on_action_zone_body_entered(body):
	if(body == self):
		print("entered myself")
		return
	print(colliding_objects.size())

	print("entered", body)
	if body.has_method("action") and body.has_method("glow"):
		colliding_objects.append(body)
		

func _on_action_zone_body_exited(body):
	colliding_objects.erase(body)
	if m_object == body:
		m_object.unglow()
		m_object = null # safety
	

	
func set_day(c : bool):
	if c:
		material.set_shader_parameter("day",true)
	else:
		material.set_shader_parameter("day",false)


func _on_interior_detect_area_exited(_area: Area2D) -> void:
	# on quitte la maison
	$Camera2D.make_current()
