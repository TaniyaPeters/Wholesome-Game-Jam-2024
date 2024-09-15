class_name TapestryViewport
extends SubViewport


const ICON = preload("res://icon.svg")
func create_sprite(position: Vector2):
	var sprite = Sprite2D.new()
	sprite.texture = ICON
	sprite.position = position
	sprite.scale = Vector2.ONE * 0.1
	add_child(sprite)
