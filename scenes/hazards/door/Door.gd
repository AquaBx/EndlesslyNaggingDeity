extends StaticBody2D


signal player_dead

func _ready():
	%Interact.hide()
	
func glow():
	%Interact.show()
	
func unglow():
	%Interact.hide()

func action(player):
	print("collided")
	
	player.frozen = true
	await get_tree().create_timer(.5).timeout
	unglow()
	%DoorClosed.hide()
	%DoorOpen.show()
	%BloodSplash.show()
	player.hide()
	$AudioStreamPlayer2D.play()
	
	await get_tree().create_timer(2.).timeout
	player_dead.emit("Tu est mort à cause d'une porte ! Dieu décida donc de détruire les portes.")
	
	await get_tree().create_timer(1).timeout
	
	player.frozen = false
	player.show()
	queue_free()
