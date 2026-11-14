extends RigidBody3D

@onready var arrow: Node3D = $Arrow
@onready var camera: Camera3D = $Camera3D
@onready var player_manager = get_tree().get_first_node_in_group("player_manager")

var sensitivity := 0.03
var max_tilt: float = deg_to_rad(80)

var ball_moving := false

var lock_camera := false
var camera_offset: Vector3

var launch_speed := 20.0
var direction: Vector2

var mouse_delta := Vector2.ZERO

func _ready() -> void:
	gravity_scale = 0.0
	arrow.visible = true
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _physics_process(delta: float) -> void:
	rotation.x -= mouse_delta.y * sensitivity * delta
	rotation.x = clamp(rotation.x, -max_tilt, max_tilt)
	
	rotation.y += -mouse_delta.x * sensitivity * delta
	
	if lock_camera:
		camera.global_position = global_position + camera_offset
	
	mouse_delta = Vector2.ZERO


func _input(event: InputEvent) -> void:
	if player_manager.mode != PlayerManager.PlayerMode.BALL:
		return
		
	if event is InputEventMouseMotion and not ball_moving:
		mouse_delta += event.screen_relative
		
	# launching ball
	if Input.is_action_just_pressed("kick_ball") and not ball_moving:
		ball_moving = true
		arrow.visible = false
		lock_camera = true
		gravity_scale = 1.0
		
		camera_offset = camera.position
		camera.reparent(get_tree().current_scene)
		
		var player: CharacterBody3D = get_tree().get_first_node_in_group("player_controller")
		player.visible = false
		player.get_node("./CollisionShape3D").disabled = true
		
		var forward: Vector3 = get_global_transform_interpolated().basis.z
		apply_impulse(forward * launch_speed * -1)
		
