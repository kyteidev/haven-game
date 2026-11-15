extends Node3D

signal entered(body: Node3D)

@onready var static_body_3d: Area3D = $StaticBody3D


func _on_static_body_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_ball"):
		entered.emit(body)
