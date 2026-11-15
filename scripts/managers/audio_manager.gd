extends Node

var bgm_tracks := [
	preload("res://assets/sounds/bgm/looping/drone_02.ogg"),
	preload("res://assets/sounds/bgm/looping/drone_03.ogg"),
]

var sounds := { "ball_bounce": preload("res://assets/sounds/sfx/ball_bounce.wav") }

@onready var bgm_player := AudioStreamPlayer.new()


func _ready() -> void:
	await get_tree().process_frame
	get_tree().root.add_child(bgm_player)
	bgm_player.process_mode = Node.PROCESS_MODE_ALWAYS
	bgm_player.finished.connect(
		func() -> void:
			get_tree().create_timer(randf_range(4.0, 8.0)).timeout.connect(play_bgm),
	)


func play_bgm() -> void:
	await get_tree().process_frame
	bgm_player.volume_db = -10
	bgm_player.stream = bgm_tracks.pick_random()
	bgm_player.pitch_scale = randf_range(0.95, 1.05)
	bgm_player.play()


func play_sfx(sound_name: String, position: Vector3) -> void:
	var player := AudioStreamPlayer3D.new()
	player.volume_db = -15
	player.pitch_scale = randf_range(0.85, 1.15)
	player.stream = sounds[sound_name]

	get_tree().current_scene.add_child(player)
	player.global_position = position
	player.play()

	print("play")

	player.finished.connect(player.queue_free)
