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
		
		"corruption": ["NON!!!",
					   "Je ne peut pas te laisser\rcorrompre ce monde",
					   "Je detruirais tout avant \r que tu puisse\r le corrompre",],
					
		"entered_dog_area":["Oh, qu'il est mignon quand il dors.",
							"Surtout ne le reveille pas !"],
							
		"entered_wolf_area":["Parfait !\rIl est reveiller maintenant\r :'\\ ",],
					
		"entered_work_area":["Des travaux ...",
							"Ca n'a pas l'air très solide"],
							
		"entered_block_area":["J'ai rajouter ces blocs\rflottants car je\rm'ennuyais",
							"Heureusement,\r ils ne sont pas dangereux"],
					
		"entered_loupe_area":["Fait attention !",
							"Tu risquerais de te bruler"],
							
		"entered_faraway_area":["Pourquoi voudrais tu partir par la ?",
							"C'est inutile."],
							
		"entered_barrier_area":["Il y a quelque chose\rde dangereux pour le monde\rlui même la bas.",
							"N'essai même pas d'y aller."],
							
		"entered_corruption_area":["Arrête toi et fait demi-tour !",],
		
		"entered_corruption2_area":["La corruption ...","Elle est si forte.","C'est ta faute !","Tu m'a forcer à tout détruire\r lui ouvrant une porte pour\r entrer dans ce monde."],
		
		"pressed corruption":["NOOOOOOOOOOOOOOOOOOOO\rOOOOOOOOOOOOOOOOOOOON",],
		
		"entered_end_area":["Ne vas pas la ...",
							"Tu ne veut pas faire ça."],
		
		"end_1": ["Tu ne vas pas faire ça pas vrai ?",
				  "Bien sur que non tu est \r un gentil dinosaure.",
				  "On a vecu tellement de\r moment ensemble et ...\r ...........................\r ................. \r ....... \r ...",
				  "Tu ne changera pas d'avis pas vrai",
				  "Tu ne peut pas te contente\r de cette vie eternelle ?",
				  "Tu voulais à ce point\r atteindre ta fin ?",
				  "Et bien tant pis ...",
				  "De toute façon il ne reste\r plus rien.",
				  "Dans ce cas autant tout\r supprimer tu ne pense pas ?",
				],
		"end_2": ["Aurevoir petit Dinosaure"],
		"end_3": ["Ca ne fut pas un plaisir de \rte connaître"],
	},
	"narrateur": {
		"died_from_door": ["Tu n'étais pas censé mourir !",
						   "Ne me rajoute pas de travail\r pour te ressuciter comme ça !",
						   "Ta quête est vitale\rpour ton monde...",
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
			$Sprite2D/RichTextLabel.text += char
			if is_overrided:
				return
			await get_tree().create_timer(0.07).timeout
		await get_tree().create_timer(0.4).timeout
		
	self.visible = false
	is_playing = false
	
func set_dot() :
	self.visible = true
	var line = "..."
	if is_playing:
		emit_signal("overide_msg")
		await get_tree().create_timer(0.4).timeout
	is_playing = true
	is_overrided = false
	$Sprite2D/RichTextLabel.text = "[center]"
	for char in line :
		$Sprite2D/RichTextLabel.text += char
		if is_overrided:
			return
		await get_tree().create_timer(0.07).timeout
	is_playing = false
		


func _on_overide_msg():
	self.visible = true
	is_overrided = true
	
func stop_msg():
	if is_playing:
		emit_signal("overide_msg")
		await get_tree().create_timer(0.0001).timeout
		self.visible = false
		await get_tree().create_timer(0.4).timeout
	is_overrided = false
	is_playing = false
	
	
