extends Node3D

@onready var ball: RigidBody3D = $Ball

var sensitivity := 0.001
var max_tilt: float = deg_to_rad(80)

func _ready() -> void:
	ball.gravity_scale = 0.0
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		ball.rotation.x -= event.relative.y * sensitivity
		ball.rotation.x = clamp(ball.rotation.x, -max_tilt, max_tilt)
		
		ball.rotation.y += -event.relative.x * sensitivity
