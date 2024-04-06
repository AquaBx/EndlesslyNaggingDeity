extends StaticBody2D


@export var player : CharacterBody2D
signal player_dead

func _on_body_entered(body):
	print("collided")
	
	body.frozen = true
	await get_tree().create_timer(.5).timeout
	%DoorClosed.visible = false
	%DoorOpen.visible = true
	%BloodSplash.visible = true
	body.visible = false
	
	await get_tree().create_timer(2.).timeout
	player_dead.emit("Tu est mort à cause d'une porte ! Dieu décida donc de détruire les portes.")
	
	await get_tree().create_timer(1).timeout
	
	body.frozen = false
	body.visible = true
	queue_free()
