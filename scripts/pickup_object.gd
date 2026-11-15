extends Node3D

@export var object: PackedScene

var inst


func _ready() -> void:
	inst = object.instantiate()
	add_child(inst)

	inst.entered.connect(_body_entered)


func _body_entered(body: Node3D) -> void:
	if body.is_in_group("player_ball"):
		StateManager.score += 1

		var score_manager = get_tree().get_first_node_in_group("score_manager")
		score_manager.objects_left.erase(inst.name)

		AudioManager.play_sfx("pickup", global_position)
		queue_free()
