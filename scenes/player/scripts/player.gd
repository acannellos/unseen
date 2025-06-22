class_name Player
extends CharacterBody3D

@export var footsteps: AudioStreamPlayer

var direction: Vector3
var speed: float = 2.5
var acceleration: float = 0.25
var sprint_mod: float = 2.0

func _ready() -> void:
	Global.player = self

func _physics_process(delta: float) -> void:
	
	if Global.is_speaking:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	handle_basic_controller()


func handle_basic_controller() -> void:
	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	
	footsteps.stream_paused = true
	if input_dir:
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		direction.normalized()
		if is_on_floor():
			footsteps.stream_paused = false
	else:
		direction = Vector3.ZERO
	
	var new_speed = speed
	
	footsteps.pitch_scale = 1.0
	if Input.is_action_pressed("sprint"):
		new_speed *= sprint_mod
		footsteps.pitch_scale = 1.2
	
	velocity.x = lerp(velocity.x, direction.x * new_speed, acceleration)
	velocity.z = lerp(velocity.z, direction.z * new_speed, acceleration)
	
	move_and_slide()
