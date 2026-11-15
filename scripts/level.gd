extends Node3D

@onready var player_manager: PlayerManager = $PlayerManager
@onready var score_manager: Node3D = $ScoreManager
@onready var win_menu: CanvasLayer = $WinMenu


func _ready() -> void:
	StateManager.score = 0
	AudioManager.play_bgm()


func _on_win_area_body_entered(body: Node3D) -> void:
	if not body.is_in_group("player_ball"):
		return

	if player_manager.launched and StateManager.score == score_manager.objects.size():
		win_menu.show_win_screen()
