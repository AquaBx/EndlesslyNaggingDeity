extends Control

# quand tu meure, tu recoit une clé en paramètre
const dialogues = {
	"dieu": {
		"intro_number_1": [""],
		
		"died_from_door": [""],
		"died_from_car": [""],
		"died_from_magnifier": [""],
		"died_from_pool": [""],
		"died_from_block": [""],
		
		"success_number_1": [""],
		"success_number_2": [""],
		"success_number_3": [""],
		"success_number_4": [""],
		"success_number_5": [""],
		"success_number_6": [""],
		"success_number_7": [""],
		"success_number_8": [""],
		"success_number_9": [""],
		"success_number_10": [""],
	},
	"narrateur": {
		"died_from_door": [""],
		"died_from_car": [""],
		"died_from_magnifier": [""],
		"died_from_pool": [""],
		"died_from_block": [""],
	}
}

func play_dialogue(character: String, id: String) -> void:
	self.visible = true
	for line in dialogues[character][id]:
		$Sprite2D/RichTextLabel.text = line
		await get_tree().create_timer(4).timeout
	self.visible = false
