class_name Game2D
extends Node2D


@onready var pausable_nodes := [
	$Player2D,
	$Clouds,
	$Train
]


func pause():
	for node:Node2D in pausable_nodes:
		node.process_mode = Node.PROCESS_MODE_DISABLED

func unpause():
	for node:Node2D in pausable_nodes:
		node.process_mode = Node.PROCESS_MODE_INHERIT
