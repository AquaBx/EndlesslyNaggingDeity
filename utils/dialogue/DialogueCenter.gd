extends Control

# quand tu meure, tu recoit une clé en paramètre
const dialogues = {
	"dieu": {
		"intro_number_1": ["Bonjour petit être.",
							"Je sais que tu viens de te reveiller\r mais j'ai besoin de ton attention.",
							"Tu porte sur tes bras\r les espoirs de ce monde,\r de ton monde.",
							"Pour le sauver...",
							"le messi que tu est\r doit accomplire\r une tache complexe !",
							"Couper la plante devant toi !!!"],
		
		"exit": ["Non ne part pas par la !","Tu risquerais de mourir :'("],
		
		"died_from_door": [""],
		"died_from_car": [""],
		"died_from_magnifier": [""],
		"died_from_pool": [""],
		"died_from_block": [""],
		
		"success_number_1": ["Bien joué petit bonhome !",
							 "Maintenant que tu as\r sauver le monde tu\r as le droit de recommancer !",
							 "Quelle joie d'être en vie\r n'est ce pas ."],
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
		"died_from_door": ["Tu n'était pas censer mourir !",
						   "Ne me rajoute pas de travaille\r pour te ressuciter comme ca !",
						   "Ta quête est vitale pour ton monde...",
						   "...alors ne me force pas\r a faire disparaitre\r d'autres bouts de l'existance.",
						   "Contrairement à la mort\r quand ils disparaissent\r je ne peut pas les ramener."],
		"died_from_car": [""],
		"died_from_magnifier": [""],
		"died_from_pool": [""],
		"died_from_block": [""],
	}
}

func play_dialogue(character: String, id: String) -> void:
	self.visible = true
	print("dialogue")
	
	for line in dialogues[character][id]:
		$Sprite2D/RichTextLabel.text = "[center]"
		for char in line :
			print(line)
			$Sprite2D/RichTextLabel.text += char
			print($Sprite2D/RichTextLabel.text)
			await get_tree().create_timer(0.07).timeout
		await get_tree().create_timer(0.4).timeout
		
	self.visible = false
