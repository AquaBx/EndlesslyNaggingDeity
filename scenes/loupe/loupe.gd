extends Node2D

signal interactloupe
var dead = false

func _ready():
	%Interact.visible = false
	$Node2D.play_animation_loop()
	

func action(player):
	dead = true
	visible=false
	player.frozen = true
	player.get_node("Dino").play_deathloupe_animation()
	var old_zoom = player.get_node("Camera2D").zoom
	player.get_node("Camera2D").zoom = Vector2(7, 7)
	await get_tree().create_timer(3.0).timeout
	player.get_node("Camera2D").zoom = old_zoom
		
	interactloupe.emit("Tu t'es brûlé avec une loupe ! Dieu supprima donc le soleil de ce monde.")
	queue_free()

func glow():
	%Interact.visible = true
	
func unglow():
	if not dead:
		%Interact.visible = false

