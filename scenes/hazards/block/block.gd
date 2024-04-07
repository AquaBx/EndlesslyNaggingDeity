extends StaticBody2D

signal player_death

func action(player):
	%Interact.hide()
	player.frozen = true
	player.get_node("Dino").play_deathblock_animation()
	await get_tree().create_timer(.25).timeout
	%AnimationPlayer.play("mariojump")
	
	player_death.emit("Dieu n'aime pas que vous vous cassiez la tête.\nDieu a donc retiré les questions de ce monde.")
	await get_tree().create_timer(1).timeout
	queue_free()

func glow():
	%Interact.show()

func unglow():
	%Interact.hide()
