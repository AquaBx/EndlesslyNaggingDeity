extends Node2D

var first_death = true

func _ready():
	#%DeathScreen.get_child(0).color = Color(0,0,0,0)
	#%DeathLabel.hide()
	$HouseInteriorCamera.make_current()

func _on_player_death(death_message: String):
	
	print("Salut, je suis mort ", death_message, " je suis déjà mort : first_death = ", first_death)
	%Player.frozen = true
	%DeathLabel.text = death_message
	
	%DeathScreenAnimationPlayer.play("fade in")	

	await get_tree().create_timer(1.).timeout
	
	%DeathLabel.show()

	await get_tree().create_timer(2.).timeout
	%DeathScreenAnimationPlayer.play("fade out")

	%Player.global_position = %PlayerSpawn.global_position
	%Player.get_node("Dino").rotation = 0
	if not first_death or death_message == "Dieu est content de vous 😊":
		%Player.frozen = false
	%Player.get_node("Dino").show()
	
	await get_tree().create_timer(2.).timeout
	%DeathLabel.hide()
	%DeathLabel.set("theme_override_colors/font_color",Color(255, 255, 255, 1))
	if death_message != "Dieu est content de vous 😊" and first_death:
		first_death = false
		god_descends()

func _on_interior_detect_area_entered(_area: Area2D) -> void:
	# the player entered the house
	$HouseInteriorCamera.make_current()
	
func god_descends():
	%Player.frozen = true
	var god = preload("res://god.tscn").instantiate()
	god.global_position = %Player.global_position + Vector2(0,-25)
	add_child(god)
	await get_tree().create_timer(12).timeout
	%Player.frozen = false
	god.queue_free()
	
	
