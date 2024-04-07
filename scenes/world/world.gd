extends Node2D

func _ready():
	#%DeathScreen.get_child(0).color = Color(0,0,0,0)
	#%DeathLabel.hide()
	pass

func _on_player_death(death_message: String):
	%Player.frozen = true
	%DeathLabel.text = death_message
	
	%DeathScreenAnimationPlayer.play("fade in")	
	
	await get_tree().create_timer(1.).timeout
	
	%DeathLabel.show()
	
	await get_tree().create_timer(2.).timeout
	%DeathScreenAnimationPlayer.play("fade out")
	
	%Player.global_position = %PlayerSpawn.global_position
	%Player.frozen = false
	%Player.get_node("Dino").show()
	
	await get_tree().create_timer(2.).timeout
	%DeathLabel.hide()
	%DeathLabel.set("theme_override_colors/font_color",Color(255, 255, 255, 1))

