extends Node

const lines: Array[String] = [
	"HEY WE ARE HERE",
	"WANNA SPAR IN THIS ",
	"!!! 123123 UOU KNO",
	"STUFF IT"
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		DialogueManager.start_dialog(Vector2(10,10), lines)
		
