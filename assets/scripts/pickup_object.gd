extends Node3D

@export var object: PackedScene


func _ready() -> void:
	var inst = object.instantiate()
	add_child(inst)

	inst.entered.connect(_body_entered)


func _body_entered(body: Node3D) -> void:
	if body.is_in_group("player_ball"):
		StateManager.score += 1
		queue_free()
