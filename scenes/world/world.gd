extends Node2D

func _ready():
	%Player.position = %PlayerSpawn.position
	%Player.frozen = false
	%DeathScreen.show()
	%DeathScreen.get_child(0).color = Color(0,0,0,0)
	
func _on_player_death(death_message: String):
	%Player.frozen = true
	#%DeathLabel.text = death_message
	
	%DeathScreenAnimationPlayer.play("fade_in")	
	
	#%DeathScreen.show()
	#await get_tree().create_timer(1.).timeout
	#%DeathLabel.show()
	#%DeathScreen.hide()
	#%DeathLabel.hide()
	#%DeathScreenAnimationPlayer.play("fade_out")
	
	%Player.position = %PlayerSpawn.position
	%Player.frozen = false
