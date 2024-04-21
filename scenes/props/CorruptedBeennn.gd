extends StaticBody2D

func corrupt():
	%AnimationPlayer.play("corruption")
	await get_tree().create_timer(1.65).timeout
	queue_free()
