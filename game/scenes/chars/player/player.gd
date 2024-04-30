extends CharacterBody3D
class_name Player

@onready var _camera := $camera as PlayerCamera
@onready var _model := $model as Node3D
@onready var _shape := $shape as CollisionShape3D


func look_dir() -> float:
    return _camera.look_dir()


func global_look_dir() -> float:
    return _camera.global_look_dir()


func rotate_body(angle: float) -> void:
    _model.rotation.y = lerp_angle(_model.rotation.y, angle, 0.1)
    _shape.rotation.y = _model.rotation.y


func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var e := event as InputEventMouseMotion
        _camera.rotate_camera_mouse(e)


func move(dir: Vector3) -> void:
    velocity = dir
    move_and_slide()


func _physics_process(_delta: float) -> void:
    _camera.rotate_camera()
