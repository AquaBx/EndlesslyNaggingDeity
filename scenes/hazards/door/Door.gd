extends StaticBody2D

signal player_dead
var dead = false

func _ready():
	%Interact.visible = false
	
func glow():
	return
	
func unglow():
	if not dead:
		return
		
func s_glow():
	print("Door: door_glow")
	$AnimationPlayer.play("knock")
	await get_tree().create_timer(.6).timeout
	%Interact.visible = true
	
func s_unglow():
	if not dead:
		%Interact.visible = false

func action(player):
	print("collided")
	
	
	
	player.frozen = true
	await get_tree().create_timer(.5).timeout
	s_unglow()
	dead = true
	%DoorClosed.visible = false
	%dino_dead.visible = true
	%DoorOpen.visible = true
	player.visible = false
	$AudioStreamPlayer2D.play()
	
	await get_tree().create_timer(2.).timeout
	player_dead.emit("Tu est mort ecraser par une porte :(")
	
	await get_tree().create_timer(1).timeout
	
	#player.frozen = false
	player.visible = true
	queue_free()
