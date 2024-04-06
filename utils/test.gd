extends Node

# Call all the tests
func _ready() -> void:
	test_achievement()

# Test Achievement class functionnalities
func test_achievement() -> void:
	print("-- Test Achievement --")
	
	print("1 :: test get_info:")
	var info := Achievements.get_info("bontoutou")
	assert(info.succeded == false)
	assert(info.description.length() != 0)
	assert(info.icon.length() != 0)
	print("1 :: OK!")
	
	print("2 :: test set_success:")
	Achievements.set_success("bontoutou", true)
	info = Achievements.get_info("bontoutou")
	assert(info.succeded)
	print("2 :: OK!")
	
	print("-- Fin Test Achievement --")
