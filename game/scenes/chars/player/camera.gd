extends Node3D
class_name PlayerCamera

const MIN_VERT := -PI/2
const MAX_VERT := 1*PI/6

@export_group("Mouse Sensitivity")
@export var horizontal_mouse_sensitivity := 0.003
@export var vertical_mouse_sensitivity := 0.001
@export_group("Joy Sensitivity")
@export var horizontal_joy_sensitivity := 1.0
@export var vertical_joy_sensitivity := 1.0
@export_group("", "")

@onready var _arm := $spring_arm as SpringArm3D
@onready var w_camera := $spring_arm/c as Camera3D


func global_look_dir() -> float:
    return _arm.global_rotation.y


func look_dir() -> float:
    return _arm.rotation.y


func rotate_camera() -> void:
    var h := Input.get_axis(&"camera_left", &"camera_right")
    var v := Input.get_axis(&"camera_up", &"camera_down")

    _arm.rotation.y -= h * horizontal_joy_sensitivity
    _arm.rotation.x = clampf(_arm.rotation.x - v * vertical_joy_sensitivity,
        MIN_VERT, MAX_VERT)


func rotate_camera_mouse(e: InputEventMouseMotion) -> void:
    _arm.rotation.y -= e.relative.x * horizontal_mouse_sensitivity
    _arm.rotation.x = clampf(_arm.rotation.x - e.relative.y * vertical_mouse_sensitivity,
        MIN_VERT, MAX_VERT)
