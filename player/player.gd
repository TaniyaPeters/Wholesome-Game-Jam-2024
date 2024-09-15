class_name Player
extends Node3D


@export var camera: Camera3D
@export var camera_outside: Camera3D
@export var camera_top: Camera3D


@onready var outside_transform := camera.transform
@onready var top_transform := camera_top.transform


var tween: Tween
var in_transition := false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("change_view"):
		toggle_view()

func toggle_view():
	if in_transition:
		return

	if camera_outside.current:
		transition_camera(camera_outside, camera_top, 2.0)
	else:
		transition_camera(camera_top, camera_outside, 2.0)


func transition_camera(from_camera: Camera3D, to_camera: Camera3D, duration: float):
	in_transition = true
	tween = create_tween().set_parallel(true)

	camera.make_current()
	camera.transform = from_camera.transform
	tween.tween_property(camera, "transform", to_camera.transform, duration).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(camera, "fov", to_camera.fov, duration).set_trans(Tween.TRANS_QUAD)
	tween.chain().tween_callback(to_camera.make_current)
	tween.chain().tween_callback(func(): in_transition = false)
