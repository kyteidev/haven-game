extends Node3D


func _on_static_body_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_ball"):
		StateManager.score += 1
		queue_free()
