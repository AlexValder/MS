extends "./player_state.gd"

@export var speed: float = 500.0

var _dir := Vector2.ZERO
@warning_ignore("unused_private_class_variable")
var _gravity := get_gravity()


func _update(delta: float) -> void:
    _dir = Input.get_vector(&"left", &"right", &"forward", &"backwards")
    var dir3 := Vector3(_dir.x, 0, _dir.y)

    if !agent.is_on_floor():
        get_root().dispatch(&"fall")

    if _dir.length() > 0:
        var dir_look := dir3.rotated(Vector3.UP, agent.look_dir())
        agent.rotate_body(atan2(dir_look.x, dir_look.z))

    var desired_velocity := dir3.rotated(Vector3.UP, agent.global_look_dir()) * speed * delta
    agent.move(desired_velocity)
