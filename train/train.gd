extends Node2D


var tween: Tween

@onready var train_back: Sprite2D = $TrainBack
@onready var train_front: Sprite2D = $TrainFront

@onready var player_jump_point: Node2D = $PlayerJumpPoint
@onready var player_seat: Node2D = $PlayerSeat
@onready var town_limit: CollisionShape2D = $TownLimit/CollisionShape2D
@onready var train_destination: Node2D = $TrainDestination

func _on_train_boarding_area_body_entered(body: Node2D) -> void:
	if body is Player2D:
		board_train(body)


func board_train(player: Player2D):
	player.process_mode = Node.PROCESS_MODE_DISABLED
	town_limit.disabled = true
	tween = create_tween()
	tween.tween_property(player, "position", player_jump_point.position, 0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(func(): player.z_index = -3)
	tween.tween_property(player, "position", player_seat.position, 0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(func(): start_train_ride(player))

func start_train_ride(player: Player2D):
	var train_front_target = train_destination.position
	var train_back_target = train_front_target + (train_back.position - train_front.position)
	var player_target = train_back_target + (player.position - train_back.position)
	tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(player, "position", player_target, 10.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(train_back, "position", train_back_target, 10.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(train_front, "position", train_front_target, 10.0).set_trans(Tween.TRANS_CUBIC)
