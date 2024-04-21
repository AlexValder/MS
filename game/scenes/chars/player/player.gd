extends CharacterBody3D
class_name Player

@onready var _camera := $camera as PlayerCamera
@onready var _model := $mesh as Node3D

var camera_standalone := true


func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var e := event as InputEventMouseMotion
        if camera_standalone:
            _camera.rotate_camera_mouse(e)
            return
        rotate_y(e.relative.x * 0.01)



func move(dir: Vector2) -> void:
    velocity = Vector3(dir.x, 0, dir.y)
    move_and_slide()
