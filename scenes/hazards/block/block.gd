extends StaticBody2D

signal player_death

func action(player):
	%Glow.hide()
	player.frozen = true
	player.get_node("Dino").play_deathblock_animation()
	await get_tree().create_timer(.25).timeout
	%AnimationPlayer.play("mariojump")
	
	player_death.emit("Dieu n'aime pas que vous vous preniez pour un plombier.\nDieu a donc retiré les blocs bonus de ce monde.")
	await get_tree().create_timer(1).timeout
	queue_free()

func glow():
	%Glow.show()

func unglow():
	%Glow.hide()
