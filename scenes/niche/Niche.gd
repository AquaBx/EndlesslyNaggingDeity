extends StaticBody2D

signal ded_niche
var is_day = true
var dead = false

func set_night():
	print("CEST LA BUIT")
	is_day = false
	%Jour.hide()
	%Nuit.show()
	

func _ready():
	%Interact.visible = false
	%Jour.show()
	%Nuit.hide()
	%ImageFin.hide()

func _process(delta):
	%DayAnimationPlayer.play("idle")
	%NightAnimationPlayer.play("dogo")

func glow():
	if not is_day:
		%Interact.show()

func unglow():
	if not dead:
		%Interact.hide()
	
func action(player):
	dead = true
	print("action")
	if is_day: return 
	unglow()
	player.frozen = true
	
	%ImageFin.show()
	await get_tree().create_timer(2).timeout
	ded_niche.emit("Tu as été tué par un KANARD-GAROU\n rip")
	await get_tree().create_timer(2).timeout
	queue_free()
	print("reaction")
	
	print("passe")
	
