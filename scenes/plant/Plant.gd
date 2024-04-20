extends StaticBody2D

signal plant_cut
var is_cut = false
var is_end_mode = false
signal end

func _ready():
	%Interact.visible = false

func glow():
	if not is_cut:
		%Interact.show()

func unglow():
	%Interact.hide()
	%Interact.visible = false

func action(player):
	if is_end_mode:
		unglow()
		end.emit()

	else :
		player.frozen=true
		is_cut = true
		unglow()

		%Anim.play("cut")
		
		await get_tree().create_timer(2.).timeout
			
		plant_cut.emit("Dieu est fier de vous 😊")
		await get_tree().create_timer(1.).timeout
		is_cut = false
		$Node2D/Sprite.set("frame",0)
		
func end_anim():
	%Anim.play("corruption")
		
	

func end_mode():
	is_end_mode = true
	print("corrupted")
	%Interact/Glow.material.set_shader_parameter("Corrupt",true)
	print(%Interact/Glow.material.get_shader_parameter("Corrupt"))
	

