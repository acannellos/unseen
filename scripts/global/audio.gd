extends Node

# Code adapted from KidsCanCode

var num_players = 10
var bus = "Master"

var available = []  # The available players.
var queue = []  # The queue of sounds to play.

func _ready():
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)

		available.append(p)

		p.volume_db = -16
		p.finished.connect(_on_stream_finished.bind(p))
		p.bus = bus
	
	play("music/short_jazz.mp3")

func _on_stream_finished(stream):
	available.append(stream)

func play(sound_path):  # Path (or multiple, separated by commas)
	var sounds = sound_path.split(",")
	queue.append("res://assets/" + sounds[randi() % sounds.size()].strip_edges())

func _process(_delta):
	if not queue.is_empty() and not available.is_empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		
		available[0].pitch_scale = 1.0
		#available[0].pitch_scale = randf_range(0.9, 1.1)

		available.pop_front()
