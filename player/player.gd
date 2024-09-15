class_name Player
extends Node3D


const RAY_LENGTH := 100


@onready var raycast := $RayCast3D
@onready var camera := $"../CameraOutside"
