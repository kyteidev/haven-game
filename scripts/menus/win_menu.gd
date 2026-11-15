extends CanvasLayer


func _ready() -> void:
	visible = false
	get_tree().paused = false


func show_win_screen() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
	visible = true
	StateManager.win_shown = true


# is actually next level
func _on_restart_button_pressed() -> void:
	LevelsManager.current_level += 1
	get_tree().change_scene_to_file(
		"res://scenes/levels/level_" + str(LevelsManager.current_level) + ".tscn"
	)
	StateManager.win_shown = false


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
