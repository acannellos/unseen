class_name Player
extends CharacterBody3D

@export var footsteps: AudioStreamPlayer
@export var timer: Timer
#var needs_footstep_buffer: bool = false

var direction: Vector3
var speed: float = 2.5
var acceleration: float = 0.25
var sprint_mod: float = 2.0

var input_dir: Vector2

func _ready() -> void:
	Global.player = self
	#footsteps.play()
	timer.connect("timeout", _on_timeout)

func _physics_process(delta: float) -> void:
	
	if Global.is_speaking:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	handle_basic_controller()

#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:	
		#if not footsteps.playing:
			#footsteps.play()

func handle_basic_controller() -> void:
	input_dir = Input.get_vector("left", "right", "forward", "backward")
	
	if input_dir:
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		direction.normalized()
		if is_on_floor():
			timer.wait_time = 0.5
			timer.paused = false
			
			#footsteps.play()
			#footsteps.playing = true
			#footsteps.stream_paused = false
			#print(footsteps.playing)
			#footsteps.stream_paused = false
			
			#print(footsteps.stream_paused)
	else:
		timer.paused = true
		direction = Vector3.ZERO
		
		#footsteps.stop()
		#print(footsteps.playing)
		#footsteps.stream_paused = true
	
	var new_speed = speed
	
	#footsteps.pitch_scale = 1.0
	if Input.is_action_pressed("sprint"):
		new_speed *= sprint_mod
		timer.wait_time = 0.4
		#footsteps.pitch_scale = 1.2
	
	velocity.x = lerp(velocity.x, direction.x * new_speed, acceleration)
	velocity.z = lerp(velocity.z, direction.z * new_speed, acceleration)
	
	move_and_slide()

func _on_timeout() -> void:
	Audio.play("sounds/footstep_1.wav, sounds/footstep_2.wav, sounds/footstep_3.wav, sounds/footstep_4.wav")
