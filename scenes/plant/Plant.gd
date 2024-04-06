extends StaticBody2D


signal plant_cut
var is_cut = false

func _ready():
	%Interact.visible = false

func glow():
	print("glowin")
	if not is_cut:
		%Glow.show()
	%Interact.visible = true

func unglow():
	%Glow.hide()
	%Interact.visible = false

func action(player):
	is_cut = true
	unglow()

	%Anim.play("cut")
	
	await get_tree().create_timer(2.).timeout
		
	plant_cut.emit("Dieu est content de vous 😊")
	await get_tree().create_timer(1.).timeout
	is_cut = false
	$Node2D/Sprite.set("frame",0)
	
