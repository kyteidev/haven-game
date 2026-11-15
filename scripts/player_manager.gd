class_name PlayerManager
extends Node3D

enum PlayerMode {
	BALL,
	PLAYER,
}

const MAX_LAUNCH_SPEED = 30.0

var mode := PlayerMode.PLAYER
var launched := false

var launch_speed := 0.0

@onready var ball_cam: Camera3D = $"../PlayerBall/CameraPivot/SpringArm3D/Camera3D"
@onready var player_cam: Camera3D = $"../Player/CameraPivot/Camera3D"


func _ready() -> void:
	player_cam.make_current()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("switch_mode"):
		if launched:
			return

		mode = PlayerMode.BALL if mode == PlayerMode.PLAYER else PlayerMode.PLAYER

		match mode:
			PlayerMode.BALL:
				ball_cam.make_current()
			PlayerMode.PLAYER:
				player_cam.make_current()
