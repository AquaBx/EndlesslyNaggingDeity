extends StaticBody2D

signal player_dead

func _ready():
	%Interact.visible = false
	
func glow():
	%Interact.visible = true
	
func unglow():
	%Interact.visible = false

func action(player):
	print("collided")
	
	player.frozen = true
	await get_tree().create_timer(.5).timeout
	unglow()
	%DoorClosed.visible = false
	%dino_dead.visible = true
	%DoorOpen.visible = true
	player.visible = false
	$AudioStreamPlayer2D.play()
	
	await get_tree().create_timer(2.).timeout
	player_dead.emit("Tu est mort à cause d'une porte ! Dieu décida donc de détruire les portes.")
	
	await get_tree().create_timer(1).timeout
	
	#player.frozen = false
	player.visible = true
	queue_free()
