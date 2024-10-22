class_name Player2D
extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0
const DEFAULT_GRAVITY_MULTIPLIER = 1.0
const FALL_GRAVITY_MULTIPLIER = 1.5


@onready var sprite := $Sprite2D


var gravity_multiplier := 1.0
var input_axis := 1.0
var direction := 1.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if velocity.y > 0: # Falling
			gravity_multiplier = FALL_GRAVITY_MULTIPLIER
		else:
			gravity_multiplier = DEFAULT_GRAVITY_MULTIPLIER
		velocity += get_gravity() * gravity_multiplier * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	input_axis = Input.get_axis("move_left", "move_right")
	if input_axis:
		if input_axis != direction:
			sprite.flip_h = !sprite.flip_h
		direction = input_axis
		velocity.x = input_axis * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
