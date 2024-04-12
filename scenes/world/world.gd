extends Node2D
var shader = preload("res://scenes/nuit.gdshader")

var first_death = true

var succes = 0

const TEST = true

func _ready():
	%Player.global_position = %PlayerSpawn.global_position
	#%DeathScreen.get_child(0).color = Color(0,0,0,0)
	#%DeathLabel.hide()
	$House.set_day(true)
	material.set_shader_parameter("day",true)
	$HouseInteriorCamera.make_current()
	if not TEST:
		%Player.frozen=true
		god_mission()
		await get_tree().create_timer(22).timeout
		%Player.frozen=false
	
	

func deathloupe(death_message: String):
	_on_player_death(death_message)
	await get_tree().create_timer(2.).timeout
	$House.set_day(false)
	get_node("Interactable/Niche").set_night()
	material.set_shader_parameter("day",false)

func _on_player_death(death_message: String):
	%Death_screen.visible = true
	
	%DialogueCenter.visible = false

	%Player.frozen = true
	%DeathLabel.text = death_message
	
	%DeathScreenAnimationPlayer.play("fade in")

	await get_tree().create_timer(1.).timeout
	
	%DeathLabel.show()

	await get_tree().create_timer(2.).timeout
	%DeathScreenAnimationPlayer.play("fade out")

	%Player.global_position = %PlayerSpawn.global_position
	%Player.get_node("Dino").rotation = 0
	if (not first_death or death_message == "Dieu est fier de vous 😊") or TEST:
		%Player.frozen = false
	
	%Player.get_node("Dino").show()

	%Player.show()
	await get_tree().create_timer(2.).timeout

	%DeathLabel.hide()
	%Death_screen.visible = false
	%DeathLabel.set("theme_override_colors/font_color",Color(255, 255, 255, 1))
	
	#if death_message == "Dieu est fier de vous 😊":
		#var info = Achievements.get_info("bontoutou")
		#$NotificationCenter.push_notif("bontoutou", info.description, info.icon)

	if death_message != "Dieu est fier de vous 😊" and first_death and not TEST:
		print("passe")
		first_death = false
		god_descends()
	
	if death_message == "Dieu est fier de vous 😊" and succes == 0 and not TEST:
		#succes += 1
		succes_1()
		
	

func _on_interior_detect_area_entered(_area: Area2D) -> void:
	# the player entered the house
	$HouseInteriorCamera.make_current()

func god_mission():
	%DialogueCenter.play_dialogue("dieu", "intro_number_1")
	
	
func god_descends():
	%Player.frozen = true
	%DialogueCenter.set_dot()
	var god = preload("res://god_canvas.tscn").instantiate()
	$CanvasLayer2.add_child(god)
	await get_tree().create_timer(5).timeout
	print("avant le dialogue")
	%DialogueCenter.play_dialogue("narrateur", "died_from_door")
	print("après le dialogue")
	await get_tree().create_timer(23).timeout
	%Player.frozen = false
	god.queue_free()
	
func succes_1():
	print("succes 1")
	%DialogueCenter.play_dialogue("dieu", "success_number_1")
	


func _on_house_first_exit():
	%DialogueCenter.play_dialogue("dieu", "exit")


func _on_main_theme_finished():
	%main_theme.play()




func _on_player_destruction(body):
	body.queue_free()
