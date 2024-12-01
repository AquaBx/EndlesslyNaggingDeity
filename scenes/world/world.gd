extends Node2D
var shader = preload("res://scenes/nuit.gdshader")

var first_death = true

var succes = 0

const TEST = false

var end_message = false

var death_1 = false
var death_2 = false
var death_3 = false
var death_4 = false
var death_5 = false
var death_6 = false

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
	%DogArea.day = false
	%WolfArea.night = true
	death_5 = true
	print("death_5=true")

func _on_player_death(death_message: String):
	
	if death_message == "Tu est mort ecraser par une porte :(":
		death_1=true
		print("death_1=true")
	if death_message == "les voitures c'est vraiment pas nice ! \n Aussi Dieu les supprime":
		death_2=true
		print("death_2=true")
	if death_message == "Dieu n'aime pas que vous vous cassiez la tête.\nDieu a donc retiré les questions de ce monde.":
		death_3=true
		print("death_3=true")
	if death_message == "il est tombé sur toi, dommage...":
		death_4=true
		print("death_4=true")
	if death_message == "Tu as été tué par un KANARD-GAROU\n rip":
		death_6=true
		print("death_6=true")
	
	if death_1 and death_2 and death_3 and death_4 and death_5 and death_6 and not end_message:
		%Bar.queue_free()
		end_message = true
	
	%DialogueCenter.stop_msg()
	%Death_screen.visible = true
	
	%DialogueCenter.visible = false

	%Player.frozen = true
	%DeathLabel.text = death_message
	
	%DeathScreenAnimationPlayer.play("fade in")

	await get_tree().create_timer(1.).timeout
	
	%DeathLabel.show()
	
	if death_message != "Dieu est fier de vous 😊" and first_death:
		await get_tree().create_timer(4.).timeout
		%DeathLabel.text = "Dieu surpris ressucita alors son Messi"
		await get_tree().create_timer(4.).timeout
		%DeathLabel.text = "Pour garentir la sécurité du petit être Dieu supprima toutes les portes qui pouvaient être ouverte.\r Ainsi il ne pourrait pas mourir à nouveaux et pourra continuer sa quête."
		await get_tree().create_timer(8.).timeout
		%DeathLabel.text = "C'est à ce moment que le petit dinosaure découvrit\r un moyen de sortir de cette boucle eternelle."
		await get_tree().create_timer(4.).timeout
		%DeathLabel.text = "En mourrant il pourra enfin atteindre sa fin."
	
	if death_message == "Dieu est fier de vous 😊" and succes == 2 and first_death:
		await get_tree().create_timer(4.).timeout
		%DeathLabel.text = "Mais le petit dinosaure commencait à s'ennuyer dans cette boucle eternelle.\r Il voulait trouver autre chose"
		
	if end_message:
		await get_tree().create_timer(4.).timeout
		%DeathLabel.text = "Un bruit de metal résonne au loin. \r La porte est ouverte ..."
		
		

	await get_tree().create_timer(4.).timeout
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
		succes_1()
		
	if death_message == "Dieu est fier de vous 😊":
		succes += 1
		
	if succes == 2 and first_death:
		await get_tree().create_timer(13).timeout
		print("world: door_glow")
		$House.door_glow()
		
		
	

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


func _on_bug_end_game():
	%Pool.queue_free()
	material.set_shader_parameter("day",true)
	$House.set_day(true)
	%DialogueCenter.play_dialogue("dieu", "pressed corruption")
	%Death_screen.visible = true
	%DeathLabel.text = "La corruption source de destruction offrit alors une ultime solution au petit dinosaure\r Une solution qui lui permettrait de tout arreter."
	%DeathLabel.hide()
	%Plant.end_mode()
	%Player.frozen=true
	
	for i in range(100):
		%Bug.scale_up()
		await get_tree().create_timer(0.005).timeout
		if i == 60:
			%DeathScreenAnimationPlayer.play("fade in")
	%DeathLabel.show()
	
	await get_tree().create_timer(5.).timeout
	
	%DeathScreenAnimationPlayer.play("fade out")
		
	%Player.destruction_zone_on()
	%Bug.hide()
	await get_tree().create_timer(5.).timeout
	%CB1.corrupt()
	await get_tree().create_timer(1.).timeout
	%CB2.corrupt()
	%CB3.corrupt()
	await get_tree().create_timer(0.6).timeout
	%DialogueCenter.play_dialogue("dieu", "corruption")
	await get_tree().create_timer(7).timeout
	%Background2.queue_free()
	%HouseArea.end = true


func _on_plant_end():
	%Player.frozen = true
	%Player.stop_action()
	var old_zoom = %HouseInteriorCamera.zoom
	%DialogueCenter.play_dialogue("dieu", "end_1")
	%HouseInteriorCamera.zoom = Vector2(7, 7)
	await get_tree().create_timer(11).timeout
	%Plant.end_anim()
	await get_tree().create_timer(1).timeout
	%Plant.hide()
	%Plant.queue_free()
	await get_tree().create_timer(27.5).timeout
	%House.hide()
	%House.almost_destroyed = true
	%House.queue_free()
	%Props.queue_free()
	%Batiments.queue_free()
	%main_theme.queue_free()
	await get_tree().create_timer(1).timeout
	%DialogueCenter.play_dialogue("dieu", "end_2")
	await get_tree().create_timer(3).timeout
	$Background.hide()
	await get_tree().create_timer(1).timeout
	%DialogueCenter.play_dialogue("dieu", "end_3")
	await get_tree().create_timer(5).timeout
	$CanvasLayer2/DialogueCenter.queue_free()
	get_tree().quit()
	
