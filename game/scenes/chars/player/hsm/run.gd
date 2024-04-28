extends LimboState

@export var animation_player: AnimationPlayer
@export var animation: StringName
@export var speed: float = 500.0


func _enter() -> void:
    animation_player.play(animation, 0.1)
    agent.camera_standalone = false


func _update(delta: float) -> void:
    var dir := Input.get_vector(&"left", &"right", &"forward", &"backwards")
    var dir3 := Vector3(dir.x, 0, dir.y)

    if dir.length() > 0:
        var dir_look := dir3.rotated(Vector3.UP, agent.look_dir())
        agent.rotate_body(atan2(dir_look.x, dir_look.z))

    var desired_velocity := dir3.rotated(Vector3.UP, agent.global_look_dir()) * speed * delta
    agent.move(desired_velocity)

    if is_zero_approx(dir.length()):
        get_root().dispatch(EVENT_FINISHED)
