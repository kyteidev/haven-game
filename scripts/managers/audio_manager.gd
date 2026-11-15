extends Node

var bgm_tracks := [
	preload("res://assets/sounds/bgm/looping/drone_02.ogg"),
	preload("res://assets/sounds/bgm/looping/drone_03.ogg"),
]

@onready var bgm_player := AudioStreamPlayer.new()


func _ready() -> void:
	await get_tree().process_frame
	get_tree().root.add_child(bgm_player)
	bgm_player.finished.connect(
		func() -> void:
			get_tree().create_timer(randf_range(4.0, 8.0)).timeout.connect(play_bgm),
	)


func play_bgm() -> void:
	await get_tree().process_frame
	bgm_player.stream = bgm_tracks.pick_random()
	bgm_player.pitch_scale = randf_range(0.95, 1.05)
	bgm_player.play()
