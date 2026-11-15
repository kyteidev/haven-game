extends CanvasLayer

@onready var player_manager = get_tree().get_first_node_in_group("player_manager")
@onready var launch_bar: ProgressBar = $LaunchBar


func _ready() -> void:
	launch_bar.max_value = player_manager.MAX_LAUNCH_SPEED


func _process(_delta: float) -> void:
	launch_bar.value = player_manager.launch_speed

	launch_bar.visible = player_manager.mode == PlayerManager.PlayerMode.BALL
