class_name Player
extends CharacterBody3D

@export var camera: Camera3D
@export var light: SpotLight3D

var direction: Vector3
var speed: float = 2.5
var acceleration: float = 0.25
var sprint_mod: float = 2.0
var is_light_on: bool = false

var ray_length: float = 10.0

func _physics_process(delta: float) -> void:
	
	if Global.is_speaking:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	handle_basic_controller()
	
	if Input.is_action_just_pressed("interact"):
		interact()

func handle_basic_controller() -> void:
	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	
	if input_dir:
		#direction = head.transform.basis * Vector3(_input_dir.x, 0, _input_dir.y)
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		direction.normalized()
	else:
		direction = Vector3.ZERO
	
	var new_speed = speed
	if Input.is_action_pressed("sprint"):
		new_speed *= sprint_mod
	
	velocity.x = lerp(velocity.x, direction.x * new_speed, acceleration)
	velocity.z = lerp(velocity.z, direction.z * new_speed, acceleration)
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	
	if Global.is_speaking:
		return
	
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		is_light_on = !is_light_on
		light.visible = is_light_on
		print(is_light_on)
	
	if event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * ray_length
		to.y = 0
		light.look_at(to)

@export var interact_shape: ShapeCast3D

func interact() -> void:
	for i in interact_shape.get_collision_count():
		
		var collider = interact_shape.get_collider(i)

		if collider is Player:
			continue

		var interactable = collider.get_node_or_null("InteractableComponent")
		if interactable:
			interactable.interact_with()
		
	pass
