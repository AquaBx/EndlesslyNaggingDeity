extends StaticBody2D


signal plant_cut
var is_cut = false

func glow():
	print("glowin")
	if not is_cut:
		pass
	pass

func unglow():
	pass

func action():
	is_cut = true
	unglow()
	print("action")
	%Anim.play("cut")
	plant_cut.emit()
