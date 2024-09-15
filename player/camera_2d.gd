extends Camera2D


@export var player: Player2D


const CAMERA_OFFSET := 100.0


var target_position: Vector2


func _ready() -> void:
	position = player.position
	target_position = position


func _physics_process(delta: float) -> void:
	target_position.x = player.position.x
	position = lerp(position, target_position, 0.2)

	offset.x = lerp(offset.x, CAMERA_OFFSET * player.direction, 0.05)
