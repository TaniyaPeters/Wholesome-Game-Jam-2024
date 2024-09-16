extends Node

@onready var player_2d: Player2D = $"../Player2D"

const lines: Array[String] = [
	"READY TO GET ON THE TRAIN?",
	"LET US GO!"
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		DialogueManager.start_dialog(Vector2(player_2d.position.x/2, player_2d.position.y), lines)
		
