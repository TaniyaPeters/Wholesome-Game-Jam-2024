extends Node

@onready var player_2d: Player2D = $"../Player2D"
var able_to_interact = false
const lines: Array[String] = [
	"CAT \n\n\n I HAVE TRAVELLED FAR TO GET HERE",
	"CAT \n\n\n AND SO I HOPE FOR SOME ANSWERS",
	"CAT \n\n\n IF ANYONE CAN HEAR ME",
	"CAT \n\n\n PLEASE",
	"CAT \n\n\n WHY AM I LIKE THIS?",
	"CAT \n\n\n WHAT AM I?",
	"CAT \n\n\n A MUSHROOM?",
	"CAT \n\n\n A CAT?",
	"CAT \n\n\n SOMETHING ELSE ENTIRELY?",
	"DEV \n\n\n YOU ARE OUR CREATION",
	"DEV \n\n\n AND I BROUGHT YOU TO LIFE",
	"DEV \n\n\n YOU ARE A MUSHROOM CAT",
	"DEV \n\n\n UNIQUE IN EVERY WAY",
	"DEV \n\n\n AND I MADE YOU BEAUTIFUL",
	"CAT \n\n\n BUT WHY WAS I CREATED?",
	"CAT \n\n\n WHY AM I DIFFERENT?",
	"CAT \n\n\n JUST TO SATISFY YOU?",
	"CAT \n\n\n AM I CREATED JUST TO BE USED?",
	"DEV \n\n\n I MEAN MUSHROOMS ARE DELICIOUS",
	"DEV \n\n\n I THINK YOU ARE ",
	"DEV \n\n\n CREATED JUST TO BE",
	"DEV \n\n\n AND CATS ARE GREAT TOO",
	"DEV \n\n\n YOU ARE UNIQUE IN YOUR DIFFERENCES",
	"DEV \n\n\n THAT IS NOT BAD OR GOOD",
]

func _unhandled_input(event):
	if event.is_action_pressed("interact") and able_to_interact:
		DialogueManager.start_dialog(Vector2(300, 300), lines)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player2D:
		able_to_interact = true
