extends CanvasLayer


func _ready() -> void:
	visible = false
	get_tree().paused = false


func show_death_screen() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
	visible = true
	StateManager.win_shown = true


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	StateManager.win_shown = false


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
	StateManager.win_shown = false
