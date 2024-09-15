extends MarginContainer

@onready var label = $Panel/MarginContainer/Panel/RichTextLabel
@onready var timer = $LetterTimer

const MAX_WIDTH =256

var text = ""
var letter_index = 0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

signal finished_displaying()

func display_text(text_to_display:String):
	print('hi')
	text = text_to_display
	label.text = text_to_display
	print('there')
	label.text = ""
	
	_display_letter()
	
func _display_letter():
	label.text = text[letter_index]
	letter_index += 1
	print('here')
	if letter_index >= text.length():
		finished_displaying.emit()
		return
		
	match text[letter_index]:
		"!", "?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_letter_timer_timeout() -> void:
	_display_letter()
