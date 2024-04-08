extends StaticBody2D

var fallen: bool = false

signal echauff_tombe
signal set_foreground

func _physics_process(_delta):
	if not fallen: %AnimationPlayer.play("idle")

func glow():
	print("glow")
	%Interact.visible = true
	%Node2D.visible = false

func unglow():
	print("unglow")
	if not fallen:
		%Interact.visible = false
		%Node2D.visible = true
	
	
func action(player):
	emit_signal("set_foreground")
	unglow()
	%AnimationPlayer.play("tombe")
	fallen = true
	player.frozen = true
	var old_zoom = player.get_node("Camera2D").zoom
	player.get_node("Camera2D").zoom = Vector2(6, 6)
	await get_tree().create_timer(2).timeout
	player.get_node("Dino").hide()
	player.get_node("Camera2D").zoom = old_zoom
	#await get_tree().create_timer(1).timeout
	echauff_tombe.emit("il est tombé sur toi, dommage...")
	await get_tree().create_timer(2).timeout
	queue_free()
