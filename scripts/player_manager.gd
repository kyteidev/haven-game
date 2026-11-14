class_name PlayerManager
extends Node3D

enum PlayerMode { BALL, PLAYER }

var mode := PlayerMode.BALL

@onready var ball_cam: Camera3D = $"../PlayerBall/Camera3D"
@onready var player_cam: Camera3D = $"../Player/Camera3D"


func _ready() -> void:
	ball_cam.make_current()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("switch_mode"):
		mode = PlayerMode.BALL if mode == PlayerMode.PLAYER else PlayerMode.PLAYER
		
		match mode:
			PlayerMode.BALL:
				ball_cam.make_current()
			PlayerMode.PLAYER:
				player_cam.make_current()
