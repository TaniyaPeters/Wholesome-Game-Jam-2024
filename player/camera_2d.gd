extends Camera2D


@export var game_2d: Game2D
@onready var player := game_2d.get_node("Player2D")


const CAMERA_OFFSET := 100.0


var target_position: Vector2


func _ready() -> void:
	position = player.global_position
	target_position = position


func _physics_process(delta: float) -> void:
	target_position.x = player.global_position.x
	position = lerp(position, target_position, 0.2)

	offset.x = lerp(offset.x, CAMERA_OFFSET * player.direction, 0.05)
