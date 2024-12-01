extends StaticBody2D

signal player_death
var dead = false

func action(player):
	dead = true
	%Interact.hide()
	player.frozen = true
	player.get_node("Dino").play_deathblock_animation()
	%AnimationPlayer.play("mariojump")
	await get_tree().create_timer(1.5).timeout
	
	
	player_death.emit("Dieu n'aime pas que vous vous cassiez la tête.\nDieu a donc retiré les questions de ce monde.")
	await get_tree().create_timer(1).timeout
	queue_free()

func glow():
	%Interact.show()

func unglow():
	if not dead:
		%Interact.hide()
