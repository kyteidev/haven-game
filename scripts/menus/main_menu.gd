extends Node3D


func _ready() -> void:
	var player := AudioStreamPlayer.new()
	player.volume_db = -10
	player.stream = preload("res://assets/sounds/bgm/menu_bgm.mp3")

	await get_tree().process_frame
	add_child(player)
	player.play()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
