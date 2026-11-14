extends RigidBody3D

@onready var arrow: Node3D = $Arrow

@onready var player_manager = get_tree().get_first_node_in_group("player_manager")


var sensitivity := 0.001
var max_tilt: float = deg_to_rad(80)

var ball_moving := false

var launch_speed := 20.0
var direction: Vector2

func _ready() -> void:
	gravity_scale = 0.0
	arrow.visible = true
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	if player_manager.mode != PlayerManager.PlayerMode.BALL:
		return
		
	# camera movement
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y * sensitivity
		rotation.x = clamp(rotation.x, -max_tilt, max_tilt)
		
		rotation.y += -event.relative.x * sensitivity
		
	# launching ball
	if Input.is_action_just_pressed("kick_ball") and not ball_moving:
		ball_moving = true
		arrow.visible = false
		gravity_scale = 1.0
		
		var forward: Vector3 = get_global_transform_interpolated().basis.z
		apply_impulse(forward * launch_speed * -1)
		
