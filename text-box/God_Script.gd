extends Node

@onready var player_2d: Player2D = $"../Player2D"

const lines: Array[String] = [
	"CAT: I HAVE TRAVELLED FAR TO GET HERE",
	"CAT: AND SO I HOPE FOR SOME ANSWERS",
	"CAT: IF ANYONE CAN HEAR ME",
	"CAT: PLEASE",
	"CAT: WHY AM I LIKE THIS?",
	"CAT: WHAT AM I?",
	"CAT: A MUSHROOM?",
	"CAT: A CAT?",
	"CAT: SOMETHING ELSE ENTIERLY?",
	"DEV:YOU ARE OUR CREATION",
	"DEV: AND I BROUGHT YOU TO LIFE",
	"DEV: YOU'RE A MUSHROOM CAT",
	"DEV: UNIQUE IN EVERY WAY",
	"DEV: AND I MADE YOU BEAUTIFUL",
	"CAT: BUT WHY WAS I CREATED?",
	"CAT: WHY AM I DIFFERENT?",
	"CAT: JUST TO SATISFY YOU?",
	"CAT: AM I CREATED JUST TO BE USED?",
	"DEV: I MEAN MUSHROOMS ARE DELICIOUS",
	"DEV: I THINK YOU ARE ",
	"DEV: CREATED JUST TO BE",
	"DEV: AND CATS ARE GREAT TOO",
	"DEV: YOU ARE UNIQUE IN YOUR DIFFERENCES",
	"DEV: THAT IS NOT BAD OR GOOD",
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		DialogueManager.start_dialog(Vector2(player_2d.position.x/2, player_2d.position.y), lines)
		
