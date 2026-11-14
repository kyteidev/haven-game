extends RigidBody3D

@onready var camera_pivot: Node3D = $CameraPivot
@onready var camera_pitch: Node3D = $CameraPivot/CameraPitch

var sensitivity := 0.001

func _ready() -> void:
	gravity_scale = 0.0
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera_pivot.rotate_y(-event.relative.x * sensitivity)
		camera_pitch.rotate_x(-event.relative.y * sensitivity)
