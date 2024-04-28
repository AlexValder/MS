extends Node3D
class_name PlayerCamera

const MIN_VERT := -PI/2
const MAX_VERT := 1*PI/6

@export var horizontal_mouse_sensitivity := 0.003
@export var vertical_mouse_sensitivity := 0.001

@onready var _arm := $spring_arm as SpringArm3D
@onready var w_camera := $spring_arm/c as Camera3D


func global_look_dir() -> float:
    return _arm.global_rotation.y


func look_dir() -> float:
    return _arm.rotation.y


func rotate_camera_mouse(e: InputEventMouseMotion) -> void:
    _arm.rotation.y -= e.relative.x * horizontal_mouse_sensitivity
    _arm.rotation.x = clampf(_arm.rotation.x - e.relative.y * vertical_mouse_sensitivity,
        MIN_VERT, MAX_VERT)
