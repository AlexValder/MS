extends CharacterBody3D
class_name Player

signal death(reason: GameManager.DEATH_REASON)

const DEATH_DEPTH := -100.0

@export var flashlight: Light3D
@export var push_force := 1.0

@onready var _camera := $camera as PlayerCamera
@onready var _model := $model as Node3D
@onready var _shape := $shape as CollisionShape3D

var flashlight_enabled: bool:
    get:
        return flashlight.visible if flashlight else false


func look_dir() -> float:
    return _camera.look_dir()


func global_look_dir() -> float:
    return _camera.global_look_dir()


func rotate_body(angle: float) -> void:
    _model.rotation.y = lerp_angle(_model.rotation.y, angle, 0.1)
    _shape.rotation.y = _model.rotation.y


func toggle_flashlight() -> void:
    if flashlight:
        flashlight.visible = !flashlight.visible


func move(dir: Vector3) -> void:
    velocity = dir
    move_and_slide()


func _ready() -> void:
    death.connect(GameManager.on_player_death)


func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var e := event as InputEventMouseMotion
        _camera.rotate_camera_mouse(e)
        get_tree().root.set_input_as_handled()
    elif event.is_action_pressed(&"flashlight"):
        toggle_flashlight()


func _physics_process(_delta: float) -> void:
    _camera.rotate_camera()

    if global_position.y <= DEATH_DEPTH:
        death.emit(GameManager.DEATH_REASON.OUT_OF_BOUNDS)
    else:
        _check_collisions()


func _check_collisions() -> void:
    var count := get_slide_collision_count()
    for i in count:
        var collision := get_slide_collision(i)
        var collider := collision.get_collider()
        if collider is RigidBody3D:
            collider.apply_central_impulse(-collision.get_normal() * push_force)
