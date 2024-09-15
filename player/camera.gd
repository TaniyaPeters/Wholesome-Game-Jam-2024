extends Camera3D


@export var camera_outside: Camera3D
@export var camera_top: Camera3D


@onready var outside_transform := camera_outside.transform
@onready var top_transform := camera_top.transform


var game_2d: Game2D
var tween: Tween
var in_transition := false


func _ready() -> void:
	game_2d = $"../Tapestry".get_node("%GameSubViewport/Game2D")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("change_view"):
		toggle_view()

func toggle_view():
	if in_transition:
		return

	in_transition = true
	if camera_outside.current:
		transition_camera(camera_outside, camera_top, 1.0)
		await tween.finished
		game_2d.unpause()
	else:
		game_2d.pause()
		transition_camera(camera_top, camera_outside, 1.0)
		await tween.finished

	in_transition = false


func transition_camera(from_camera: Camera3D, to_camera: Camera3D, duration: float):
	tween = create_tween().set_parallel(true)

	make_current()
	transform = from_camera.transform
	tween.tween_property(self, "transform", to_camera.transform, duration).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "fov", to_camera.fov, duration).set_trans(Tween.TRANS_CUBIC)
	tween.chain().tween_callback(to_camera.make_current)
