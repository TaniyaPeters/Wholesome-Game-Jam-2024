class_name Player
extends Node3D


const RAY_LENGTH := 100


@onready var raycast := $RayCast3D
@onready var camera := $"../CameraOutside"
@onready var subviewport = $"../Tapestry".get_node("SubViewport")


func _input(event: InputEvent) -> void:
	if not camera.current:
		return
	if event is InputEventMouseButton:
		if not event.pressed:
			return
		print(subviewport.get_viewport().get_mouse_position())
		
		
