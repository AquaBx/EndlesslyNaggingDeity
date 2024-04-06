extends Node

class AchievementInfo:
	var succeded := false
	var description: String
	var icon: String

	func _init(desc: String, _icon: String):
		self.description = desc
		self.icon = _icon

var achievements := {
	"bontoutou": AchievementInfo.new("Vous avez réussi à obéir, félicitation !", "res://Assets/dino1.png")
}

func get_info(id: String) -> AchievementInfo:
	return self.res.achievements[id]

func set_success(id: String, val: bool) -> void:
	self.res.achievements[id].succeeded = val
