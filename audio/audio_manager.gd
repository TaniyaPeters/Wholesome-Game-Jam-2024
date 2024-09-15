extends Node


@export var ambience_streams: Array[AudioStream]


const AMBIENCE_VOLUME_FADEIN := 0.0
const AMBIENCE_VOLUME_FADEOUT := -24.0


@onready var ambience_bus = AudioServer.get_bus_index("Ambience")
@onready var ambience_bus_target_volume := AudioServer.get_bus_volume_db(ambience_bus)


func _ready() -> void:
	generate_ambience_streams()


func _process(delta: float) -> void:
	var ambience_bus_volume := AudioServer.get_bus_volume_db(ambience_bus)
	if ambience_bus_volume == ambience_bus_target_volume:
		return
	AudioServer.set_bus_volume_db(ambience_bus, lerp(ambience_bus_volume, ambience_bus_target_volume, 0.01))


func generate_ambience_streams():
	for ambience_stream in ambience_streams:
		print(ambience_stream)


func fade_bus_volume_to(bus_index: int, value_db: float):
	ambience_bus_target_volume = value_db


func fade_in_ambience():
	fade_bus_volume_to(ambience_bus, AMBIENCE_VOLUME_FADEIN)


func fade_out_ambience():
	fade_bus_volume_to(ambience_bus, AMBIENCE_VOLUME_FADEOUT)
