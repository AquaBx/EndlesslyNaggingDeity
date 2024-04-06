extends Node2D

signal interactloupe

func _ready():
	%Interact.visible = false
	$Node2D.play_animation_loop()
	

func action(player):
	visible=false
	player.frozen = true
	player.get_node("Dino").play_deathloupe_animation()
	await get_tree().create_timer(2.9).timeout
		
	interactloupe.emit("Il est mort avec une loupe, de ce fait, Dieu supprima la loupe !")
	queue_free()
	
	
func glow():
	%Interact.visible = true
	
func unglow():
	%Interact.visible = false

