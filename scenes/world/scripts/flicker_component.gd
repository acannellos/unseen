class_name FlickerComponent
extends Node

@onready var rng = RandomNumberGenerator.new()

var parent

func _ready():
	parent = get_parent()
	rng.randomize()
	_start_cycle()

func _start_cycle():
	var wait_time = rng.randf_range(5.0, 10.0)
	var timer = get_tree().create_timer(wait_time)
	timer.timeout.connect(_on_pre_flicker)

func _on_pre_flicker():
	parent.visible = false
	await get_tree().create_timer(0.1).timeout
	_start_flicker()

func _start_flicker():
	var flicker_duration = rng.randf_range(0.1, 0.6)
	var elapsed = 0.0

	while elapsed < flicker_duration:
		parent.visible = !parent.visible
		var flicker_time = rng.randf_range(0.05, 0.08)
		await get_tree().create_timer(flicker_time).timeout
		elapsed += flicker_time

	parent.visible = true
	_start_cycle()
