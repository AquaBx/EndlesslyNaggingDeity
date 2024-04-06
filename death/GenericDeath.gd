extends Node

func _ready():
	pass
	#$Car.connect("player_death", self, "_on_player_dead")

func show_overlay():
	%DeathOverlay.visible = true
