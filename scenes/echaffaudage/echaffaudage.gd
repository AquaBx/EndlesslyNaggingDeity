extends StaticBody2D

var fallen: bool = false

signal echauff_tombe

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
	
	unglow()
	%AnimationPlayer.play("tombe")
	self.z_index = 2
	fallen = true
	player.frozen = true
	await get_tree().create_timer(2).timeout
	player.get_node("Dino").hide()
	#await get_tree().create_timer(1).timeout
	echauff_tombe.emit("il est tombed")
	await get_tree().create_timer(2).timeout
	queue_free()
