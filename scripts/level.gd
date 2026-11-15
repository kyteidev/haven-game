extends Node3D

@onready var player_manager: PlayerManager = $PlayerManager
@onready var score_manager: Node3D = $ScoreManager


func _ready() -> void:
	StateManager.score = 0


func _on_win_area_body_entered(_body: Node3D) -> void:
	if player_manager.launched and StateManager.score == score_manager.objects.size():
		print("win")
