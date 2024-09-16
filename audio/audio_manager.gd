extends Node


@export var ambience_streams: Array[AudioStream]
@export var ambience_stream_volumes: Array[float]


const AMBIENCE_VOLUME_FADEIN := 0.0
const AMBIENCE_VOLUME_FADEOUT := -36.0


@onready var ambience_bus = AudioServer.get_bus_index("Ambience")
@onready var ambience_bus_target_volume := AudioServer.get_bus_volume_db(ambience_bus)
@onready var train_chugging_1: AudioStreamPlayer = $TrainChugging1
@onready var train_chugging_2: AudioStreamPlayer = $TrainChugging2


func _ready() -> void:
	generate_ambience_streams()


func _process(delta: float) -> void:
	var ambience_bus_volume := AudioServer.get_bus_volume_db(ambience_bus)
	if ambience_bus_volume == ambience_bus_target_volume:
		return
	AudioServer.set_bus_volume_db(ambience_bus, lerp(ambience_bus_volume, ambience_bus_target_volume, 0.01))


func generate_ambience_streams():
	AudioServer.set_bus_volume_db(ambience_bus, AMBIENCE_VOLUME_FADEOUT)
	for i in ambience_streams.size():
		var stream_player = AudioStreamPlayer.new()
		stream_player.stream = ambience_streams[i]
		stream_player.autoplay = true
		stream_player.volume_db = ambience_stream_volumes[i]
		stream_player.bus = "Ambience"
		add_child(stream_player)


func fade_bus_volume_to(bus_index: int, value_db: float):
	ambience_bus_target_volume = value_db


func fade_in_ambience():
	fade_bus_volume_to(ambience_bus, AMBIENCE_VOLUME_FADEIN)


func fade_out_ambience():
	fade_bus_volume_to(ambience_bus, AMBIENCE_VOLUME_FADEOUT)


func start_train_sound():
	train_chugging_1.play()
	train_chugging_2.play()

func stop_train_sound():
	train_chugging_1.stop()
	train_chugging_2.stop()

func fade_in_game():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Game"), AMBIENCE_VOLUME_FADEIN)


func fade_out_game():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Game"), AMBIENCE_VOLUME_FADEOUT)
