extends Node3D

@onready var player_manager: PlayerManager = $PlayerManager

func _on_win_area_body_entered(_body: Node3D) -> void:
	if player_manager.launched:
		print("win")
