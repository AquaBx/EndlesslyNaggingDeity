extends Control

signal overide_msg

var is_playing = false
var is_overrided = false

# quand tu meure, tu recoit une clé en paramètre
const dialogues = {
	"dieu": {
		"intro_number_1": ["Bonjour petit être.",
							"Je sais que tu viens de te réveiller\r mais j'ai besoin de ton attention.",
							"Tu portes sur tes bras\r les espoirs de ce monde,\r de ton monde.",
							"Pour le sauver...",
							"le messi que tu es\r doit accomplir\r une tâche complexe !",
							"Couper la plante devant toi !!!"],
		
		"exit": ["Non ne pars pas par là !","Tu risquerais de mourir :'("],
		
		"died_from_door": [""],
		"died_from_car": [""],
		"died_from_magnifier": [""],
		"died_from_pool": [""],
		"died_from_block": [""],
		
		"success_number_1": ["Bien joué petit bonhomme !",
							 "Maintenant que tu as\r sauvé le monde tu\r as le droit de recommencer !",
							 "Quelle joie d'être en vie,\r n'est ce pas ?"],
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
		"died_from_door": ["Tu n'étais pas censé mourir !",
						   "Ne me rajoute pas de travail\r pour te ressuciter comme ça !",
						   "Ta quête est vitale pour ton monde...",
						   "...alors ne me force pas\r à faire disparaitre\r d'autres bouts de l'existence.",
						   "Contrairement à la mort,\r quand ils disparaissent\r je ne peux pas les ramener."],
		"died_from_car": [""],
		"died_from_magnifier": [""],
		"died_from_pool": [""],
		"died_from_block": [""],
	}
}

func play_dialogue(character: String, id: String) -> void:
	self.visible = true
	if is_playing:
		emit_signal("overide_msg")
		await get_tree().create_timer(0.4).timeout
	is_playing = true
	is_overrided = false
	print("dialogue")
	
	for line in dialogues[character][id]:
		$Sprite2D/RichTextLabel.text = "[center]"
		for char in line :
			print(line)
			$Sprite2D/RichTextLabel.text += char
			print($Sprite2D/RichTextLabel.text)
			if is_overrided:
				return
			await get_tree().create_timer(0.07).timeout
		await get_tree().create_timer(0.4).timeout
		
	self.visible = false
	is_playing = false


func _on_overide_msg():
	is_overrided = true
