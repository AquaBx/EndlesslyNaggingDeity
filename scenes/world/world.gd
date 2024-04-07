extends Node2D
var shader = preload("res://scenes/nuit.gdshader")


func _ready():
	#%DeathScreen.get_child(0).color = Color(0,0,0,0)
	#%DeathLabel.hide()
	$House.set_day(true)
	material.set_shader_parameter("day",true)
	$HouseInteriorCamera.make_current()

func deathloupe(death_message: String):
	_on_player_death(death_message)
	$House.set_day(false)
	material.set_shader_parameter("day",false)

func _on_player_death(death_message: String):
	%Player.frozen = true
	%DeathLabel.text = death_message
	
	%DeathScreenAnimationPlayer.play("fade in")	

	await get_tree().create_timer(1.).timeout
	
	%DeathLabel.show()

	await get_tree().create_timer(2.).timeout
	%DeathScreenAnimationPlayer.play("fade out")
	
	%Player.global_position = %PlayerSpawn.global_position
	%Player.get_node("Dino").rotation = 0

	%Player.get_node("Dino").show()

	%Player.show()
	%Player.frozen = false
	await get_tree().create_timer(2.).timeout

	%DeathLabel.hide()
	%DeathLabel.set("theme_override_colors/font_color",Color(255, 255, 255, 1))
	print("passe")


func _on_interior_detect_area_entered(_area: Area2D) -> void:
	# the player entered the house
	$HouseInteriorCamera.make_current()
