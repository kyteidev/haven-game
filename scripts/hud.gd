extends CanvasLayer

@onready var player_manager = get_tree().get_first_node_in_group("player_manager")
@onready var launch_bar: ProgressBar = $LaunchBar
@onready var items: Label = $VBoxContainer/Items

@onready var score_manager = get_tree().get_first_node_in_group("score_manager")


func _ready() -> void:
	launch_bar.max_value = player_manager.MAX_LAUNCH_SPEED


func _process(_delta: float) -> void:
	launch_bar.value = player_manager.launch_speed

	launch_bar.visible = player_manager.mode == PlayerManager.PlayerMode.BALL

	items.text = ""
	for object in score_manager.objects_left:
		items.text += "- " + object + "\n"
