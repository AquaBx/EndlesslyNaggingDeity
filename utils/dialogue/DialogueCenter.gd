extends Control

# quand tu meure, tu recoit une clé en paramètre
const dialogues = {
	"dieu": {
		"intro_number_1": ["Bonjour petit être. Je sais que tu viens de te reveiller mais j'ai besoin de ton attention.
		Tu porte sur tes bras les espoirs de ce monde, de ton monde. Pour le sauvre le messi que tu est doit accomplire une tache complexe !
		Couper la plante devant toi !!!"],
		
		"died_from_door": [""],
		"died_from_car": [""],
		"died_from_magnifier": [""],
		"died_from_pool": [""],
		"died_from_block": [""],
		
		"success_number_1": ["Bien joué petit bonhome maintenant que tu as sauver le monde tu as le droit de recommancer ! Quelle joie d'être en vie n'est ce pas ."],
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
		"died_from_door": ["Tu n'était pas censer mourir ! Ne me rajoute pas de travaille pour te ressuciter comme ca ! Ta quête est vitale pour yon monde alors ne me force pas a faire disparaitre d'autres bout de l'existance contrairement à la mort je ne peut pas les ramener."],
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
