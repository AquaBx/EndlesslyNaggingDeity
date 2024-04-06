extends Node

# Call all the tests
func _ready() -> void:
	test_achievement()

# Test Achievement class functionnalities
func test_achievement() -> void:

	

	var info := Achievements.get_info("bontoutou")
	assert(info.succeded == false)
	assert(info.description.length() != 0)
	assert(info.icon.length() != 0)

	

	Achievements.set_success("bontoutou", true)
	info = Achievements.get_info("bontoutou")
	assert(info.succeded)

	

