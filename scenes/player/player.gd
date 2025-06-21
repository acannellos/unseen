class_name Player
extends CharacterBody3D

@export var interact_label: Label
@export var interact_shape: ShapeCast3D

var direction: Vector3
var speed: float = 2.5
var acceleration: float = 0.25
var sprint_mod: float = 2.0

func _ready() -> void:
	Global.player = self

func _physics_process(delta: float) -> void:
	
	if Global.is_speaking:
		interact_label.hide()
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	handle_basic_controller()
	
	interact_label.hide()
	for i in interact_shape.get_collision_count():
		
		var collider = interact_shape.get_collider(i)
		if collider is Player:
			continue
		var interactable = collider.get_node_or_null("InteractableComponent")
		if interactable:
			interact_label.show()
			if Input.is_action_just_pressed("interact"):
				interactable.interact_with()

func handle_basic_controller() -> void:
	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	
	if input_dir:
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
